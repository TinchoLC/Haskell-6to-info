-- Determina el consumo de recursos
-- energia, ancho de banda, tiempo de computo, memoria o almacenamiento
-- ES:
-- Preciso para poder comparar.
-- Seleccionar el mas eficiente.
-- Abstracto para no depender de detalles que cambian todo el tiempo. Compiladores, arquitecturas.
-- Analisis Asintotica y modelo de costo.
-- Correccion de los algoritmos

-- Analisis Asintotico
-- Nos interesa saber el orden de crecimiento de los recursos que consumen un algoritmo.
-- Necesitamos analizarlos instancias grandes de su entrada para evidenciarlo.
-- Analisis Asintotico de su eficiencia.
-- Obtenemos una ecuacion en terminos de la entrada.

-- aca faltan los tipos de funciones, O, Omega, 0

-- MODELO DE COSTO
-- Basados en Maquinas: considera el costo de las instrucciones ejecutadas por el algoritmo en la maquina subyacente.
-- son mas precisos, pero su analisis es complejo y poco expresivo.

-- Basados en lenguajes: considera una funcion de costo sobre el lenguaje de implementacion del algoritmo.
--son mas simples, pero menos precisos en algunos casos.

-- Ambos ignoran factores constantes que dependan del hardware.
-- Permite analizar algoritmos paralelos mas facilmente.

-- MODELO BASADO EN LENGUAJES
-- Utilizaremos uno que se basa en 2 metricas
-- WORK: numero total de operaciones realizadas. COSTO SECUENCIAL .. W (e)
-- SPAN: cadena mas larga de dependencias del computo. COSTO PARALELO .. S (e)

-- EJEMPLO CON msort (merge sort)
msort [] = []
msort [x] = [x]
msort xs = let (ls,rs) = split xs
               (ls',rs') = (msort ls||msort rs) // || no existe nose
           in merge (ls',rs')
           
-- Wmsort(0) = k0 // ingreso 0 porque tiene long0
-- Wmsort(1) = k1 // ingreso 1 porque tiene long1
-- Wmsort(n) = Wsplit(n) + 2 Wmsort(n/2) + Wmerge(n) + k2 si n > 1 // Ingreso n porque tiene longn

split [] = ([],[])
split [x] = ([x],[])
split (x:y:zs) = let (xs,ys) = split zs
                 in ((x:xs),(y:ys))
                
merge ([],ys) = ys
merge (xs,[]) = xs
merge (x:xs,y:ys) = if x <= y 
                    then (x:merge (xs,(y:ys)))
                    else (y:merge ((x:xs),ys))
