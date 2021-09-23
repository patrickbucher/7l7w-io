OperatorTable addOperator("safediv", 2)
Number safediv := method(divisor, if(divisor == 0, 0, self / divisor))

16 / 2 println
16 / 1 println
16 / 0 println
