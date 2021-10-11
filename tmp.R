### Paths

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$W$}; 
\node[main] (2) [right of=1] {$Z$}; 
\node[main] (3) [right of=2] {$B$}; 
\node[main] (4) [below of=2] {$A$}; 
\draw[->] (1) -- (2); 
\draw[->] (2) -- (3); 
\draw[->] (2) -- (4); 
\draw[->] (4) -- (3); 
\end{tikzpicture} 
\end{center}
```

* A `r blue('path')` is a way to get from one vertex to another, traveling along edges

* There are 2 paths from $W$ to $B$:
  - $W \rightarrow Z \rightarrow B$
  - $W \rightarrow Z \rightarrow A \rightarrow B$
  
  ### Directed Acyclic Graphs (DAGs)
  
  * No undirected paths

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$Z$}; 
\node[main] (2) [right of=1] {$B$}; 
\node[main] (3) [below of=1] {$A$}; 
\draw[->] (1) -- (2); 
\draw (1) -- (3); 
\end{tikzpicture} 
\end{center}
```

* No cycles

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$Z$}; 
\node[main] (2) [right of=1] {$B$}; 
\node[main] (3) [below of=1] {$A$}; 
\draw[->] (2) -- (1); 
\draw[->] (1) -- (3); 
\draw[->] (3) -- (2); 
\end{tikzpicture} 
\end{center}
```

* This is a DAG

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$Z$}; 
\node[main] (2) [right of=1] {$B$}; 
\node[main] (3) [below of=1] {$A$}; 
\draw[->] (1) -- (2); 
\draw[->] (1) -- (3); 
\draw[->] (3) -- (2); 
\end{tikzpicture} 
\end{center}
```

### More terminology

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$Z$}; 
\node[main] (3) [right of=2] {$D$}; 
\node[main] (4) [below of=2] {$B$}; 
\draw[->] (1) -- (2); 
\draw[->] (2) -- (3); 
\draw[->] (2) -- (4); 
\draw[->] (4) -- (3); 
\end{tikzpicture} 
\end{center}
```

* $A$ is $Z$'s `r blue('parent')`
* $D$ has two parents, $B$ and $Z$
* $B$ is a `r blue('child')` of $Z$
* $D$ is a `r blue('descendant')` of $A$
* $Z$ is a `r blue('ancestor')` of $D$

## Relationship between DAGs and probability distributions

### DAG example 1

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$B$}; 
\node[main] (3) [right of=2] {$C$}; 
\node[main] (4) [below of=1] {$D$}; 
\draw[->] (4) -- (1); 
\draw[->] (1) -- (2); 
\end{tikzpicture} 
\end{center}
```

* C is independent of all variables
\[
P(C\mid A, B, D) = P(C)
\]

* $B$ and $C, D$ are independent, conditional on $A$
\[
P(B\mid A, C, D) = P(B\mid A) \Longleftrightarrow
B \perp C, D \mid A
\]

* $B$ and $D$ are marginally dependent
\[
P(B\mid D) \neq P(B)
\]

### DAG example 2

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$B$}; 
\node[main] (3) [right of=2] {$C$}; 
\node[main] (4) [below of=2] {$D$}; 
\draw[->] (4) -- (1); 
\draw[->] (4) -- (2); 
\draw[->] (2) -- (3); 
\draw[->] (1) to [out=45,in=135,looseness=1.5] (3); 
\end{tikzpicture} 
\end{center}
```

* $A$ and $B$ are independent, conditional on $C$ and $D$
\[
P(A\mid B, C, D) = P(A\mid C, D) \Longleftrightarrow
A \perp B \mid C, D
\]

* $C$ and $D$ are independent, conditional on $A$ and $B$
\[
P(D\mid A, B, C) = P(D\mid A, B) \Longleftrightarrow
D \perp C \mid A, B
\]

### Decomposition of joint distributions

1. Start with `r blue('roots')` (nodes with no parents)

2. Proceed down the descendant line, always conditioning on parents


```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$B$}; 
\node[main] (3) [right of=2] {$C$}; 
\node[main] (4) [below of=1] {$D$}; 
\draw[->] (4) -- (1); 
\draw[->] (1) -- (2); 
\end{tikzpicture} 
\end{center}
```

* $P(A, B, C, D) = P(C)P(D)P(A\mid D)P(B\mid A)$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$B$}; 
\node[main] (3) [right of=2] {$C$}; 
\node[main] (4) [below of=2] {$D$}; 
\draw[->] (4) -- (1); 
\draw[->] (4) -- (2); 
\draw[->] (2) -- (3); 
\draw[->] (1) to [out=45,in=135,looseness=1.5] (3); 
\end{tikzpicture} 
\end{center}
```

