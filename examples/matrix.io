Matrix := Object clone

// dim sets the dimensions (rows, columns) for an existing matrix
Matrix dim := method(
    rows, cols,
    self data := list()
    for(r, 0, rows - 1,
        tmp := list()
        for(c, 0, cols - 1, 1,
        tmp append(0))
    self data append(tmp)))

// set puts the given value at the position of the given row and column
Matrix set := method(
    row, col, value,
    self data at(row) atPut(col, value))

// get returns the value at the position of the given row and column
Matrix get := method(
    row, col,
    self data at(row) at(col))

// transpose turns an (x,y) matrix into an (y,x) matrix, retaining the data
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

// output prints the matrix to the standard output
Matrix output := method(
    for(i, 0, self data size - 1,
        for(j, 0, self data at(i) size - 1,
            self get(i, j) print
            " " print)
        " " println))

// saveToFile saves the matrix to the given file name
Matrix saveToFile := method(
    filename,
    file := File clone open(filename)
    for(row, 0, self data size - 1,
        for(col, 0, self data at(row) size - 1,
            file write(self get(row, col) asString, " "))
        file write("\n"))
    file close)

// readFromFile reads the matrix from the given file name
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

// Example 1: a (2,3) matrix
matrix := Matrix clone
matrix dim(2, 3)
matrix set(0, 0, 10)
matrix set(0, 1, 20)
matrix set(0, 2, 30)
matrix set(1, 0, 40)
matrix set(1, 1, 50)
matrix set(1, 2, 60)
"manually defined matrix" println
matrix output

// Example 2: a matrix read from a file, transposed, and written back
"matrix from file 'matrix.txt'" println
matrix := readFromFile("matrix.txt")
matrix output
"transposed matrix from file 'matrix.txt'" println
matrix transpose
matrix output
"transpose it back, and save it to 'matrix.txt' again" println
matrix transpose
matrix saveToFile("matrix.txt")
