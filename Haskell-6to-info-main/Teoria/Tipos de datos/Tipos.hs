-- Tipos

-- type (sinonimo de tipo)
type Stringx = [Char]
type Pos = (Int,Int)
-- Empiezan con mayusculas
-- No puede ser recursivo

-- data (nuevo tipo completo)
data Boole = Falsex | Truex deriving Show -- False y True son constructores y empiezan con mayus
data Answer = Yes | No | Unknown deriving Show

-- data puede tener parametros
data Shape = Circle Float | Rect Float Float deriving Show 
-- deriving Show es para poder mostrar el dato
square :: Float -> Shape
square n = Rect n n
area :: Shape -> Float
area (Circle r) = 3.14 * r^2
area (Rect x y) = x * y

-- Las declaraciones data pueden tambien tener parametros de tipos.
data Maybes x = Nothings | Justs x deriving Show 

safediv :: Int -> Int -> Maybes Int
safediv _ 0 = Nothings
safediv m n = Justs ( m `div` n )
-- div y mod SE DEBEN PONER CON `` ASI `div` y `mod`

-- Las declaraciones data pueden ser recursivas:
data Nat = Zero | Succ Nat deriving Show

-- pueden mezclar recursividad con parametros de tipo
data List a = Nil | Cons a (List a) deriving Show

-- 
data Personx = Personx String String Int Float String String deriving Show
-- Se puede definir de mejor manera
data Person = Person {  firstName :: String
                        , lastName :: String
                        , age :: Int
                        , height :: Float
                        , phoneNumber :: String
                        , flavor :: String
} deriving Show
-- Se crean automaticamente las funciones para obtener los campos: 
-- firstName, lastName, age, height, phoneNumber y flavor
nombredepepe = firstName pepe -- se permite esto

-- Gracias a esto se puede definir
pepe = Person {lastName = "Finklestein"
, firstName = "Buddy"
, height = 184.2
, age = 43
, flavor = "Chocolate"
, phoneNumber = "526-2928"
}


-- case se utiliza asi
esCero :: Nat -> Bool
esCero n = case n of
        Zero -> True
        _ -> False
