# Capítulo 4.4 - Equivalence and Minimization of Authomata

### Equivalencia
Cuando dos autómatas definen el mismo lenguaje, son equivalentes. Dado un AFD, hay un único AFD mínimo equivalente, o sea con la menor cantidad de estados posibles.

## 4.4.1 - Testeado equivalencia de estados
Dos estados $p$ y $q$ son **equivalentes**, si para toda cadena $w$ sucede que:
- $\hat{\delta}(p,w)$ acepta $\iff \hat{\delta}(q,w)$ acepta

Si esto no sucede, se dice que $p$ y $q$ son **distinguibles**. Para demostrar distinguibilidad alcanza encontrar una cadena $\alpha$ tal que $\hat{\delta}(p,\alpha)$ se acepta y $\hat{\delta}(q,\alpha)$ no se acepta, o vicerversa. <br>

Para encontrar estados equivalentes, se buscan todos los pares de estados distinguibles y se asume que si dos estados no se encotraron distinguibles, **entonces son equivalentes** (Teorema 4.20). Para encontrar pares distinguibles se usa el **algoritmo (recursivo) de llenado de tabla**, que dado un ADF $A = (Q, \Sigma, \delta, q_0, F)$:

- *Caso base*: Si $p$ es terminal y $q$ no, son distinguibles.
- *Paso inductivo:* Dados $p$ y $q$, si existe una cadena $\alpha$ tal que $r = \hat{\delta}(p, \alpha)$ y $s = \hat{\delta}(q, \alpha)$, con $r$ y $s$ estados que se sabe son distinguibles, entonces $p$ y $q$ son distinguibles.

### Ejemplo
<div style="display: flex;">
    <img src="image.png" alt="drawing" width="50%"/>
    <img src="image-1.png" alt="drawing" width="50%"/>
</div>

### Complejidad de llenado de tabla
Se tiene que hay ${n\choose 2} = (n(n-1) / 2)$ pares de estados. En cada ronda se verifica para cada par, si alguno de los pares sucesores es distinguible. Como hay $O(n^2)$ pares, cada ronda es $O(n^2)$. Como entre dos estados pueden haber a lo sumo $O(n^2)$ estados intermedios, entonces como mucho hay $O(n^2)$ rondas. Con esto se concluye que la complejidad es $O(n^4)$. <br>
Sin embargo con más cuidado se puede lograr llenar la tabla en $O(n^2)$. La idea es tener para cada par $\{r, s\}$ una lista de todos los pares que *dependen* del par. Donde *depender* se define como que si $\{r, s\}$ es distinguible, todos los pares de la lista necesariamente también lo son. Para armar estas listas, se examina cada par $\{p, q\}$ con los diferentes inputs $a \in \Sigma$ (cantidad fija), y se agrega $\{p, q\}$ a la lista de los pares $\{\delta(p, a), \delta(q, a)\}$. Luego si se encuentra que $\{r, s\}$ es un par distinguible, todos los pares de su lista se marcan como distinguibles, y se agregan a la cola de pares cuyas listas se deben recorrer para hacer el mismo proceso. Gracias a que el tamaño de $\Sigma$ se considera una constante, se puede lograr la complejidad propuesta. 

## 4.4.2 - Testeado equivalencia de lenguajes regulares
Para saber si $L$ y $M$ son iguales:
1) Encontrar sus representaciones como AFD.
2) Crear un nuevo AFD con la unión de los AFD de $L$ y $M$, eligiendo arbitrariamente el estado inicial de uno u o el otro para ser el estado inicial de la unión.
3) Chequear mediante el algortimo de llenado de tabla si los estados iniciales originales de cada AFD son equivalentes:
   - Si son equivalentes $\implies$ $L = M$ 
   - Si son distinguibles $\implies$ $L \neq M$ 



## 4.4.3 - Minimización de AFDs
El AFD mínimo de un lenguaje, es aquel cuya cantidad de estados es menor o igual a la de cualquier otro autómata equivalente. <br>
La idea del algoritmo que lo encuentra es:
1) Eliminar todos los estados que no se pueden alcanzar desde el inicio
2) Particionar los estados restantes en **bloques** de estados equivalentes, donde no hay un par de estados equivalentes que no estén en el mismo bloque.

El paso 2 se puede hacer sin importar cual sea el autómata. No puede pasar que los bloques tengan *overlap*, ya que la propiedad de equivalencia es **transitiva**. O sea que si un estado $p$ está en los bloques $A$ y $B$, entonces:
- Todos los elementos de $A$ son equivalentes a $p$. 
- $p$ es equivalente a todos los elementos de $B$.
- Por transitividad, todos los elementos de $A$ son equivalentes a todos los de $B$.
- $A$ y $B$ se pueden unificar en un único bloque $C = A \cup B$.

### Algoritmo de minimización
Dado el AFD $A = (Q, \Sigma, \delta, q_0, F)$:
1) Usar el algoritmo de llenado de tabla para encontrar todos los pares equivalentes.
2) Particionar $Q$ en bloques de estados equivalentes.
3) Construir el AFD mínimo $B$:
   - Usando los bloques como estados.
   - Definiendo el estado inicial de $B$ como el bloque que contiene a $q_0$.
   - Definiendo el conjunto de estados finales de $B$ como el conjunto de bloques que contienes estados finales de $A$. Notar que no pueden haber bloques con estados finales y no finales, pues nunca son equivalentes.
  
Estimo que la complejidad de cada paso, y total es $O(|Q|^2)$.
   

### Continuación ejemplo
<div style="display: flex; justify-content:center;">
    <img src="image-2.png" alt="drawing" width="50%"/>
</div>


## 4.4.4 - Minimalidad del AFD mínimo
Se puede demostrar por contradicción que dado un AFD $A$ y su minimización $M$, no existe un AFD $N$ equivalente a $A$ con menos estados que $M$. <br>
Suponiendo que sí existe, entonces se corre el algoritmo de distinguibilidad sobre un autómata formado por la unión de $N$ y $M$. Como $L(M) = L(N)$, necesariamente los estados iniciales de cada uno son equivalentes. Por lo tanto todos sus sucesores para cualquier símbolo también lo son, sino los estados iniciales no lo serían. Como ninguno de los dos puede tener estados inaccesibles pues pretenden ser "mínimos", entonces todos los estados de $M$ son equivalentes a al menos un estado de $N$. Pero como $N$ tiene menos estados que $M$, entonces hay al menos dos estados de $M$ que son equivalentes a uno de $N$, y por transitividad equivalentes entre si. Esto es absurdo pues por construcción, $M$ no tiene dos estados equivalentes. Como la contradicción provino de asuimr que existe $N$ con menos estados que $M$, entonces queda probado que no puede existir. <br>
Además, para cualquier otro AFD mínimo de $A$, hay necesariamente una correspondencia uno a uno de estados con $M$, por lo tanto el AFD mínimo es único salvo por los nombres de los estados.