import pulp, sys, math
from ortools.constraint_solver import routing_enums_pb2, pywrapcp

#############################################################################
##################### Elegí usar Google OR-Tools ############################
#############################################################################


#############################################################################
############## Esta función lee el archivo de input.txt #####################
#############################################################################

def read_input(file):
    line = file.readline().split()
    n, m = int(line[0]), int(line[1])

    if n == 0 and m == 0:
        return 0, 0, 0, [], [], {}, 0, 0, 0, {}, {}

    S = float(file.readline())

    capacities, costs = [], []
    for _ in range(n):
        capacity, cost = file.readline().split()
        capacities.append(int(capacity))
        costs.append(float(cost))

    coverage = {}
    for i in range(n):
        data = list(map(int, file.readline().split()))
        coverage[i] = data[1:]

    v_capacity = int(file.readline())

    line = file.readline().split()
    v_cost_fixed, v_cost_package = float(line[0]), float(line[1])

    cordinates_nodes = {}
    for i in range(n + 1):
        line = file.readline().split()
        cordinates_nodes[int(line[0])] = (float(line[1]), float(line[2]))

    cordinates_packages = {}
    for i in range(m):
        line = file.readline().split()
        cordinates_packages[int(line[0])] = (float(line[1]), float(line[2]))

    return n, m, S, capacities, costs, coverage, v_capacity, v_cost_fixed, v_cost_package, cordinates_nodes, cordinates_packages

#############################################################################
############# Misma función que entregue en el problema 1 ###################
#############################################################################

def optimize_asignation_cost(n, m, S, capacities, costs, coverage):
    # Añado el service center como un nodo más
    # El nodo n es el service center ahora
    costs.append(S)
    capacities.append(m)
    coverage[n] = list(range(m))
    n = n + 1

    model = pulp.LpProblem("Delivery_Cost_Optimization", pulp.LpMinimize)

    deliver = pulp.LpVariable.dicts(
        "Deliver_Package_In_Node",
        [(j, i) for i in range(n) for j in coverage[i]],
        cat="Binary"
    )

    model += pulp.lpSum(deliver[(j, i)] * costs[i] for i in range(n) for j in coverage[i]), "Total_Cost"

    for i in range(n):
        model += pulp.lpSum(deliver[(j, i)] for j in coverage[i]) <= capacities[i], f"Capacity_{i}"

    for j in range(m):
        model += pulp.lpSum(deliver[(j, i)] for i in range(n) if j in coverage[i]) == 1, f"Package_{j}"

    model.solve()

    #Devuelvo el modelo y el diccionario en el cual estan los valores de las variables
    return model, deliver

#############################################################################
###### Esta función devuelve para cada paquete a que nodo fue asignado ###### 
#############################################################################

def get_package_asignation(n, m, coverage, deliver):
    asignacion = [0] * m
    for j in range(m):
        for i in range(n + 1):
            if j in coverage[i] and pulp.value(deliver[(j, i)]) == 1:
                asignacion[j] = i if i != n else -1
                break
    return asignacion

#############################################################################
####### Esta función prepara la data que estará utilizando el solver ########
#############################################################################
def get_data_for_node(node_id, asignacion, cordinates_nodes, cordinates_packages, capacity, n):
    
    #Paquetes a entregar desde el nodo dado por node_id
    packages_to_deliver = [i for i, n in enumerate(asignacion) if n == node_id]
    
    #Si un nodo no tiene paquetes, lo salteo
    if not packages_to_deliver:
        return None

    # Genero el vector de distnacias, podría usarse una matriz y llamar solo una vez al solver creo
    # Por ahora, utilizo esta versión
    locations = [cordinates_nodes[node_id]] + [cordinates_packages[p] for p in packages_to_deliver]
    distance_vector = [
        [math.dist(locations[i], locations[j]) for j in range(len(locations))]
        for i in range(len(locations))
    ]

    data = {
        #Dado que tengo una asignación previa que tengo que respetar
        #Solo estoy viendo desde un nodo por vez
        # Así que uso un vector de distancias que tiene la distancias del nodo dado al destino de los paquetes asignados
        # Creo que también se podría optimizar más aprovechando numpy
        "distance_matrix": distance_vector,
        #Como mucho usaría un vehiculo por paquetes
        #Podría haber hecho cantidad de paquetes dividido capacidad del vehiculo
        #Sería más eficiente hacer eso en un caso real, pero en este que es de juguete lo dejo así
        "num_vehicles": len(packages_to_deliver),
        #Cuando usaba node_id acá andaba bien, salvo para el caso de id -1. No soporta numeros negativos. 
        # Si uso n, estaría buscando fuera de la matriz creo.
        # Resultado, dejo fijo el depot en 0. Recupero el node_id por afuera 
        "depot": 0, 
        #Todos los nodos tienen demanda 1 en este problema
        #Salvo el nodo de origen
        "demands": [0] + [1] * len(packages_to_deliver),
        #Lista con la capacidad de cada vehiculo, son todos iguales en este caso
        "vehicle_capacities": [capacity] * len(packages_to_deliver),
        #Los inidices reales de los paquetes que salen de este nodo
        "packages": packages_to_deliver,
    }
    return data

