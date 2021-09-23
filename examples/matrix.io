Matrix := Object clone

Matrix dim := method(
    rows, cols,
    self data := list()
    for(r, 0, rows - 1,
        tmp := list()
        for(c, 0, cols - 1, 1,
        tmp append(0))
    self data append(tmp)))

Matrix set := method(
    row, col, value,
    self data at(row) atPut(col, value))

Matrix get := method(
    row, col,
    self data at(row) at(col))

Matrix transpose := method(
    rows := self data size
    cols := self data at(0) size
    t := Matrix clone
    t dim(cols, rows)
    for(row, 0, rows - 1,
        for(col, 0, cols - 1,
           val := self get(row, col)
           t set(col, row, val)))
    self data := t data)

Matrix output := method(
    for(i, 0, self data size - 1,
        for(j, 0, self data at(i) size - 1,
            self get(i, j) print
            " " print)
        " " println))

Matrix saveToFile := method(
    filename,
    file := File clone open(filename)
    for(row, 0, self data size - 1,
        for(col, 0, self data at(row) size - 1,
            file write(self get(row, col) asString, " "))
        file write("\n"))
    file close)

readFromFile := method(
    filename,
    file := File clone open(filename)
    lines := file readLines
    rows := list()
    lines foreach(
        line,
        cols := list()
        line split foreach(
            token,
            cols append(token asNumber))
        rows append(cols))
    matrix := Matrix clone
    matrix dim(rows size, rows at(0) size)
    for(r, 0, rows size - 1,
        for(c, 0, rows at(0) size - 1,
            matrix set(r, c, rows at(r) at(c))))
    matrix)

"original" println
matrix := readFromFile("matrix.txt")
matrix output

"transposed" println
matrix transpose
matrix output

matrix transpose
matrix saveToFile("matrix.txt")
