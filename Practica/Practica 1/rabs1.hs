-- 1)
--
--a)
borrarUltimo [] = []
borrarUltimo [x] = []
borrarUltimo (x:xs) = (x:borrarUltimo xs)

--b) 

potaxio = [('a',5),('b',5),('c',5),('a',8),('a',12),('c',353),('c',33)] 

primigenia :: Ord x => (x,y) -> [(x,[y])] -> [(x,[y])]
primigenia (a,b) [] = [(a,[b])]
primigenia (a,b) ( (q,bs):xd )  | a == q = (q,bs++[b]):xd
                                | otherwise = (q,bs):(primigenia (a,b) xd)

collectx :: Ord a => [(a,b)] -> [(a,[b])]
collectx [] = []
collectx ((x,y):xys) = primigenia (x,y) (collectx xys)

--c)
--serie que se comporta de la siguiente manera: serie [1, 2, 3] = [[ ], [1], [1, 2], [1, 2, 3]] Dar su tipo m´as general.

serieaux xs = [[]] ++ xs

series :: [a] -> [[a]]
series [] = []
series lista = series (borrarUltimo lista) ++ [lista]

serie xs = serieaux (series xs)

--d)
paresIguales a b c d = if a==b then (c==d) else if a==c then (b==d) else if a==d then (b==c) else False

paresIguales2 a b c d = (a==b && c==d) || (a==c && b==d) || (a==d && b==c)

--e)
isosceles a b c = a==b || a==c || b==c

--f)
ror :: [a] -> Int -> [a]
ror [] n = []
ror xs 0 = xs
ror (x:xs) n = ror (xs ++ [x]) (n-1)

--g)
upto n m
        | n <= m = [n] ++ (upto (n+1) m)
        | otherwise = []

--h)
ecoo :: [Char] -> [Char]
ecoo xs = foldr (\(x,i) acc -> replicate i x ++ acc) [] (zip xs [1..])

-- 2)
--
--a)
-- cambios : [a ] → [Int], que dada una lista, devuelve la lista de los ´ındices en que la lista
-- cambia. Es decir, dada la lista s retorna la lista con los i tal que si 6= si+1
-- cambios [1, 1, 1, 3, 3, 1, 1] = [2, 4]

cambios (xs) = [i | (x,i) <- zip (xs) ([0..]), (y,j) <- zip (xs) ([0..]),i == j+1, x/=y]

--b)
--oblongoNumber :: [Int] que genera la lista de los n´umeros oblongos. Un n´umero es oblongo
--si es el producto de dos naturales consecutivos. Por ejemplo, los n´umeros [2, 6, 12, 20, ...]

oblongoNumber = [x*y | (x,y) <- zip [1..] [2..]]

--c)
-- abundantes :: [Integer] que es la lista de todos los n´umeros abundantes. Un n´umero natural
-- n se denomina abundante si es menor que la suma de sus divisores propios. Por ejemplo, 12
-- y 30 son abundantes pero 5 y 28 no lo son. Por ejemplo abundates = [12, 18, 20, 24, 30, 36, ..]

sumadivisores num = foldr (+) 0 [x | x <- [1..num-1], (num) `mod` x == 0]
abundantes = [x | x <- [1..], x < sumadivisores x]

abundantes2 = [x | x <- [1..], x < (foldr (+) 0 [y | y <- [1..x-1], (x) `mod` y == 0])]

--d)
--eco que devuelve la cadena obtenida a partir de la cadena xs repitiendo cada elemento tantas
--veces como indica su posici´on. No usar listas por comprensi´on. Por ejemplo:
-- eco "hola" ="hoolllaaaa"

eco xs = [x | (x,y) <- zip xs [0..], i <- [0..y], i<=y]

--e)
--euler :: Int → Int tal que euler n es la suma de todos los m´ultiplos de 3 ´o 5 menores que n.
--Por ejemplo, euler 10 = 23. Puedes usar sin definir la funci´on sum que suma los elementos de una lista.

euler n = foldr (+) 0 [x | x <- [1..(n-1)], x `mod` 3 == 0 || x `mod` 5 == 0]
-- multiplos de 3 o 5 menores que n suma

--f)
-- expandir :: [Int] → [Int] que reemplace en una lista de n´umeros positivos cada n´umero n por
-- n copias de sı mismo:
-- Ejemplo: expandir [3, 4, 2] = [3, 3, 3, 4, 4, 4, 4, 2, 2]

expandir xs = [x | x <- xs, i <- [1..x], i<=x]


-- NO PIENSO HACER NI EL 3 NI EL 4 MALISIMOS


-- 5)
-- Definir las siguientes funciones usando foldr:

--a) map :: (a → b) → [a ] → [b ] que dada una funci´on y una lista, aplica la funci´on a cada
--elemento de la lista.

mapa :: (a -> b) -> [a] -> [b]
mapa f xs = foldr (\x acu -> f x : acu) [] xs

--b) filter :: (a → Bool) → [a ] → [a ] , que dado un predicado y una lista xs, devuelve una lista
--con los elementos de xs que satisfacen el predicado.

filtere :: (a->Bool) -> [a] -> [a]
filtere f xs = foldr (\x acu -> if f x then x : acu else acu) [] xs

--c) unzip ::[(a, b)] → ([a ], [b ]), que dada una lista de tuplas xs retorna una tupla de listas donde
--cada una corresponde a los primeros y secundos elementos de los pares respectivamente.
--Ej. unzip [(’a’, 1),(’z’, 7),(’h’, 9)] = ("azh", [1, 7, 9])

unzipi :: [(a,b)] -> ([a],[b])
unzipi xs = (xl,xr) where 
        xl = foldr (\(x,y) acu -> x:acu) [] xs
        xr = foldr (\(x,y) acu -> y:acu) [] xs

--d) pair2List ::(a, [b ]) → [(a, b)] que dado un par formado por un valor x y una lista xs convierta
--a la lista xs en una lista de pares, formada con los elementos de xs y x .
--Ej. pair2List (x , [y1 , y2 , y3 ]) = [(x , y1 ),(x , y2 ),(x , y3 )]

pair2Listi :: (a,[b]) -> [(a,b)] 
pair2Listi (a,xs) = foldr (\x acu -> (a,x):acu) [] xs

--e) maxSec :: [(Int, Int)] → (Int, Int), que dada una lista de pares de naturales que represente a
--una lista de segmentos de la recta, calcule el segmento m´as largo de la misma.
--Ej.maxSec [(1, 2),(0, 7),(4, 6)] = (0, 7)

-- Aca la hago con una auxiliar que me invente yo
longseg :: (Int,Int) -> Int
longseg (x,y) = y-x

maxSece :: [(Int,Int)] -> (Int,Int)
maxSece xs = foldr (\x acu -> if longseg x > longseg acu then x else acu) (0,0) xs

-- Ahora con la ayuda que da rabasedas (literalmente te dice que armes maxL)
maxLe :: (Int, Int) -> (Int, Int) -> (Int, Int)
maxLe (x,y) (a,b)       | y-x > b-a = (x,y)
                        | otherwise = (a,b)

maxSece2 :: [(Int,Int)] -> (Int,Int)                        
maxSece2 xs = foldr (\x acu -> maxLe x acu) (0,0) xs 