* $P(A, B, C, D) = P(D)P(A\mid D)P(B\mid D)P(C\mid A, B)$

### Compatibility between DAGs and distributions

* In the above examples, the DAGs admit the probability
factorizations. Hence, the probability function and the DAG are `r blue('compatible')`

* DAGs that are compatible with a particular probability function are not necessarily unique

    - Example1: 
    
```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
    \begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$B$}; 
\draw[->] (1) -- (2); 
\end{tikzpicture} 
\end{center}
```

    - Example 2:
    
```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
    \begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$B$}; 
\draw[->] (2) -- (1); 
\end{tikzpicture} 
\end{center}
```

    - In both of the above examples, $A$ and $B$ are dependent, i.e., $P(A, B) \neq P(A) P(B)$
    
    
## Types of paths, blocking, and colliders

### Types of paths

* `r blue('Forks')`

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$D$}; 
\node[main] (2) [right of=1] {$E$}; 
\node[main] (3) [right of=2] {$F$}; 
\draw[->] (2) -- (1); 
\draw[->] (2) -- (3); 
\end{tikzpicture} 
\end{center}
```

* `r blue('Chains')`

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$D$}; 
\node[main] (2) [right of=1] {$E$}; 
\node[main] (3) [right of=2] {$F$}; 
\draw[->] (1) -- (2); 
\draw[->] (2) -- (3); 
\end{tikzpicture} 
\end{center}
```

* `r blue('Inverted forks')`

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$D$}; 
\node[main] (2) [right of=1] {$E$}; 
\node[main] (3) [right of=2] {$F$}; 
\draw[->] (1) -- (2); 
\draw[->] (3) -- (2); 
\end{tikzpicture} 
\end{center}
```

### When do paths induce associations?

* If nodes $A$ and $B$ are on the ends of a path, then they are associated (via this path), if

    - Some information flows to both of them (aka Fork), or
    - Information from one makes it to the other (aka Chain)
    
* Example: information flows from $E$ to $A$ and $B$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$E$}; 
\node[main] (2) [below left of=1] {$D$}; 
\node[main] (3) [below right of=1] {$G$}; 
\node[main] (4) [below of=2] {$A$}; 
\node[main] (5) [below of=3] {$B$}; 
\draw[->] (1) -- (2); 
\draw[->] (1) -- (3); 
\draw[->] (2) -- (4); 
\draw[->] (3) -- (5); 
\end{tikzpicture} 
\end{center}
```

* Example: information from $A$ makes it to $B$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$G$}; 
\node[main] (3) [right of=2] {$D$}; 
\node[main] (4) [right of=3] {$F$}; 
\node[main] (5) [right of=4] {$B$}; 
\draw[->] (1) -- (2); 
\draw[->] (2) -- (3); 
\draw[->] (3) -- (4); 
\draw[->] (4) -- (5); 
\end{tikzpicture} 
\end{center}
```

### Paths that do not induce association

* Information from $A$ and $B$ collide at $G$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$G$}; 
\node[main] (3) [right of=2] {$B$}; 
\draw[->] (1) -- (2); 
\draw[->] (3) -- (2); 
\end{tikzpicture} 
\end{center}
```

* $G$ is a `r blue('collider')`

