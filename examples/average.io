Numbers := List clone
Numbers average := method(self sum / self size)

fibonacci := Numbers clone
fibonacci append(1)
fibonacci append(1)
fibonacci append(2)
fibonacci append(3)
fibonacci append(5)
fibonacci append(8)
fibonacci append(13)
fibonacci append(21)
fibonacci append(34)
fibonacci append(55)
fibonacci average println
