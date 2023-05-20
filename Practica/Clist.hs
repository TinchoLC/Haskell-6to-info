data Clist a = EmptyCL | CUnit a | Consnoc a (Clist a) a

--funciones de acceso:
headCL (CUnit x) = x
headCL (Consnoc x xs y) = x

tailCL (CUnit x) = EmptyCL
tailCL (Consnoc x xs y) = Consnoc (headCL xs) (tailCL xs) y

isEmptyCL EmptyCL = True
isEmptyCL _ = False

isCUnit (CUnit _) = True
isCUnit _ = False

--b)
reverseCL EmptyCL = EmptyCL
reverseCL (CUnit x) = CUnit x
reverseCL (Consnoc x xs y) = Consnoc y (reverseCL xs) x