* $A$ and $B$ both affect $G$:

    - Information does not flow from $G$ to either $A$ or $B$
    - **So $A$ and $B$ are independent** (if this is the only path between them)
    
* If there is a collider anywhere on the path from $A$ to $B$, then no association between $A$ and $B$ comes from this path

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$G$}; 
\node[main] (3) [right of=2] {$D$}; 
\node[main] (4) [right of=3] {$B$}; 
\draw[->] (1) -- (2); 
\draw[->] (3) -- (2); 
\draw[->] (4) -- (3); 
\end{tikzpicture} 
\end{center}
```

### Blocking on a chain

* Paths can be `r blue('blocked')` by conditioning on nodes in the path

* In the graph below, $G$ is a node in the middle of a chain.
If we condition on $G$, then we block the path from $A$ to $B$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$G$}; 
\node[main] (3) [right of=2] {$B$}; 
\draw[->] (1) -- (2); 
\draw[->] (2) -- (3); 
\end{tikzpicture} 
\end{center}
```

* For example, $A$ is the temperature, $G$ is whether sidewalks are icy, and $B$ is whether someone falls
    - $A$ and $B$ are associated marginally
    - But if we conditional on the sidewalk condition $G$, then $A$ and $B$ are independent

### Blocking on a fork

* Associations on a fork can also be blocked

* In the following fork, if we condition on $G$, then the path from $A$ to $B$ is block

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$G$}; 
\node[main] (3) [right of=2] {$B$}; 
\draw[->] (2) -- (1); 
\draw[->] (2) -- (3); 
\end{tikzpicture} 
\end{center}
```

### No need to to block a collider

* The opposite situation occurs if a conllider is blocked

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={10mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [right of=1] {$G$}; 
\node[main] (3) [right of=2] {$B$}; 
\draw[->] (1) -- (2); 
\draw[->] (3) -- (2); 
\end{tikzpicture} 
\end{center}
```

* In the following inverted fork

    - Originally $A$ and $B$ are not associated, since information collides at $G$
    - `r red('But if we condition on $G$, then $A$ and $B$ become associated')`

* Example: $A$ and $B$ are the states of two on/off switches, and $G$ is whether the lightbulb is lit up. 

    - The two switches $A$ and $B$ are determined by two independent coin flips

    - $G$ is lit up only if both $A$ and $B$ are in the on state
    
    - Conditional on $G$, the two switches are not independent: if $G$ is off, then $A$ must be off if $B$ is on

## d-separation

### d-separation

* A path is `r blue('d-separated')` by a set of nodes $C$ if

    - It contains a chain ($D\rightarrow E \rightarrow F$) and the middle part is in $C$, or
    
    - It contains a fork ($D\leftarrow E \rightarrow F$) and the middle part is in $C$, or
    
    - It contains an inverted fork ($D\rightarrow E \leftarrow F$), and the middle part is not in $C$, nor are any descendants of it
    
* Two nodes, $A$ and $B$, are d-separated by a set of nodes $C$ if it **blocks every path** from $A$ to $B$. Thus
\[
A\perp B \mid C
\]

* Recall the ignorability assumption
\[
Y^0, Y^1 \perp A \mid X
\]

### Confounders on paths

* A simple DAG: $X$ is a confounder between the relationship between treatment $A$ and outcome $Y$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$X$}; 
\node[main] (2) [below left of=1] {$A$}; 
\node[main] (3) [below right of=1] {$Y$}; 
\draw[->] (1) -- (2); 
\draw[->] (1) -- (3); 
\draw[->] (2) -- (3); 
\end{tikzpicture} 
\end{center}
```

* A slightly more complicated graph

    - $V$ affects $A$ directly
    - $V$ affects $Y$ indirectly, through $W$
    - Thus, $V$ is a confounder

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$V$}; 
\node[main] (2) [right of=1] {$W$}; 
\node[main] (3) [below left of=1] {$A$}; 
\node[main] (4) [below right of=2] {$Y$}; 
\draw[->] (1) -- (2); 
\draw[->] (1) -- (3); 
\draw[->] (2) -- (4); 
\draw[->] (3) -- (4); 
\end{tikzpicture} 
\end{center}
```

