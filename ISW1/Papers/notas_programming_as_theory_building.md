# Notas de Programming as Theory Building - Peter Naur 1985

# Idea
Programar no es producir programas, es una actividad para adquirir conocimiento sobre uan teoría.


## Programación y conocimiento del programador
### Matcheo
Hay que matchear aspectos de una actividad real en simbolos de un lenguaje formal que puede interpetar una computadora.
Programar es principalmente construir conocimiento de algun tipo, la documentación es secundaria.

### Caso 1 - Compilador
Grupo A programa compilador de L para maquina X. Un grupo B quiere hacer uno para la expansión L+M para máquina Y. Las ideas del grupo B son rechazadas por el grupo A pq rompen el patrón y simplicidad original. El grupo A tiene la teoría, el B tiene documentación la cual es insuficiente. Luego el grupo B continua sin ayuda de A, y el producto final dejar ver rastros del compilador original, pero tiene parches amorfos.

### Caso 2 - Real-Time system de monitoreo industrial
Lo mismo, el grupo de programadores que tiene la teoría puede contestar preguntas cuya respuesta no se encuentra documentada.


## Teoría según Ryle's 
Tener una teoría es saber como hacer ciertas cosas y poder dar explicaciones, justificaciones y respuestas a consultas de la actividad en cuestión. 

### Actividad inteligente $\neq$ Actividad intelectual
La inteligente es la habilidad de hacer ciertas cosas bien según algun criterio, sin seguir alguna regla necesariamente. Para la actividad intelectual se requiere tener la teoría con lo que esto significa, y no se puede expresar con reglas. Aquel que tiene la teoría la puede aplicar a nuevos fenómenos encontrando las similitudes que correspondan.


### Caso programador
La teoría a construir es: como ciertos temas del mundo real pueden ser manejados por un programa de computadora. Esto es lo principal del Theory Building View. El conocimiento del programador trasciende a aquel que se documenta en tres cosas:
1. El programador puede explicar la relacion programa - mundo real.
2. Puede explicar pq cada parte del programa es como es.
3. Puede agregar modificaciones a demanda.

## Modificación de programas
El software SIEMPRE es modificado. No siempre lo menos costoso es modificar el programa existente, a veces es formar la nueva teoría. Un programa flexible es muy caro. En TBV cuando surge una modificación a realizar, se analiza la solución actual y se determinan similitudes con la modificación. Esto solo lo puede hacer alguien con la teoría de la solución actual. Una persona sin la teoría haría un parche, mientras que una que la tiene lo integraría siguiendo la idea general de la solución.


## Vida, muerte y resurrección de programas
Según TBV, la parte escencial de un programa está ligada a los humanos no al texto. En la vida del programa, sus programadores con la teoría lo mantienen. En la muerte este grupo se disuelve, nadie puede responder consultas sobre el mismo. Se lo revive cuando se reconstruye la teoría por otro grupo. Para esto es OBLIGATORIO tener contacto con personas del grupo original. Intenarlo solo con documentación y código es IMPOSIBLE. Por lo tanto revivir un programa es costoso y se  debe implementar en situaciones excepcionales.


## Relación TBV-Métodos de programación 
Un método es un conjunto de relgas de trabajo para los programadores. Ven el proceso como una secuencia de acciones que se van documentando. Para TBV no puede existir esto, pq no hay una secuencia de acciones definida para formar una teoría.

## Estado del programador
A veces se lo ve como un componente más de la producción de un producto, que puede ser controlado por ciertas reglas y es fácilmente reemplazable. En TBV esto no es así, no es rápido construir una teoría y se le debe dar una posición permanente.