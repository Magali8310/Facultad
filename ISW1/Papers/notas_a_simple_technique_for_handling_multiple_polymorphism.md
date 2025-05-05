# Notas de A Simple Technique For Handling Multiple Polymorphism - Ingalls 1986

### Problema
Hay situaciones donde no queda otra que "multiplicar" expresiones polimórficas. Esto significa que más de una variable de la expresión es independientemente polimórfica. La POO falla en estos casos y da lugar a código que no es modular.


### Solución procedural
Testear el tipo de datos de un objeto y en base a eso ejecutar la función correspondiente. Esto rompe la modularidad y la complejidad aumenta exponencialmente.

### Mensajes
El envío de mensajes evita que haya que testear por tipo, y permite modularizar el código en los métodos de cada tipo/clase. El polimorfismo está en que dado un mismo mensaje, el receptor es variable. En el caso de "multiplicar" las expresiones polimórficas, vuelve el problema de la modularidad y complejidad.

### Solución    
En escencia cada transmisón de mensaje reduce una variable poliórfica a una monomórfica. Es decir se define el tipo de la variable. <br>
Cuando en el envío de un mensaje hay un parámetro polimórfico, esto indica que para reducirlo a uno monomórfico hay que enviar un nuevo mensaje. Este mensaje se llama de retransmión (relay). Este segundo mensaje debe preservar la información que se obtuvo en el primer mensaje, es decir preservar de que tipo es el receptor.
