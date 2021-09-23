sum2d := method(
    arr := call evalArgAt(0)
    acc := 0
    arr foreach(
        i,
        sub_arr,
        sub_arr foreach(
            j,
            element,
            acc = acc + element))
    acc
)

numbers := list(list(1, 2, 3), list(4, 5, 6), list(7, 8, 9))
sum2d(numbers) println
