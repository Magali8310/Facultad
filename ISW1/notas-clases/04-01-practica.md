# Clase práctica martes 01/04

## Clase
Concepto de Class/Clase: Son ideas, por ejemplo Bill y Bob son instancias que responden a la idea de "Zombie". Zombie es la clase, Bill y Bob son instancias de la clase. Instanciar un objeto de una clase equivale a "materializar una idea". (esto dijo que no nos preocupemos mucho, que la práctica va más adelantada que la teórica, y que ya lo va a explicar bien Hernán)

## Eliminación de código repetido
Se generaliza a los siguientes pasos: \\
0) Identificar que parte del código se repite (esto no es mecánico ni trivial).
1) Copiar lo repetido a una nueva abstracción (llámese método).
2) Parametrizar lo que cambia entre las distintas repeticioens.
3) Nombrar la nueva abstracción (esto no es mecánico ni trivial, y es el paso más importante según la cátedra).
4) Reemplazar el código repetido por la nueva abstracción. \\

Hacer todo esto además de eliminar código repetido, aporta legilibilidad al código (siempre y cuando los nombres de las abstracciones sean buenos). 

## Notas para la ejercitación
- Hay un conjunto de tests que si los corremos tal y como están en el archivo .st, pasan. La idea es identificar código repetido (EN LOS TESTS!!!) y hacer los pasos """mecánicos""" (ponele).
- Luego de las abstracciones que hayamos hecho, los tests deben seguir pasando claramente, sino algo en la abstracción está mal programado.
- Lo que se testea es una clase, así que se usa el System/Class Browser y no el Denotative Object Browser. (nos damos cuenta pq al hacer filein se abre solo supuestamente).
- Hay una diferencia entre métodos de instancia y métodos de clase. Personalmente no los entendí, pero si apretás los botones de "instance" y de "class" del Class Browser podés ver los dos tipos.
