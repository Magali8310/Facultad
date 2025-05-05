# Notas de No Silver Bullet - Frederick Brooks 1986

## Tareas
- Escenciales: adaptar problemas complejos y conceptuales a entidades de software **abstractas**. 
- Accidentales: representar las entidades abstractas en **lenguajes de programación**, con limitaciones de tiempo y espacio.

## Problema
El hardware cada vez cuesta menos, pero el desarrollo de software no parece mejorar en cuanto a productividad, confiabilidad y simplicidad. Según el autor, estos cambios jamás sucederán.

## Escencia del software
Construcción de conceptos interconectados. Conjuntos de datos, relaciones entre datos, algoritmos, funciones, etc.. Esto se puede realizar con precisión. Lo que le parece difícil es la especifiación, diseño y testeo de este constructo, no su representación. Los errores de sintaxis son ruido al lado de los errores conceptuales de los sistemas. (Esto es lo que hace que el software sea difícil, es un proceso de aprendiazaje como dice Naur). 

## Propiedades inherentes a la escencia de un sistema de software
### Complejidad
Cada parte por más pequeña que sea es muy compleja. No hay dos partes iguales, (si las hay usamos subrutinas por ejemplo). La computadora tiene una cantidad de estados extremadamente grande, y los sistemas de software tienen una cantidad exponencialmente mayor.


### Conformidad
La complejidad es arbitraria, formada por humanos y sistemas que además cambian con el tiempo. Se debe adaptar a las diferentes interfaces. 

### Cambiabilidad
Cosas manufacturadas no cambian luego de su contrucción, el software sí. Tanto para adaptarse a nuevas funcionalidades, como a nuevo hardware. 

### Invisibilidad 
No se puede visualizar ni representar, al menos no de forma unívoca con un solo diagrama. Esto dificulta el proceso mental de diseño, y la comunicación entre diseñadores.


## Dificultades accidentales resueltas
### Lenguajes de alto nivel
Liberan al programador de mucha complejidad accidental, como registros, bits, discos, etc. 


### Time-sharing (multiprogramación)
Permite despreocuparse de temas temporales, y mejora tiempo de respuesta de las computadoras.

### Entornos de desarrollo unificados
Unix, tiene bibliotecas integradas, formatos de archivos estandar.

