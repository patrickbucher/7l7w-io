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
TwoDimensionalList transpose := method(
    old_rows := self data size
    old_cols := self data at(0) size
    new_rows := old_cols
    new_cols := old_rows
    for(r, 0, new_rows-1, 1,
        for(c, 0, new_cols-1, 1,
            a := self data at(r) at(c)
            b := self data at(c) at(r)
            self data at(c) atPut(r, a)
            self data at(r) atPut(c, b))))
