fib := method(
    n := call evalArgAt(0)
    if(n == 0 or n == 1, 1, fib(n-1) + fib(n-2))
)

fib_iter := method(
    n := call evalArgAt(0)
    i := 0
    pre_prev := 1
    prev := 1
    acc := 0
    while(i <= n,
          if(i == 0 or i == 1,
             acc = 1,
             acc = pre_prev + prev
             pre_prev = prev
             prev = acc)
          i = i + 1)
    acc
)

fib(30) println
fib_iter(30) println
