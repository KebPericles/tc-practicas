# Práctica #11. Señales aleatorias (ruido) y señales determinísticas

## Introducción

Investigar:

### Tipos de ruido

## Desarrollo

### Paso I

Considere la señal determinística

$$ s[n] = 2n(0.9)^n $$

```matlab
n = 0:1:49;
```

Asimismo, considere la señal aleatoria

```matlab
d[n] = rand(50,1) - 0.5
```

a) Usando plot graficar $n$ vs $s[n]$

b) Graficar $n$ vs $d[n]$

c) Graficar $n$ vs $s[n]$ + $d'[n]$ = $x[n]$

### Paso II

Minimizar el ruido agregado a $s[n]$, usando un filtro de promedio móvil, dado por:

$$ y[n] = {1 \over M} \sum_{k=0}^{M-1} x[n-k] $$

Para

```matlab
M = 2, 3, 4, 5, 6, 10
```

d) Para cada caso de $M$ comparar $s[n]$ con $y[n]$
