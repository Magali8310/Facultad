import pulp
import sys
import math
from ortools.constraint_solver import routing_enums_pb2
from ortools.constraint_solver import pywrapcp

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
    v_cost_fixed, v_cost_package = map(float, file.readline().split())

    cordinates_nodes = {}
    for i in range(n + 1):
        idx, x, y = map(float, file.readline().split())
        cordinates_nodes[int(idx)] = (x, y)

    cordinates_packages = {}
    for i in range(m):
        idx, x, y = map(float, file.readline().split())
        cordinates_packages[int(idx)] = (x, y)

    return n, m, S, capacities, costs, coverage, v_capacity, v_cost_fixed, v_cost_package, cordinates_nodes, cordinates_packages

def optimize_assignment(n, m, S, capacities, costs, coverage):
    costs.append(S)
    capacities.append(m)
    coverage[n] = list(range(m))
    n += 1

    model = pulp.LpProblem("Delivery_Cost_Optimization", pulp.LpMinimize)
    deliver = pulp.LpVariable.dicts("Deliver", [(j, i) for i in range(n) for j in coverage[i]], cat="Binary")

    model += pulp.lpSum(deliver[(j, i)] * costs[i] for i in range(n) for j in coverage[i])

    for i in range(n):
        model += pulp.lpSum(deliver[(j, i)] for j in coverage[i]) <= capacities[i]

    for j in range(m):
        model += pulp.lpSum(deliver[(j, i)] for i in range(n) if j in coverage[i]) == 1

    model.solve()
    return model, deliver

def get_assignment(n, m, coverage, deliver):
    assignment = [0] * m
    for j in range(m):
        for i in range(n + 1):
            if j in coverage[i] and pulp.value(deliver[(j, i)]) == 1:
                assignment[j] = i if i != n else -1
                break
    return assignment

def get_node_data(node_id, assignment, cordinates_nodes, cordinates_packages, capacity):
    packages = [i for i, n in enumerate(assignment) if n == node_id]
    if not packages:
        return None

    locations = [cordinates_nodes[node_id]] + [cordinates_packages[p] for p in packages]
    distance_matrix = [[math.dist(locations[i], locations[j]) for j in range(len(locations))] 
                       for i in range(len(locations))]

    return {
        "distance_matrix": distance_matrix,
        "num_vehicles": len(packages),
        "depot": 0,
        "demands": [0] + [1] * len(packages),
        "vehicle_capacities": [capacity] * len(packages),
        "packages": packages,
    }

def solve_cvrp(data):
    manager = pywrapcp.RoutingIndexManager(len(data["distance_matrix"]), data["num_vehicles"], data["depot"])
    routing = pywrapcp.RoutingModel(manager)

    def distance_callback(from_index, to_index):
        from_node, to_node = manager.IndexToNode(from_index), manager.IndexToNode(to_index)
        return data["distance_matrix"][from_node][to_node]

    transit_callback_index = routing.RegisterTransitCallback(distance_callback)
    routing.SetArcCostEvaluatorOfAllVehicles(transit_callback_index)

    def demand_callback(from_index):
        return data["demands"][manager.IndexToNode(from_index)]

    demand_callback_index = routing.RegisterUnaryTransitCallback(demand_callback)
    routing.AddDimensionWithVehicleCapacity(demand_callback_index, 0, data["vehicle_capacities"], True, "Capacity")

    search_params = pywrapcp.DefaultRoutingSearchParameters()
    search_params.first_solution_strategy = routing_enums_pb2.FirstSolutionStrategy.PATH_CHEAPEST_ARC

    solution = routing.SolveWithParameters(search_params)
    return solution, routing, manager

def get_routes(solution, routing, manager, data):
    routes = []
    for vehicle_id in range(data["num_vehicles"]):
        index = routing.Start(vehicle_id)
        route = []
        while not routing.IsEnd(index):
            node = manager.IndexToNode(index)
            if node != 0:
                route.append(data["packages"][node - 1])
            index = solution.Value(routing.NextVar(index))
        if route:
            routes.append(route)
    return routes

def main():
    if len(sys.argv) != 3:
        print("Formato de llamada incorrecto")
        sys.exit(1)

    input_path, output_path = sys.argv[1], sys.argv[2]

    with open(input_path, "r") as input_file, open(output_path, "w") as output_file:
        case_number = 1
        while True:
            data = read_input(input_file)
            n, m = data[0], data[1]
            if n == 0:
                break

            model, deliver = optimize_assignment(*data)
            assignment = get_assignment(n, m, data[5], deliver)

            output_file.write(f"Caso {case_number}\n")
            case_number += 1

            total_vehicles = 0
            routes_info = []
            
            for node_id in range(n + 1):
                node_data = get_node_data(node_id-1, assignment, data[9], data[10], data[6])
                if not node_data:
                    continue

                solution, routing, manager = solve_cvrp(node_data)
                routes = get_routes(solution, routing, manager, node_data)
                routes_info.append((node_data, routes))
                total_vehicles += len(routes)

            total_cost = pulp.value(model.objective) + total_vehicles * data[7] + m * data[8]
            output_file.write(f"{total_cost}\n{total_vehicles}\n")

            for node_data, routes in routes_info:
                output_file.write(f"{node_data['depot']} {len(routes)}\n")
                for route in routes:
                    output_file.write(" ".join(map(str, sorted(route))) + "\n")

main()