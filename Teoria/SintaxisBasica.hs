-- Los argumentos de las funciones se separan con espacios
-- Las funciones y sus argumentos deben empezar con minuscula
ejempluncion:: Int -> Int
ejempluncion x = x+1
-- La aplicacion de funciones tiene mayor precedencia que cualquier otro operador

-- PALABRAS RESERVADAS
-- case class data default deriving do else if import in infix
-- infixl infixr instance let module newtype of then type where

-- En una serie de definiciones, cada definicion debe empezar en la misma columna.
a = b + c 
  where
      b = 1 
      c = 2

as = b + c where
            b = 1 
            c = 2

-- Notar tambien el uso de let/in
sumar :: Int -> Int
sumar x = let a = 1
              b = 2
          in x + a + b

-- TIPOS DE DATOS (empiezan con mayuscula)
-- Bool - Char - Int - Integer (precisión arbitraria) - Float - [x] (x List) - (x,y)

-- Salvo en el caso de las tuplas, todas las funciones en Haskell estan currificadas

-- Una funci´on es polim´orfica si su tipo contiene una o m´as variables de tipo.
lengthhh :: [a] -> Int
lengthhh [] = 0
lengthhh (x:xs) = 1 + lengthhh xs

-- Las funciones pueden ser definidas usando expresiones condicionales
abss :: Int -> Int
abss n = if n > 0 then n else (-n)

-- Una alternativa a los condicionales es el uso de ecuaciones conguardas. 
absss :: Int -> Int
absss n   | n > 0 = n
          | otherwise = (-n)

-- El sımbolo _ es un patron comodin que machea cualquier patron.

-- El patron x : xs debe ir entre parentesis ya que la aplicacion tiene prioridad sobre el (:)

-- Las funciones pueden construirse sin nombres usando expresiones lambda:
-- λx → x + x       en hs  \x -> x + x
-- Es la funcion que toma como entrada x y retorna el resultado x + x .
-- El simbolo λ es la letra griega lambda y en el teclado se ingresa \.
-- Las funciones lambdas son utiles para evitar darles nombres a funciones que va a ser usadas una sola vez:
oddss n = map fss [0 .. (n - 1)] where 
          fss x = x * 2 + 1
-- Puede escribirse mas sinteticamente:
oddsss n = map (\x -> x * 2 + 1) [0 .. (n - 1)]

-- Un operador escrito entre sus dos argumentos (infijo), puede ser
-- escrito antes de sus dos argumentos (prefijo) usando par´entesis:
sumainfija x y= (+) x y

-- En general, dado un operador ⊕, entonces las funciones de la forma
-- (⊕), (x⊕), (⊕y) son llamadas secciones.
