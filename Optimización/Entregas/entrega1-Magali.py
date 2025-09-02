import pulp
import sys
#############################################################################

def read_input(file):
  #readline lee la primera linea del file
  #split use el espacio para separar en palabras
  #devuelve un arreglo de palbras
    line = file.readline().split()
    n, m = int(line[0]), int(line[1])

  #si lee dos 0 es que ya no hay más instancias
    if n == 0 and m == 0:
        return 0, 0, 0, [], [], {}

  #Lee el costo promedio de entregar un paquete desde el service center
  #Ese valor se llama S
    S = float(file.readline())

  #Defino una lista de capacidad y otra de costo para cada nodo
    capacities = []
    costs = []

  #Itero sobre los n nodos
  #Almaceno su capacidad y costo
    for _ in range(n):
        # Lee capacidad como entero y costo como float
        capacity, cost = file.readline().split()
        capacities.append(int(capacity))
        costs.append(float(cost))

  #Defino un diccionario para la cobertura
    coverage = {}
  #Itero por cada nodo
    for i in range(n):
      #Transformo a cada elemento leido en un entero con map
        data = list(map(int, file.readline().split()))
      #Acá guardo para el nodo i, que paquetes puede entrgar
        coverage[i] = data[1:]

    return n, m, S, capacities, costs, coverage

#####################################################################
def main():
  if len(sys.argv) != 3:
        print("Formato de llamada incorrecto")
        sys.exit(1)
  
  input_path = sys.argv[1]
  output_path = sys.argv[2]
  
  solutions = []
  
  with open(input_path, 'r') as input_file:
    while True:
      # Leo input
      n, m, S, capacities, costs, coverage = read_input(input_file)

      if n == 0:
        break

      # Considero al SVC el nodo n+1 con costo S, capacidad m (PODRIA SER MAYOR) y coverage de todos los paquetes
      costs.append(S)
      capacities.append(m)
      coverage[n] = list(range(m))
      n = n + 1

      model = pulp.LpProblem("Delivery_Cost_Optimization", pulp.LpMinimize)

      # Defino las variables, cada variable representa entrage el paquete j en el nodo i. Solo si es posible.
      deliver = pulp.LpVariable.dicts("Deliver_Package_In_Node",[(j, i) for i in range(n) for j in coverage[i]], cat='Binary')

      #Quiero minimzar el costo de entregar los paquetes, para eso tengo que elegir donde los entrego
      model += pulp.lpSum(deliver[(j, i)] * costs[i] for i in range(n) for j in coverage[i]), "Total_Cost"

      #Cada nodo no puede entrgar más paquetes que su capacidad
      for i in range(n):
          model += pulp.lpSum(deliver[(j, i)] for j in coverage[i]) <= capacities[i], f"Capacity_{i}"

      #Cada paquete j tiene que ser entrgado a un único nodo
      for j in range(m):
          #Ese nodo tiene que poder entrgarlo
          model += pulp.lpSum(deliver[(j, i)] for i in range(n) if j in coverage[i]) == 1, f"Package_{j}"


      # Resuelvo
      model.solve()
      solutions.append((model, deliver, n, m, coverage))
  #Escribo el output
  with open(output_path, "w") as f:
    for instance_index, (model, deliver, n, m, coverage) in enumerate(solutions, start=1):
        f.write(f"Caso {instance_index}\n")
        f.write(f"{pulp.value(model.objective):.2f}\n")
        for j in range(m):
          for i in range(n):
            if j in coverage[i] and pulp.value(deliver[(j, i)]) == 1:
              r = i if i != n-1 else -1
              f.write(f"{j} {r}\n")
              break


main()