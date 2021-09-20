Object ancestors := method(
    prototype := self proto
    if(prototype != Object,
       writeln("Slots of ", prototype type, "\n---")
       prototype slotNames foreach(slotName, writeln(slotName))
       writeln
       prototype ancestors)
    )

Person := Object clone
Person speak := method("blah, blah, blah" println)

Idiot := Person clone
Idiot speak := method("Hello, I'm so goofy." println)
Idiot think := method("Do flies call us 'walks'?" println)

jimbo := Idiot clone
jimbo ancestors
