-- Practica 2

--1)

type RGB = (Int,Int,Int)

mezclar :: RGB -> RGB -> RGB
mezclar (x,y,z) (a,b,c) = (div (x+a) 2,div (y+b) 2,div (z+c) 2)

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

--3)
data Clist a = EmptyCL | CUnit a | Consnoc a (Clist a) a deriving Show

--funciones de acceso:
headCL (CUnit x) = x
headCL (Consnoc x xs y) = x

tailCL (CUnit x) = EmptyCL
tailCL (Consnoc x xs y) = Consnoc (headCL xs) (tailCL xs) y

isEmptyCL EmptyCL = True
isEmptyCL _ = False

isCUnit (CUnit _) = True
isCUnit _ = False

--b)
reverseCL EmptyCL = EmptyCL
reverseCL (CUnit x) = CUnit x
reverseCL (Consnoc x xs y) = Consnoc y (reverseCL xs) x

--c) Definir una funcion inits que toma una CList y devuelve una CList con todos los posibles
-- inicios de la CList
-- xd

--d) Definir una funci´on lasts que toma una CList y devuelve una CList con todas las posibles
-- terminaciones de la CList.
-- xd

--e) Definir una funci´on concatCL que toma una CList de CList y devuelve la CList con todas ellas
-- concatenadas
-- ultimovalor :: [a] -> a
-- ultimovalor [a] = a 
-- ultimovalor (x:xs) = ultimovalor xs

-- listACList :: [a] -> Clist a
-- listACList [] = EmptyCL
-- listACList [a] = CUnit a
-- listACList (x:xs) = (x (take (length(xs)-1) xs) ultimovalor xs)

-- Clist

-- concatCL1 :: Clist (Clist a) -> [a]
-- concatCL = 


-- concatCL :: Clist (Clist a) -> Clist a
--concatCL xsss = listACList (concatCL1 xsss)

-- ME RINDO ME DUELE LA PANSAAAA

--4) Dado el siguiente tipo algebraico:
data Aexp = Num Int | Prod Aexp Aexp | Div Aexp Aexp  deriving Show
--a) Defina un evaluador eval :: Aexp → Int. ¿Como maneja los errores de division por 0? 

eval :: Aexp -> Int
eval (Num x) = x
eval (Prod x y) = eval x * eval y
eval (Div x y)
    | eval y == eval (Num 0) = error "Math error: division por cero"
    | otherwise = eval x `div` eval y

--b) Defina un evaluador seval :: Aexp → Maybe Int.
-- ME RINDO ME SIGUE DOLIENDO LA PANzA

--5) Definir las siguientes funciones sobre arboles binarios de busqueda (bst):
--a) maximum :: BST a → a, que calcula el maximo valor en un bst.
data BST a = Hoja | Nodo (BST a) a (BST a) deriving Show

minimumBST :: BST a -> a
minimumBST (Nodo Hoja x r) = x
minimumBST (Nodo l x r) = minimumBST l

maximumBST :: BST a -> a
maximumBST (Nodo l x Hoja) = x
maximumBST (Nodo l x r) = maximumBST r

--b) checkBST :: BST a → Bool, que chequea si un arbol binario es un bst.
{- Requisitos:
- E es BST
- (N L x R)
- L y R son BST
- si y es un valor de L entonces y <= x
- si y es un valor de R entonces y > x -}

checkBST :: Ord a => BST a -> Bool
checkBST Hoja = True
checkBST (Nodo Hoja x Hoja) = True
checkBST (Nodo Hoja x r) = checkBST r && ((minimumBST r) > x)
checkBST (Nodo l x Hoja) = checkBST l && ((maximumBST l) <= x)
checkBST (Nodo l x r) = checkBST r && checkBST l && (minimumBST r > x) && (maximumBST l <= x)

{-6) Si un arbol binario es dado como un nodo con dos subarboles identicos se puede aplicar
la tecnica sharing, para que los subarboles sean representados por el mismo arbol. Definir las
siguientes funciones de manera que se puedan compartir la mayor cantidad posible de elementos
de los arboles creados:-}
--a) completo :: a → Int → Tree a, tal que dado un valor x de tipo a y un entero d, crea un arbol binario completo de altura d con el valor x en cada nodo.
completo :: a -> Int -> BST a
completo _ 0 = Hoja
completo x d 
    | d < 0 = error "tamaño inválido"
    | otherwise = Nodo (completo x (d - 1)) x (completo x (d - 1))

--b) balanceado :: a → Int → Tree a, tal que dado un valor x de tipo a y un entero n, crea un arbol binario balanceado de tamaño n, con el valor x en cada nodo
balanceado :: a -> Int -> BST a
balanceado _ 0 = Hoja
balanceado x n
    | n < 0 = error "tamaño inválido"
    | otherwise = 
        let
            ls = (n - 1) `div` 2
            rs = (n - 1) - ((n - 1) `div` 2)
                in Nodo (balanceado x ls) x (balanceado x rs)

{-7. La definicion de member dada en teorıa (la cual determina si un elemento esta en un bst)
realiza en el peor caso 2 ∗ d comparaciones, donde d es la altura del arbol. Dar una definicion
de menber que realice a lo sumo d + 1 comparaciones. Para ello definir member en terminos de
una funcion auxiliar que tenga como parametro el elemento candidato, el cual puede ser igual al
elemento que se desea buscar (por ejemplo, el ultimo elemento para el cual la comparacion de
a 6 b retorno True) y que chequee que los elementos son iguales solo cuando llega a una hoja del
arbol.-}
member e Hoja = False
member e (Nodo l x r)
    | e==x = True
    | e > x = member e r
    | otherwise = member e l
-- 2 * d 
member' e c Hoja = e == c
member' e c (Nodo l x r) 
    | e > x = member' e c r
    | otherwise = member' e x l
-- d + 1

--8)

data Colore = R | B deriving Show 
data RBT a = Eb | Nb Colore (RBT a) a (RBT a) deriving Show

fromOrdList :: [x] -> BST x
fromOrdList [] = Hoja
fromOrdList xs = 
    let     n = length xs
            m = div n 2
            x = xs!!m 
            ls = take m xs
            rs = drop (m+1) xs
            (t1,t2) = (fromOrdList ls, fromOrdList rs)
            in (Nodo t1 x t2)

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