## Frontdoor and backdoor paths

### Frontdoor paths

* A `r blue('frontdoor path')` from $A$ to $Y$ is one that **begins with an arrow emanating out of $A$**

* `r green('We do not worry about frontdoor paths, because they capture effects of treatment')`

* Example: $A\rightarrow Y$ is a frontdoor path from $A$ to $Y$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$X$}; 
\node[main] (2) [below left of=1] {$A$}; 
\node[main] (3) [below right of=1] {$Y$}; 
\draw[->] (1) -- (2); 
\draw[->] (1) -- (3); 
\draw[->] (2) -- (3); 
\end{tikzpicture} 
\end{center}
```

* Example: $A\rightarrow Z \rightarrow Y$ is a frontdoor path from $A$ to $Y$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$X$}; 
\node[main] (2) [below of=1] {$Z$}; 
\node[main] (3) [left of=2] {$A$}; 
\node[main] (4) [right of=2] {$Y$}; 
\draw[->] (1) -- (3); 
\draw[->] (1) -- (4); 
\draw[->] (3) -- (2); 
\draw[->] (2) -- (4); 
\end{tikzpicture} 
\end{center}
```

### Do not block nodes on the frontdoor path

* If we are interested in the causal effect of $A$ on $Y$, we should not control for (aka block) $Z$

    - This is because controlling for $Z$ would be controlling for an affect of treatment
    
```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$X$}; 
\node[main] (2) [below of=1] {$Z$}; 
\node[main] (3) [left of=2] {$A$}; 
\node[main] (4) [right of=2] {$Y$}; 
\draw[->] (1) -- (3); 
\draw[->] (1) -- (4); 
\draw[->] (3) -- (2); 
\draw[->] (2) -- (4); 
\end{tikzpicture} 
\end{center}
```

* Causal mediation analysis involves understanding frontdoor paths from $A$ and $Y$

### Backdoor paths

* `r blue('Backdoor paths')` from treatment $A$ to outcome $Y$ are paths from $A$ to $Y$ that **travels through arrows going into $A$**

* Here, $A \leftarrow X \rightarrow Y$ is a backdoor path from $A$ to $Y$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$X$}; 
\node[main] (2) [below left of=1] {$A$}; 
\node[main] (3) [below right of=1] {$Y$}; 
\draw[->] (1) -- (2); 
\draw[->] (1) -- (3); 
\draw[->] (2) -- (3); 
\end{tikzpicture} 
\end{center}
```

* `r red('Backdoor paths confound the relationship between $A$ and $Y$, so they need to be blocked!')`

* To sufficiently control for confounding, we must identify a set of variables that block all backdoor paths from treatment to outcome
    
    - Recall the ignorability: if $X$ is this set of variables, then $Y^0, Y^1 \perp A \mid X$
    
### Criteria

* Next we will discuss two criteria to identify sets of variables that are sufficient to control for confounding

    - Backdoor path criterion: if the graph is known
    - Disjunctive cause criterion: if the graph is not known

## Backdoor path criterion

### Backdoor path criterion

* `r blue('Backdoor path criterion')`: a set of variables $X$ is sufficient to control for confounding if

    - It blocks all backdoor paths from treatment to the outcome, and
    - It does not include any descendants of treatment

* Note: the solution $X$ is not necessarily unique

### Backdoor path criterion: a simple example 

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$V$}; 
\node[main] (2) [right of=1] {$W$}; 
\node[main] (3) [below left of=1] {$A$}; 
\node[main] (4) [below right of=2] {$Y$}; 
\draw[->] (1) -- (2); 
\draw[->] (1) -- (3); 
\draw[->] (2) -- (4); 
\draw[->] (3) -- (4); 
\end{tikzpicture} 
\end{center}
```

* There is one backdoor path from $A$ to $Y$

    - It is not blocked by a collider
    
* Sets of variables that are sufficient to control for confounding:

    - $\{V\}$, or
    - $\{W\}$, or
    - $\{V, W\}$
    
