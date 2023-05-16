--Una estructura de datos queda definida si damos:
--    El conjunto de valores que puede tomar,
--    Un conjunto de operaciones definidas sobre estos valores,
--    Un conjunto de propiedades que relacionan todo lo anterior.


-- En las estructuras efimeras, cualquier cambio significa eliminar informacion.
-- Las estructuras efimeras soportan una sola version.

-- Las estructuras persistentes, soportan un historial de versiones.
-- La flexibilidad de las estructuras persistentes tienen un costo:
-- Debemos adaptar las estructuras y algoritmos al modelo persistente. A veces no es posible.

-- La eficiencia de algunos algoritmos para estructuras efimeras, 
-- no se van a poder alcanzar con modelos persistentes.


-- En un lenguaje funcional puro, todas las estructuras son persistentes.

-- Las estructuras persistentes al modificarse no se sobrescribe. 
-- Se duplican los datos y se modifica la copia.
-- Las diferentes versiones comparten la informacion. A esto se lo llama sharing.

-- El manejo automatico de la memoria es imprescindible. 
-- Para esto es necesario implementar un garbage collection.