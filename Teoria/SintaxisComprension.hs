-- Listas por comprension

-- [valores | generador, guardas]
Ej. [x | x <- [1..10], (x `div` 2) == 0]

-- La funcion zip, mapea dos listas a una lista con los pares de elementos correspondientes
pruebazip = zip [1..5] ['a','b','c'] -- se trucan en 3, porque es en el menor

-- El algoritmo de ordenacion Quicksort:
-- Las listas no vacias pueden ser ordenadas, ordenando los valores de la
-- cola <= que la cabeza, ordenando los valores > que la cabeza y rearmando 
-- el resultado con las listas resultantes a ambos lados de la cabeza.
qsort :: Ord a => [a] -> [a] 
-- 'Ord a =>' fuerza a que los elementos de tipo 'a' se puedan ordenar entre ellos
qsort [] = []
qsort (x:xs) = qsort chicos ++ [x] ++ qsort grandes
  where 
    chicos = [a | a <- xs, a <= x ]
    grandes = [b | b <- xs, b > x ]
