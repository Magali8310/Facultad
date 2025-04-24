# Notas de The Object Recursion Pattern - Bobby Woolf 1998

## Objetivo
Desarmar una solicitud sobre una estructura, en partes más pequeñas y fáciles de manejar, mediante la delegación polimórfica.


## Motivacion
Clase "comparadora" de objetos:
- Tiene un método que compara dos objetos arbitrarios. Cualquier cambio en una clase requiere modificarlo la clase comparadora.
- Tiene un método que les dice a los objetos QUE hacer, no COMO, o sea les dice compárense y estos realizan la tarea según su propia implmentación.

Cuando se compara un objetos complejo, este envia mensajes de comparacion a los objetos más simples que lo componen, y así recursivamente. Esto es un ejemplo de Object Revusion.


## Estructura
Un sistema con O.R. debe tener:
- Dos clases polimórficas, una que maneja la solicitud recursivamente, y otra que la resueve sin recursión.
- Un emisor del mensaje que inicia la recursión.


## Casos de uso
- passing a message through a linked structure where the ultimate destination is unknown.
- broadcasting a message to all nodes in part of a linked structure.
- distributing a behavior’s responsibility throughout a linked structure.

## Participantes
- Initiator: inicializa la request enviando msg al handler
- Handler: define que tipo de datos puede resolver una request. Puede ser:
  - Recurser: Define un succesor, maneja requests delegandolas, puede ejecutar algo antes y/o después de la delegación
  - Terminator: Finaliza una request al handlearle sin recursión

## Ventajas
- Procesamiento distribuido.
- Encapsulamiento: el initiator no sabe como se soluciona la request. Quien la resuelve puede incluso cambiar en runtime.
- Flexibilidad de roles: Un handler puede ser recurser para ciertas consultas y terminator para otras.

## Desventajas
Sistemas más complejos y difíciles de mantener.