### Backdoor path criterion: a collider example 

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$M$}; 
\node[main] (2) [above left of=1] {$V$}; 
\node[main] (3) [above right of=1] {$W$}; 
\node[main] (4) [below left of=1] {$A$}; 
\node[main] (5) [below right of=1] {$Y$}; 
\draw[->] (2) -- (1); 
\draw[->] (3) -- (1); 
\draw[->] (2) -- (4); 
\draw[->] (3) -- (5); 
\draw[->] (4) -- (5); 
\end{tikzpicture} 
\end{center}
```

* There is one backdoor path from $A$ to $Y$

    - It is blocked by a collider $M$, so there is no confounding
    
* If we condition on $M$, then it open a path between $V$ and $W$

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) [draw] {$M$}; 
\node[main] (2) [above left of=1] {$V$}; 
\node[main] (3) [above right of=1] {$W$}; 
\node[main] (4) [below left of=1] {$A$}; 
\node[main] (5) [below right of=1] {$Y$}; 
\draw[->] (2) -- (1); 
\draw[->] (3) -- (1); 
\draw[->] (2) -- (4); 
\draw[->] (3) -- (5); 
\draw[->] (4) -- (5); 
\draw[dashed] (2) -- (3);
\end{tikzpicture} 
\end{center}
```

* Sets of variables that are sufficient to control for confounding:
    - $\{\}$, $\{V\}$, $\{W\}$, $\{M, V\}$, $\{M, W\}$, $\{M, V, W\}$
    - But not $\{M\}$

### Backdoor path criterion: a multi backdoor paths example 

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$A$}; 
\node[main] (2) [above of=1] {$V$}; 
\node[main] (3) [below of=1] {$W$}; 
\node[main] (4) [left of=1] {$Z$}; 
\node[main] (5) [right of=1] {$Y$}; 
\draw[->] (2) -- (4); 
\draw[->] (2) -- (5); 
\draw[->] (4) -- (1); 
\draw[->] (1) -- (5); 
\draw[->] (3) -- (1); 
\draw[->] (3) -- (4); 
\end{tikzpicture} 
\end{center}
```

* First path: $A \leftarrow Z \leftarrow V \rightarrow Y$

    - No collider on this path
    - So controlling for either $Z$, $V$, or both is sufficient
    
* Second path: $A \leftarrow W \rightarrow Z \leftarrow V \rightarrow Y$

    - $Z$ is a collider
    - So controlling $Z$ opens a path between $W$ and $V$
    - We can block $\{V\}$, $\{W\}$, $\{Z, V\}$, $\{Z, W\}$, or $\{Z, V, W\}$
    
* To block both paths, it's sufficient to control for

- $\{V\}$, $\{Z, V\}$, $\{Z, W\}$, or $\{Z, V, W\}$
  - But not $\{Z\}$ or $\{W\}$
  
  ## Disjunctive cause criterion
  
  ### Disjunctive cause criterion
  
  * For many problems, it is difficult to write down accurate DAGs

* In this case, we can use the `r blue('disjunctive cause criterion')`: control for all observed causes of the treatment, the outcome, or both

* `r green('If there exists a set of observed variables that satisfy the backdoor path criterion, then the variables selected based on the disjunctive cause criterion are sufficient to control for confounding')`

* Disjunctive cause criterion does not always select the smallest set of variable to control for, but it is conceptually simple

### Example

* Observed pre-treatment variables: $\{M, W, V\}$
  
  * Unobserved pre-treatment variables: $\{U_1, U_2\}$
  
  * Suppose we know: $W, V$ are causes of $A$, $Y$ or both

* Suppose $M$ is not a cause of either $A$ or $Y$
  
  * Comparing two methods for selecting variables

1. Use all pre-treatment covariates: $\{M, W, V\}$
  2. Use variables based on disjunctive cause criterion: $\{W, V\}$
  
  ### Example continued: hypothetical DAG 1
  
  ```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$M$}; 
