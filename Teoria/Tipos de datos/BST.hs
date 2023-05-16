-- Un arbol es una estructura de dato donde la informacion almacenada se conecta 
-- sin formar ciclos mediante ramas. Esas conexiones cumplen la relacion padre-hijo.
-- El primer nodo del arbol se lo denomina raiz y a lo ultimos se los llama hojas. 
-- Todos los demas puntos de ramificacion se denominaran simplemente nodos
-- Un arbol binario es un arbol en el que cada nodo puede tener como maximo dos hijos

data ArBin a = Hoja | Nodo (ArBin a) a (ArBin a) deriving Show

-- Los arboles binarios de busqueda (BST) son arboles ordenados.

arbolito = Nodo Hoja 5 (Nodo Hoja 8 Hoja)

minimoArBinB :: Ord a => ArBin a -> a
minimoArBinB (Nodo Hoja x r) = x
minimoArBinB (Nodo l x r) = minimoArBinB l

-- Para insertar, recorremos el arbol hasta encontrar una hoja, que transformamos en un nuevo nodo.
insertArBinB :: Ord a => a -> ArBin a -> ArBin a
insertArBinB a Hoja = Nodo Hoja a Hoja
insertArBinB a (Nodo l b r )  | a <= b = Nodo (insertArBinB a l) b r
                              | otherwise = Nodo l b (insertArBinB a r )

-- borrar

delete :: Ord a => a -> ArBin a -> ArBin a
delete _ Hoja = Hoja
delete z (Nodo l b r ) | z < b = Nodo (delete z l) b r
delete z (Nodo l b r ) | z > b = Nodo l b (delete z r)
-- aca encontramos al nodo, ahora tenemos 3 casos.
-- El nodo tiene hojas como subarboles
delete z (Nodo Hoja b Hoja) | z == b = Hoja

-- el nodo tiene un solo subarbol con datos
delete z (Nodo Hoja b r) | z == b = r
delete z (Nodo l b Hoja) | z == b = l

-- el nodo tiene ambos subarboles con datos, entonces buscamos el minimo de la rama derecha y lo colocamos
delete z (Nodo l b r) | z == b =  Nodo l (minimoArBinB r) (delete (minimoArBinB r) r)

-- Los BST pueden degenerar en una lista si los datos se insertan en orden