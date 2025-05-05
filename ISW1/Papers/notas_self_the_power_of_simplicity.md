# Notas de Self: The Power Of Simplicty - Ungar & Smith 1987

## Estructura
- Prototipos: combinan **herencia e instanciación**.
- Slots: unen **variables y funciones**
- Comportamiento = Estado.

## Características
- Exploratory programming
  - Runtime typing
  - Automatic Storage Reclamation

## Principios
### Messages-at-the-bottom
Pasaje de mensajes es la operación fundamental. Los estados internos se acceden con mensajes. <br>
No hay variables, solo slots con objetos que se devuelven a si mismos.


### Occam's Razor
Se trata de mantener la simplicidad y coherencia de la metáfora:
- No hay clases ni variables.
- Cada objeto es una instancia o almacena datos.
- No hay distinción entre acceder a una variable y mandar un mensaje.
- Los objetos se crean **clonando** 
- No hay estructuras de control
- Los procedures y closures son prototipos también, heredan de los **activation records**.


### Concreteness
Los elementos son lo más concreto posible. No tiene clases las cuales son *abstractas*.  Un prototipo es un **ejemplo** del objeto, una clase es una descripción.


## Prototipado
Cada objeto tiene slots con nombre que almacenan estado o comportamiento. Si un objeto recibe un mensaje que no concuerda con ningun slot, lo busca mediante el **parent pointer**, es decir, se emplea la delegación. <br>
La única relación entre objetos es "**hereda de**" (no existe el "es instancia de" de poo).

### Singletons
Tiene más sentido tener un prototipo de un objeto único, que tener una clase para solo instanciar un objeto.

### Meta-Regresión
Las clases tienen repesentan una metaclase, y esta a su vez a una metametaclase, y así... ¿Entonces cuál es la clase raíz? Esto no ocurre en prototipos. 

### Herencia + Prototipado
Cuando se quiere tener comportamiento compartido, se crea un objeto que juega el rol de clase, pero que solamente contiene el comportamiento a heredear.


## Closures y métodos
Son prototipos de **activation records** los cuales tienen slots *arg* y *code*. Cuando un emisor envía un mensaje a un receptor, se clona un activation record y:
- En *arg* se copian los argumentos del mensaje
- En *code* se clona el código del método/closure
- En *parent* se guarda una referencia al receptor del mensaje. De esta forma cuando no se encuentra un slot, se continúa la búsqueda en el padre. 

Luego de estas asignaciones, se procede a ejecutar el código. 