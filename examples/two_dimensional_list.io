TwoDimensionalList := Object clone
TwoDimensionalList dim := method(
    x, y,
    self data := list()
    for(i, 0, y-1, 1,
        tmp := list()
        for(j, 0, x-1, 1,
        tmp append(0))
    self data append(tmp)))
TwoDimensionalList set := method(
    x, y, value,
    self data at(y) atPut(x, value))
TwoDimensionalList get := method(
    x, y,
    self data at(y) at(x))
