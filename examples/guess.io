min := 1
max := 100
random := Random clone
solution := random value(1, 100) round

triesTotal := 10
triesDone := 0
correct := false

while(
    correct == false and triesDone < triesTotal,
    triesLeft := triesTotal - triesDone
    writeln("Guess the number betweeen ", min, " and ", max, ". (", triesLeft, " tries left)")
    input := File standardInput readLine
    guess := input asNumber
    if(guess == solution,
       correct = true,
       if(correct == false and triesDone == 1,
          if((guess - solution) abs) < 50,
          "hot" println,
          "cold" println))
    triesDone = triesDone + 1)
if(correct == true,
    "you guessed the right number by mere chance" println,
    "you failed, as with everything in your miserable life" println)
