data Color = R | B deriving Show -- Sirve para que se pueda mostrar el deriving show
data RBT a = E | T Color (RBT a) a (RBT a) deriving Show
-- E significa Empty, T significa tree
colcha = T B ( T R ( T B E 1 E) 2 ( T B E 3 E) ) 5 ( T R ( T B E 6 E ) 7 ( T B E 8 E ))
-- Ejemplo de     
--B       5
--R   2       7
--B 1   3   6   8

colcho = T B ( T R E 2 E ) 5 ( T R E 7 E)
--B       5
--R   2       7

-- Invariantes: 
-- 1) Todos los nodos rojos tienen un padre negro. (Invariante Local)
-- 2) Todos los caminos de la raız a una hoja tienen el mismo numero de
-- nodos negros (altura negra). (Invariante Global) => balanceo

-- Esto significa que la altura siempre esta en el orden del log n 
-- (siendo n la cantidad de elementos + 1)

-- La siguiente funcion te muestra si algo es miembro
memberRBT :: Ord a => a -> RBT a -> Bool -- Ord fuerza que todos los valores se puedan comparar
memberRBT a E = False
memberRBT a (T _ l b r)     | a == b = True
                            | a < b = memberRBT a l
                            | a > b = memberRBT a r

-- La siguiente funcion inserta algo
insertRTB :: Ord a => a -> RBT a -> RBT a
insertRTB x t = makeBlack (ins x t)
    where   ins x E                   = T R E x E
            ins x (T c l y r)   | x < y     = balanceRTB c (ins x l) y r
                                | x > y     = balanceRTB c l y (ins x r)
                                | otherwise = T c l y r


-- Para mantener la (altura negra) el nuevo nodo se inserta rojo. (Global)
-- Pero esto puede romper la Propiedad 1,para solucionar esto vamos a rebalancear. (Local)
-- El rebalanceo puede dejarnos una raiz roja, asi que la coloreamos de negro.

-- Luego de insertar el nuevo nodo rojo hay a lo sumo una ´unica violaci´on de
-- la propiedad 1, que ocurre cuando el padre es rojo.
-- Esta violacion, puede aparecer en cuatro configuraciones:
-- z x y

-- Esta es la funcion que transforma un nodo de color x a un nodo de color B(lack)
makeBlack E = E
makeBlack (T _ l x r) = T B l x r

-- Esta es la funcion del balanceo
balanceRTB :: Color -> RBT a -> a -> RBT a -> RBT a
balanceRTB B (T R (T R a x b) y c) z d = T R (T B a x b) y (T B c z d)
balanceRTB B (T R a x (T R b y c)) z d = T R (T B a x b) y (T B c z d)
balanceRTB B a x (T R (T R b y c) z d) = T R (T B a x b) y (T B c z d)
balanceRTB B a x (T R b y (T R c z d)) = T R (T B a x b) y (T B c z d)
balanceRTB c l a r = T c l a r

-- Es una implementacion no recursiva.
-- El costo de insert es logaritmico.
