#Entrega 2

Ambos archivos se ejecutan de la misma manera

_python3 parteA.py input.txt output.txt_

_python3 parteB.py input.txt output.txt_

##Parte A

Para la parte A primero ejecuto mi función de la entrega 1. Es exactamente la misma lógica y biblioteca, uso pulp para minimizar el costo de la asignación de los paquetes a los nodos.

El VRP solver lo llamo una vez por nodo si es que tiene paquetes a entregar ese nodo. Si bien probablemente sea más óptimo llamar una sola vez al VRP solver, llamarlo una vez por nodo parece ser que reduce las chances de que encuentre rutas inválidas (me paso al querer implementarlo así). En el código de esta parte hay un comentario con la página que use para ayudarme.


##Parte B

Para la parte B modifique el cálculo de los costos de asignar los paquetes a un nodo. Antes solo consideraba el costo de enviar el paquete al nodo i, ahora considero también la distancia del nodo i al destino del paquete j. Para esto generó una matriz de distancia eucledianas (si fuera una ciudad tendría quizás más sentido usar la manhattan), y se la paso como parámetro a la función _optimize asignation cost_.

Esto no me garantiza rutas óptimas, no estoy considerando el costo de que cada paquete que se asigna a un nodo nuevo y cada vez que excedo la capacidad de un vehículo debo pedir otro. Estos costos podrían afectar la solución óptima en algunos casos.

La resolución del problema de ruteo en sí se mantiene igual. 
