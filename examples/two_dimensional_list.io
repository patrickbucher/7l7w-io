TwoDimensionalList := Object clone

TwoDimensionalList dim := method(
    rows, cols,
    self data := list()
    for(r, 0, rows - 1,
        tmp := list()
        for(c, 0, cols - 1, 1,
        tmp append(0))
    self data append(tmp)))

TwoDimensionalList set := method(
    row, col, value,
    self data at(row) atPut(col, value))

TwoDimensionalList get := method(
    row, col,
    self data at(row) at(col))

TwoDimensionalList transpose := method(
    rows := self data size
    cols := self data at(0) size
    t := TwoDimensionalList clone
    t dim(cols, rows)
    for(row, 0, rows - 1,
        for(col, 0, cols - 1,
           val := self get(row, col)
           t set(col, row, val)))
    self data := t data)

TwoDimensionalList output := method(
    for(i, 0, self data size - 1,
        for(j, 0, self data at(i) size - 1,
            self get(i, j) print
            " " print)
        " " println))

matrix := TwoDimensionalList clone
matrix dim(3, 4)
matrix set(0, 0, 1)
matrix set(0, 1, 2)
matrix set(0, 2, 3)
matrix set(0, 3, 4)
matrix set(1, 0, 5)
matrix set(1, 1, 6)
matrix set(1, 2, 7)
matrix set(1, 3, 8)
matrix set(2, 0, 9)
matrix set(2, 1, 10)
matrix set(2, 2, 11)
matrix set(2, 3, 12)

"original" println
matrix output

"transposed" println
matrix transpose
matrix output
