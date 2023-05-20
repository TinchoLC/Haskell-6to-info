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
