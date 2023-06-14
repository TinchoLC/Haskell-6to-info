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
