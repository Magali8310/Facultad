# Notas de Polymorphic Hierarchy - Woolf 1996

### Template Class
La clase más alta en una jerarquía polimorfica.


## Descripciones de métodos
### Reutilizarlas
See superimplementor. Esta descripción significa que semánticamente un método hace lo mismo que lo que hace su padre, por lo tanto la descripción es la misma y no hace falta escribir una nueva.

### Anatomía
1. Evitar parafrasear el nombre del método. 
2. A veces una descripción se termina convirtiendo en el nombre de un nuevo método.
3. Debe explicar el propósito del método, rara vez sus detalles implementativos. El propósito es reutilizable. 


## Polimorfismo
No tiene sentido tratar de entender una clase sin primero entender sus superclase. Al crear una subclase se debe pensar en como debe diferir de su superclase. <br>
Una superclase normalmente define QUE se debe hacer, y las subclases definen COMO.<br>
Cuando todos los *implementors* en una jerarquía tienen el mismo propósito, son polimórficos. Cuando todos las métodos que las sublcases subimplementan son polimórficos con sus versiones heredas, la jerarquía es polimórfica.


### Implementando una jerarquía polimórfica
En el caso que dos métodos tengan el mismo propósito:
- Si uno está subimplementando otro, su descripción es "See superimplementor"
- Si son clases "hermanas", se agrega un superiplmenetor con comportamiento default.
- Si no tienen relación, hay que crear una jerarquía con una clase abstracta que sea padre de ambas clases. Esta clase se llama **Template Class* y el método creado es un **Template Method**.

### Métodos polimórficos
Para serlo se tiene que cumplir que tengan:
- Mismo nombre
- Mismo tipo de parámetros
- Mismos *side-effects*.
- Mismo tipo de retorno.

