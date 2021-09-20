OperatorTable addOperator("safediv", 2)
Number safediv := method(divisor, if(divisor == 0, 0, self / divisor))
