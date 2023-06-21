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
-- Recordamos la definicion, se puede decir que f ∈ a Θ(g) siempre y cuando 0 <= c1 g(n) <= f(n) <= c2 * g(n)
-- Aplicamos: 0 <= c1 * 2^(n+1) <= 2^n <=  c2 * 2^(n+1)
-- Trabajamos como Inecuación: c1 * 2^(n+1) <= 2^n <=  c2 * 2^(n+1)    
--  =>  c1 * 2 * 2^n  <= 2^n <=  c2 * 2 * 2^n     =>   c1 * 2 <= 1 <= c2 * 2
-- Verdadero, con c1 <= 0.5 y c2 >= 0.5


-- 4. n! ∈ Θ((n + 1)!)
-- Para que n! ∈ Θ((n + 1)!) se tiene que cumplir (n! ∈ O((n + 1)!)) y (n! ∈ Ω((n + 1)!))

-- Para (n! ∈ O((n + 1)!)):
-- Recordamos la definicion, se puede decir que f ∈ a O(g) siempre y cuando 0 <= f(n) <= c * g(n)
-- Aplicamos: 0 <= n! <= c * (n+1)!
-- Trabajamos como inecuacion: n! <= c * (n+1)!    =>   n! <= c * n! * (n+1)   =>  1 <= c * (n+1)
-- Se cumple para c >= 0.5

-- Para (n! ∈ Ω((n + 1)!)):
-- Recordamos la definicion, se puede decir que f ∈ a Ω(g) siempre y cuando 0 <= c * g(n) <= f(n) 
-- Aplicamos: 0 <= c * (n+1)! <= n!
-- Trabajamos como inecuacion: c * (n+1)! <= n!    =>   c * n! * (n+1) <= n!   =>  c * (n+1) <= 1
-- ABSURDO (es imposible cumplir esto, ya que los naturales son infinitos y en algun momento la ecuacion 
-- superara al 1 independientemente de c (que es R+), por ende, el enunciado es Falso.

-- Como con Ω(g) no se cumple, con Θ(g) tampoco se va a cumplir, por ende, el enunciado es falso.
