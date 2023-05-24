{-# LANGUAGE FlexibleContexts #-}

-- Practica Tipos - BT - BST - RBT - Leftist Heaps

data Nat = Cero | Succ Nat deriving Show
-- a) ¿Que tipo tiene Succ? 
-- es tipo Nat

-- b) Definir la funci´on int2Nat :: Int → Nat que dado un entero retorne su representaci´n en Nat
-- Ejemplo int2Nat 4 = Succ (Succ (Succ (Succ Cero)))
int2Nat :: Int -> Nat
int2Nat 0 = Cero 
int2Nat x = Succ (int2Nat (x-1))

--c) Definir la funci´on suma :: Nat → Nat → Nat NO convertir los Nat a enteros para poder sumarlos.
sumaNat :: Nat -> Nat -> Nat
sumaNat x Cero = x
sumaNat x (Succ y) = sumaNat (Succ x) y 

--d) Definir la funci´on nat2Int :: Nat → Int que dado un Nat retorne a que entero representa.
nat2Int :: Nat -> Int 
nat2Int Cero = 0
nat2Int (Succ x) = 1 + nat2Int x

-- 2)
-- 2. Dado el tipo de datos de ´arboles binarios:
data Arb = Ek | H Int | Nk Arb Arb deriving Show
-- y el tipo de datos de comandos, para navegar el ´arbol:
data Cmd = L | R deriving Show

instance Eq Cmd where
  L == L = True
  R == R = True
  _ == _ = False

--a) ¿Qu´e tipo tiene N?
-- Tiene tipo Arb

-- b) Definir la funci´on parcial selec::[Cmd] → Arb → Arb, que selecciona el sub´arbol correspondiente.
-- Por ej:
--                 /\
-- select [L,R] ( /  \ ) = H 4
--               /\   5
--              /  \
--             3    4
-- La funci´on selec es parcial, ya que no est´a definida para listas de comandos err´oneas (como por
-- ejemplo, ir a la izquierda cuando nos encontramos en una hoja).
esearbol = Nk (Nk (H 3) (H 4)) (H 5)

selecA :: [Cmd] -> Arb -> Arb 
selecA xs Ek = Ek
selecA xs (H x) = H x
selecA [] arb = arb 
selecA (x:xs) (Nk lef rig)   | x == L = selecA xs lef 
                            | otherwise = selecA xs rig

--c) Definir una funcion enum :: Arb → [[Cmd]] que devuelva todas las
-- secuencias de comandos validas para ir desde la raız hasta una hoja.
enum :: Arb -> [[Cmd]]
enum Ek = [[]]
enum (H x) = [[]]
enum (Nk l r) = map (L:) (enum l) ++ map (R:) (enum r) s

-- 3)
-- Un lenguaje imperativo simple solo permites variables de un unico tipo, para esto se mantiene
-- un estado con el nombre de las variables y sus valores. Un Estado es una estructura secuencial 
-- formada por un nombre de variable y el valor correspondiente. Se requiere las siguientes 
-- operaciones sobre Estado:
-- inicial : Estado a
-- update : Nombre → A → Estado a → Estado a
-- lookfor : Nombre → Estado a → Maybe a
-- free : Nombre → Estado a → Estado a

-- inicial representa el estado inicial de un programa donde no sean definido ninguna variable
-- update permite actualizar el valor de una variable existente y si la variable no existe la agrega
-- al estado con el valor dado.
-- lookfor dado el nombre de una variable permite obtener el valor de esta si es que existe en
-- el estado.
-- free dado el nombre de una variable la elimina del estado.

-- 4) funciones pa
data BST a = E | N (BST a) a (BST a) deriving Show
arbolejemplo = N (N (N E 8 E) 3 E) 4 (N (N E 5 E) 6 (N E 7 E))
-- a) calcule el n´umero de nodos en un nivel espec´ıfico de un ´arbol binario
numnodbin :: Int -> BST a -> Int 
numnodbin _ E = 0
numnodbin 0 _ = 1 
numnodbin x (N lef _ rig) = numnodbin (x-1) lef + numnodbin (x-1) rig 

-- b) reciba un arbol binario de busqueda y verifique si es un arbol balanceado, es decir, que la
-- diferencia de alturas entre su subarbol izquierdo y derecho no sea mayor que 1 para todos los nodos
-- numnodbin :: BST a -> BST a -- xd


-- c) encuentren el sucesor y el predecesor de un valor dado en un ´arbol binario de b´usqueda. El
-- sucesor es el valor m´as peque˜no mayor que el valor dado, y el predecesor es el valor m´as
-- grande menor que el valor dado

-- d) dado un Leftist Heaps, retorne una lista con sus elementos ordenados de mayor a menor

-- e) verifique si un ´arbol cumple con la propiedad de Leftist Heap

-- f) elimine todos los elementos duplicados en un Leftist Heap y devuelva el nuevo heap resultante

-- g) verifique si un ´arbol cumple con la propiedad de Red − Black − Tree
