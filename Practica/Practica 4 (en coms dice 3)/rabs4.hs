Practica 3 (segun titulo en comunidades)

-- 3) ¿Cuales de los siguientes enunciados son verdaderos? Probar las respuestas.
-- 1. n^2 ∈ O(n^3)
-- Recordamos la definicion, se puede decir que f ∈ a O(g) siempre y cuando 0 <= f(n) <= c * g(n)
-- Aplicamos: 0 <= n^2 <= c * n^3
-- Trabajamos como Inecuación: n^2 <= c * n^3    =>     1 <= c * n
-- Concluimos que mientras c >= 1 funciona con todos los n posibles (siendo el minimo 1), por ende, es Verdadero.

-- 2. n^2 ∈ Ω(n^3)
-- Recordamos la definicion, se puede decir que f ∈ a Ω(g) siempre y cuando 0 <= c * g(n) <= f(n) 
-- Aplicamos: 0 <= c * n^3 <= n^2 
-- Trabajamos como Inecuación: c * n^3 <= n^2     =>    c * n <= 1
--  c * n <= 1 ABSURDO (es imposible cumplir esto, ya que los naturales son infinitos y en algun momento la ecuacion 
-- superara al 1 independientemente de c (que es R+), por ende, el enunciado es Falso.

-- 3. 2^n ∈ Θ(2^(n+1))

-- 4. n! ∈ Θ((n + 1)!)
