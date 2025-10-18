import matplotlib.pyplot as plt

def read_input_coordinates(path):
    with open(path, "r") as f:
        # Leer las primeras 2 líneas para obtener n y m
        n, m = map(int, f.readline().split())
        S = float(f.readline())  # línea 2

        # Saltar las siguientes líneas hasta llegar a coordenadas
        for _ in range(n):  # capacidades y costos
            f.readline()
        for _ in range(n):  # coverage
            f.readline()
        f.readline()  # v_capacity
        f.readline()  # v_cost_fixed y v_cost_package

        # Ahora vienen las coordenadas de nodos (n + 1 líneas, incluye -1)
        cordinates_nodes = {}
        for _ in range(n + 1):
            line = f.readline().split()
            cordinates_nodes[int(line[0])] = (float(line[1]), float(line[2]))

        # Luego vienen las coordenadas de paquetes (m líneas)
        cordinates_packages = {}
        for _ in range(m):
            line = f.readline().split()
            cordinates_packages[int(line[0])] = (float(line[1]), float(line[2]))

    return cordinates_nodes, cordinates_packages

def plot_input(path):
    nodes, packages = read_input_coordinates(path)

    plt.figure(figsize=(8, 6))

    for node_id, (x, y) in nodes.items():
        if node_id == -1:
            plt.scatter(x, y, c="red", marker="*", s=200,
                        label="Service Center" if "Service Center" not in plt.gca().get_legend_handles_labels()[1] else "")
        else:
            plt.scatter(x, y, c="blue", marker="o", s=100,
                        label="Nodo" if "Nodo" not in plt.gca().get_legend_handles_labels()[1] else "")
        plt.text(x + 1, y + 1, str(node_id), fontsize=9)

    # Paquetes
    for pkg_id, (x, y) in packages.items():
        plt.scatter(x, y, c="green", marker="^", s=80,
                    label="Paquete" if "Paquete" not in plt.gca().get_legend_handles_labels()[1] else "")
        plt.text(x + 1, y + 1, str(pkg_id), fontsize=8)

    plt.xlabel("X")
    plt.ylabel("Y")
    plt.title("Ubicación")
    plt.legend()
    plt.grid(True)
    plt.show()

# Ejemplo de uso
plot_input("input.txt")
