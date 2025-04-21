# Notas de The Null Object Pattern - Booby Woolf 1996

## Objetivo
Proponer un reemplazo a tener que creer objetos que tengan una determinada interfaz pero que no hagan nada. Este es el Null Object.

## Ejemplo MVC
La View usa su Controller para obtener input. Si la vista no requiere input, no requiere controller. La clase View lo requiere , pero la instancia particular no. Una solución propuesta es que el colaborador controller de la vista sea Nil, pero al enviarle un mensaje va a haber error. Otra opción es que el Controller tenga modo *read* y modo *edit*, pero es innecesario si siempre va a ser alguna de las dos sin switchear nunca. Finalmente se propone crear una subclase de Controller, el NoController que tiene la misma interfaz de Controller, pero enviarle al enviarle cualquier mensaje no hace nada. NoController es un ejemplo de Null Object Pattern.

## Usos
- Cuando se requiere estrictamente un colaborador, no se agrega uno para que sea null.
- Cuando se requiere que un colaborador no haga nada
- Cuando se quiere evitar chequear tipo de colaborador.
- Cuando se busca este comportamiento en multiples instancias.

En caso de haber más de una forma de "hacer nada", puede haber más de un Null Object.

## Estructura
![](assets/null_object_structure.png)


## Consecuencias
- Nuevas estructuras jerárquicas.
- Simplifica el código del "cliente" (clases que pueden tinen Real/Null object como colaborador). Ambos tipos se tratan uniformemente.
- Se pueden programar el Null Object para hacer nada "eficientemente", es decir no caer en calcular algo para no usarlo por ejemplo.
- Retuilizable
- Puede requerir crear un NullObject por cada AbstractObject class.

## Implementación
- Puede ser un Singleton, pues como no mantiene un estado, cada instancia de la clase sería idéntica.
- Para evitar pasar de una RealObject class, a Abstract, Real y Null Object classes, se puede implementar la Null como instancia especial de la Real. Esto se hace poniendo todas sus variables en null por ejemplo. 
- CONSULTAR PUNTO 3-
- No se puede transformar un NullObject en un RealObject. Si se requiere esto, debería haber solo Real con modo "do-nothing" switcheable.
- NULL != PROXY , QUE ES PROXY??
- QUE ES STRATEGY??
- QUE ES STATE??