\node[main] (2) [right of=1] {$V$}; 
\node[main] (3) [right of=2] {$W$}; 
\node[main] (4) [below left of=2] {$A$}; 
\node[main] (5) [below right of=3] {$Y$}; 
\draw[->] (2) -- (1); 
\draw[->] (2) -- (3); 
\draw[->] (2) -- (4); 
\draw[->] (3) -- (5); 
\draw[->] (4) -- (5); 
\end{tikzpicture} 
\end{center}
```

1. Use all pre-treatment covariates: $\{M, W, V\}$
  
  - Satisfy backdoor path criterion? Yes


2. Use variables based on disjunctive cause criterion: $\{W, V\}$
  
  - Satisfy backdoor path criterion? Yes

### Example continued: hypothetical DAG 2

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$M$}; 
\node[main] (2) [above left of=1] {$V$}; 
\node[main] (3) [above right of=1] {$W$}; 
\node[main] (4) [below left of=1] {$A$}; 
\node[main] (5) [below right of=1] {$Y$}; 
\draw[->] (2) -- (1); 
\draw[->] (3) -- (1); 
\draw[->] (2) -- (4); 
\draw[->] (3) -- (5); 
\draw[->] (4) -- (5); 
\end{tikzpicture} 
\end{center}
```

1. Use all pre-treatment covariates: $\{M, W, V\}$
  
  - Satisfy backdoor path criterion? Yes


2. Use variables based on disjunctive cause criterion: $\{W, V\}$
  
  - Satisfy backdoor path criterion? Yes

### Example continued: hypothetical DAG 3

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$W$}; 
\node[main] (2) [right of=1] {$A$}; 
\node[main] (3) [right of=2] {$Y$}; 
\node[main] (4) [right of=3] {$V$}; 
\node[main] (5) [above right of=1] {$U_1$}; 
\node[main] (6) [above left of=4] {$U_2$}; 
\node[main] (7) [above left of=6] {$M$}; 
\draw[->] (1) -- (2); 
\draw[->] (2) -- (3); 
\draw[->] (4) -- (3); 
\draw[->, dotted] (5) -- (2); 
\draw[->, dotted] (6) -- (3); 
\draw[->, dotted] (5) -- (7); 
\draw[->, dotted] (6) -- (7); 
\end{tikzpicture} 
\end{center}
```    

1. Use all pre-treatment covariates: $\{M, W, V\}$
  
  - Satisfy backdoor path criterion? No


2. Use variables based on disjunctive cause criterion: $\{W, V\}$
  
  - Satisfy backdoor path criterion? Yes

### Example continued: hypothetical DAG 4

```{r, echo=FALSE, engine='tikz', out.width='20%', fig.ext='png'}
\begin{center}
\begin{tikzpicture}[node distance={12mm}, thick, main/.style = {}] 
\node[main] (1) {$M$}; 
\node[main] (2) [below of=1] {$U_1$}; 
\node[main] (3) [right of=2] {$W$}; 
\node[main] (4) [right of=3] {$U_2$}; 
\node[main] (5) [below of=2] {$A$}; 
\node[main] (6) [right of=5] {$Y$}; 
\node[main] (7) [right of=6] {$V$}; 
\draw[->, dotted] (2) -- (3); 
\draw[->, dotted] (4) -- (3); 
\draw[->, dotted] (2) -- (5); 
\draw[->, dotted] (4) -- (6); 
\draw[->] (3) -- (6); 
\draw[->] (5) -- (6); 
\draw[->] (7) -- (6); 
\end{tikzpicture} 
\end{center}
```    


1. Use all pre-treatment covariates: $\{M, W, V\}$
  
  - Satisfy backdoor path criterion? No


2. Use variables based on disjunctive cause criterion: $\{W, V\}$
  
  - Satisfy backdoor path criterion? No



### References

* Coursera class: "A Crash Course on Causality: Inferring Causal Effects from Observational Data", by Jason A. Roy (University of Pennsylvania)

- https://www.coursera.org/learn/crash-course-in-causality
