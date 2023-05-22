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