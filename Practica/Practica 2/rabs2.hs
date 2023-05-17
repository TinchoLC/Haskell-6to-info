-- Practica 2

--1)

--xd

--2)

type Cadena = [Char]
type Cursor = Int
type Linea = (Cadena,Cursor)

vacia :: Linea
vacia = ([], 0)

perrotres::Linea
perrotres = ("Perro", 3)

moverIzq :: Linea -> Linea
moverIzq(xs, 0) = (xs, 0)
moverIzq(xs, n) = (xs, n-1)

moverDer :: Linea -> Linea
moverDer(xs,n)  | n < length xs = (xs,n+1)
                | otherwise = (xs,n)

moverIni :: Linea -> Linea
moverIni(xs,n) = (xs,0)

moverFin :: Linea -> Linea
moverFin(xs,n) = (xs, length xs)

insertar :: Char -> Linea -> Linea
insertar a (xs,n) = (ins a n xs,n+1)
ins :: Char -> Int -> [Char] -> [Char]
ins a 0 xs = (a:xs)
ins a n (x:xs) = x:(ins a (n-1) xs)

borrar :: Linea -> Linea
borrar (xs, 0) = (xs,0)
borrar (xs,n) = (bor n xs, n-1)
bor :: Int -> [Char] -> [Char]
bor 1 (x:xs) = xs
bor n (x:xs) = x:(bor (n-1) xs)

--8)
data BST a = E | N (BST a) a (BST a) deriving Show

data Color = R | B deriving Show 
data RBT a = Eb | Nb Color (RBT a) a (RBT a) deriving Show

fromOrdList :: [x] -> BST x
fromOrdList [] = E
fromOrdList xs = 
    let     n = length xs
            m = div n 2
            x = xs!!m 
            ls = take m xs
            rs = drop (m+1) xs
            (t1,t2) = (fromOrdList ls, fromOrdList rs)
            in (N t1 x t2)

-- para hacer esto con RBT tengo que aplicar el logaritmo entero / pares tienen raiz roja (que luego se pinta) / impares raiz negra
-- recordar se puede tener 2 negros seguidos pero no dos rojos seguidos 

{-fromOrdList2 :: [x] -> RBT x
fromOrdList2 [] = Eb
fromOrdList2 xs ==  let     n = length xs
            m = div n 2
            x = xs!!m 
            ls = take m xs
            rs = drop (m+1) xs
            (t1,t2) = (fromOrdList ls, fromOrdList rs)
            in (N t1 x t2)-} 




