--
-- Heaps comunes
--
-- Arboles que permiten acceso eficiente al minimo elemento

-- Invariantes:
-- Todo nodo es menor a todos los valores de sus hijos 
-- Por lo anterior, el minimo siempre estará en la raiz

-- Operaciones tipicas:
-- insert :: Ord a => a -> Heap a -> Heap a
-- findMin :: Ord a => Heap a -> a
-- deleteMin :: Ord a => Heap a -> Heap a



--
-- Leftist Heaps
--

--                       1
--           7                       3
--   10              9
--               12      11
-- Heaps con una invariante mas:
-- º El rango de cualquier hijo izquierdo es mayor o igual que el de su hermano de la derecha.
-- Para explicar esto:
-- Rango es la longitud de la espina derecha de cada nodo.
-- La espina derecha es la ruta más corta a una hoja. 
-- Como consecuencia los elementos de la espina derecha están ordenados
--
-- Tiene todas las operaciones de Heaps y una adicional: 
-- merge :: Ord a => Heap a -> Heap a -> Heap a (la union entre dos heaps)

type Rank = Int
data Heap a = E | N Rank a (Heap a) (Heap a)

merge :: Ord a => Heap a -> Heap a -> Heap a
merge h1 E = h1
merge E h2 = h2
merge h1@(N _ x a1 b1) h2@(N _ y a2 b2) = -- el @ sirve para decir sinonimos, es decir, h1 = N _ x a1 b1
                            if x <= y then makeH x a1 (merge b1 h2)
                            else makeH y a2 (merge h1 b2) -- se pone al menor 
-- Decidido quien es la nueva ra´ız, debemos determinar los dos sub-´arboles
-- que la acompa˜nen:
-- Las espinas derechas (b) se mezclan (merge) para seguir ordenadas y
-- preservar la invariante leftist. Para preservarla definimos makeH.

rank :: Heap a -> Rank -- devuelve el rango de un heap
rank E = 0
rank (N r _ _ _ ) = r

-- Crea un heap
makeH x a b = if rank a >= rank b   then N (rank b + 1) x a b
                                    else N (rank a + 1) x b a

-- Tanto rank como makeH no son recursivas.
-- Como la espina derecha es logaritmica, merge es logaritmica.

-- Si se define bien el merge, el resto de operaciones es muy simple.

insert:: Ord a => a -> Heap a -> Heap a 
insert x h = merge (N 1 x E E) h

findMin :: Ord a => Heap a -> a -- super simple, el minimo siempre estara en la raiz.
findMin (N _ x a b) = x 

deleteMin :: Ord a => Heap a -> Heap a -- borras la raiz y mergeas.
deleteMin (N _ x a b) = merge a b 

-- asd