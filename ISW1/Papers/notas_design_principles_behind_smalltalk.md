# Notas de Design Principles Behind Smalltalk - Ingalls 1981

## Introduccón 

### Componentes: 
- Lenguaje de programación que interfacea modelo mental de usuario con modelo de hardware.
- Lenguaje de "comunicación" (UI) para comunicación humano-computadora.

### Correlación diseño del sistema con método científico
- Obervación -> Construir apps en el sistema en el estado "actual"
- Formular teoría -> Rediseñar el sistema en base a las obervaciones
- Hacer predicción que puede ser testeada: Construir un nuevo sistema basado en el nuevo diseño

### Principio de maestría personal
Para que un sistema permita "servir" al espiritú creativo, debe ser completamente entendible para un individuo. Cualquier barrera entre el usuario y alguna parte del sistema, es una barrera para la creatividad.

### Principio general de del "Good Design"
Un sistema debería ser construído con un mínimo conjunto de partes no modificables. Estas deberían ser lo más generales posbiles y mantenerse en un "framework uniforme".

## Lenguaje 
El pensamiento creativo se puede ver como aparición espontánea de información en la mente. Con el lenguaje se la puede acceder. Su propósito es proveer un **framework para la comunicación.** <br>
Un sistema de cómptuo debe prover modelos compatibles con aquellos de la mente. 

### Objetos
Se puede asociar un identificador a un objeto para que con solo mencionar el mismo, se entienda la referencia al objeto original. Esto en el mundo real, para los lenguajes es esencial soportar hacer esta misma distinción y referencia a los objetos del universo.

### Manejo de almacenamiento
Se asocia un entero a cada objeto del sistema. Las variables pueden almacenar cualquier objeto, pues en realidad almacenan el entero que los referencia. Cuando ya no hay referencia al objeto, el mismo "desaparece" y libera el espacio de almacenamiento. Esta automatización  es escencial para el modelo *object-oriented*.

### Mensajes
El cómputo se puede ver como objetos que tiene la capacidad de ser invocados uniformemente al enviarles mensajes. <br>
Un **protocolo** define el conjunto de mensajes a los que un objeto sabe responder. 

### Metáfora uniforme
Un leguaje debe ser diseñado sobre una metáfora poderosa que se pueda aplicar uniformemente sobre todas las áreas. En el caso de ST, la metáfora es que los componentes del sistema son objetos que colaboran entre ellos mediante envío de mensajes.

### Modularidad
Ningún componente en un sistema complejo debe depender de los detalles de implementación internos de ningún otro componente. Esto reduce la intedependencia y la complejidad del sistema. <br>
El envío de mensajes provee modularidad al separar la *intención* en el nombre del mensaje, del *método* con el cual se realiza lo pedido. <br>
Se puede reducir la complejidad al agrupar componentes similares, en Smalltalk esto se hace gracias a las clases.


### Clases
Describen objetos:
- Su estado interno
- Su protocolo
- Los métodos para responder los mensajes del protocolo

Son las ideas platónicas. Al ver una silla cualquiera, uno puede pensar ese objeto tiene forma de *silla*, con *silla* siendo la idea platónica. <br>
Las clases de objetos deben tener algo en común con las "clases del kernel", el cual sabe de integers, arrays, ...

### Polimorifsmo
Un programa debe especificar solo el comportamiento de los objetos, no su representación.

### Factoring
Cada componente independiente de un sistema debe aparecer solo en un lugar. (???) <br>
Para satisgfacer este principio, ST implementa **herencia**. <br> Aumenta el **leverage** (control de lo que pasa). 

### Virtual machine
Es una especificación que establece un framework para la aplicación de tecnología. En ST:
- Modelo object-oriented de almacenamiento
- Modelo message-oriented de procesamiento
- Modelo bitmap para gráficos


## Interfaz de usuario
Lenguaje de comunicación visual.

### Principio reactivo
Todo componente accesible al usuario se debe presentar de manera tal que sea observable y manipulable.


### Sistema Operativo
Colección de cosas que no encajan en un lenguaje. Según ST no deberían existir, y de hecho este no utiliza uno. Operaciones como lectura de disco, se incorporan como primitivas.