# Notas de Smalltalk Best Practices - Method Object - Kent Beck 1997

## Problema
Métodos con muchas lineas de código que comparten parámetros.


## Solución
Crear objeto que representa la invocación del método. Los parámetros compartidos pasan a ser variables de instancia del objeto. 

## Patrón de diseño
Definir variables de instancia por cada parámetro y variable temporal.
Crear constructor que recive el receptor original junto con los argumentos.
Crear método #compute copiando el código del método original
Reemplazar el código del método original por la creación del method object y un llamado a #compute.
1. Crear clase nombrada según el método.
2. Definir variables de instancia por cada parámetro y variable temporal.
3. Crear constructor que recibe el receptor original junto con los argumentos.
4. Crear método #compute copiando el código del método original
5. Reemplazar el código del método original por la creación del method object y un llamado a #compute.

 