#######################################################################################
############# Esta función resuleve el problema llamando al solver ####################
#######################################################################################

#Toma el diccionario preparado más arriba
#https://developers.google.com/optimization/routing/cvrp?hl=es-419 me ayude con esta página

def solve_CVRP(data):
    manager = pywrapcp.RoutingIndexManager(len(data["distance_matrix"]), data["num_vehicles"], data["depot"])
    routing_model = pywrapcp.RoutingModel(manager)

    def distance_callback(from_index, to_index):
        return data["distance_matrix"][manager.IndexToNode(from_index)][manager.IndexToNode(to_index)]

    transit_callback_index = routing_model.RegisterTransitCallback(distance_callback)
    routing_model.SetArcCostEvaluatorOfAllVehicles(transit_callback_index)

    def demand_callback(from_index):
        return data["demands"][manager.IndexToNode(from_index)]

    demand_callback_index = routing_model.RegisterUnaryTransitCallback(demand_callback)
    routing_model.AddDimensionWithVehicleCapacity(demand_callback_index, 0, data["vehicle_capacities"], True, "Capacity")

    search_parameters = pywrapcp.DefaultRoutingSearchParameters()
    search_parameters.first_solution_strategy = routing_enums_pb2.FirstSolutionStrategy.PATH_CHEAPEST_ARC

    routes_assignement = routing_model.SolveWithParameters(search_parameters)
    return routes_assignement, routing_model, manager

#############################################################################
############### Devuelve las rutas como lista de paquetes ###################
#############################################################################
def get_routes(routes_assignment, routing_model, manager, data):
    routes = []
    for vehicle_id in range(data["num_vehicles"]):
        index = routing_model.Start(vehicle_id)
        if routing_model.IsEnd(routes_assignment.Value(routing_model.NextVar(index))):
            continue
        route = []
        while not routing_model.IsEnd(index):
            node = manager.IndexToNode(index)
            if node != 0: 
                route.append(data["packages"][node - 1])
            index = routes_assignment.Value(routing_model.NextVar(index))
        routes.append(route)
    return routes

#############################################################################
############################ Calcula costos #################################
#############################################################################

# Toma el costo de cada vehiculo, cantidad de vehiculos usados
# El costo de cada paquete y la canitdad 
# Y el costo de la asignación total de la asignacion total

def get_total_costs(m, v_cost_fixed, v_cost_package, model, total_vehicles_used):
    return pulp.value(model.objective)+total_vehicles_used*v_cost_fixed+v_cost_package*m

#############################################################################
################# Escribe el output en el archivo dado ######################
#############################################################################
def write_output(output_file, case_number, m, v_cost_fixed, v_cost_package, model, total_vehicles_used, total_routes ,routes_information):
    output_file.write(f"Caso {case_number}\n")
    case_number += 1
    output_file.write(f"{get_total_costs(m, v_cost_fixed, v_cost_package, model, total_vehicles_used)}\n")
    output_file.write(f"{total_routes}\n")
    for routes_assignment, routing_model, manager,data, routes, node_id in routes_information:
        output_file.write(f"{node_id} {len(routes)}\n")
        for i in range(len(routes)):
            output_file.write(" ".join(map(str, sorted(routes[i]))) + "\n")

#############################################################################
########################### Pone todo junto #################################
#############################################################################
def main():
    if len(sys.argv) != 3:
        print("Formato de llamada incorrecto")
        sys.exit(1)

    input_path, output_path = sys.argv[1], sys.argv[2]

    with open(input_path, "r") as input_file, open(output_path, "w") as output_file:
        case_number = 1
        while True:
            n, m, S, capacities, costs, coverage, v_capacity, v_cost_fixed, v_cost_package, cordinates_nodes, cordinates_packages = read_input(input_file)
            if n == 0:
                break

            model, deliver = optimize_asignation_cost(n, m, S, capacities, costs, coverage)
            asignacion = get_package_asignation(n, m, coverage, deliver)

            total_routes = 0
            total_vehicles_used = 0
            routes_information = []
            
            for node_id in range(-1, n):
                data = get_data_for_node(node_id, asignacion, cordinates_nodes, cordinates_packages, v_capacity, n)
                if data is None:
                    continue

                routes_assignment, routing_model, manager = solve_CVRP(data)
                routes = get_routes(routes_assignment, routing_model, manager, data)
                routes_information.append((routes_assignment, routing_model, manager, data, routes, node_id))
                total_routes += 1
                total_vehicles_used += len(routes)


            write_output(output_file, case_number, m, v_cost_fixed, v_cost_package, model, total_vehicles_used, total_routes, routes_information)


main()
