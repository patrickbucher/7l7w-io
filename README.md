# Io

[Io](https://iolanguage.org) ist eine auf Prototypen basierte, objektorientierte
Programmiersprache.  Objekte basieren nicht auf einer Klasse, sondern sind
Kopien anderer Objekte.  Man interagiert mit Objekten, indem man ihnen
Nachrichten schickt (_Messaging_).

Für Alan Kay, der die objektorientierte Programmierung erfand, war Messaging die
zentrale Idee, nicht Klassen, Vererbung, Interfaces usw.

## Erste Schritte

Io kann mit dem Package-Manager des Betriebssystems oder via Download von der
[Webseite (binaries)](https://iolanguage.org/binaries.html) installiert werden.

Mit dem Befehl `io` startet man eine interaktive Sitzung:

    $ io
    Io 2017.09.06
    Io> 

In Io ist alles ein Objekt, und jedem Objekt können bestimmte Nachrichten
geschickt werden.

Hier wird dem String `"Hello, World!"` die Nachricht `print` geschickt:

    Io> "Hello, World!" print
    Hello, World!==> Hello, World!

Der _Empfänger_ der Nachricht steht links, die Nachricht steht rechts.

Speichert man folgendes Programm in einer Datei namens `hello.io` ab:

    "Hello, World!" println

Kann man es folgendermassen ausführen:

    $ io hello.io
    Hello, World!

## Objekte

Jedes Objekt wird vom ursprünglichen `Object` geklont:

    > Person := Object clone
    ==>  Person_0x559cbf4c9250:
      type             = "Person"

Mit dem Operator `:=` findet die initiale Zuweisung statt.

Alle Objekte werden in einem Namensraum namens `Lobby` abgelegt:

    > Lobby
    ==>  Object_0x559cbf19c770:
      Lobby            = Object_0x559cbf19c770
      Person           = Person_0x559cbf4c9250
      ...

### Slots

Statt Eigenschaften gibt es _Slots_, welche folgendermassen definiert werden
können:

    > Person name := "Patrick"
    ==> Patrick

Für die initiale Zuweisung muss `:=` verwendet werden, für spätere
Überschreibungen genügt `=`:

    > Person name = "Werner"
    ==> Werner

Die Slots können mit der Message `slotNames` angezeigt werden:

    > Person slotNames
    list(type, name)

### Typen

Objekte, die mit einem Grossbuchstaben anfangen, sind _Typen_ und haben darum
einen `type`-Slot.

Slots können abgefragt werden, indem man ihren Namen dem Objekt als Message
schickt:

    > Person type
    ==> Person

    > Person name
    ==> Werner

Objekte, die mit einem Kleinbuchstaben anfangen, sind einfache Objekte ohne
`type`-Slot:

    > peter := Person clone
    > peter name := "Peter"
    > peter slotNames
    ==> list(name)

Fragt man den `type`-Slot dennoch ab, wird die Nachricht an das Ursprungsobjekt
weiterdelegiert:

    > peter type
    ==> Person

Diese Kette kann beliebig lange sein:

    > Vehicle := Object clone
    > Ferrari := Vehicle clone
    > Ferrari country := "Italy"
    > FerrariEnzo := Ferrari clone
    > FerrariEnzo horsepower := 660
    > myFerrariEnzo := FerrariEnzo clone
    > myFerrariEnzo owner := "Patrick"
    > myFerrariEnzo owner
    ==> Patrick
    > myFerrariEnzo horsepower
    ==> 660
    > myFerrariEnzo country
    ==> Italy
    > myFerrariEnzo type
    ==> FerrariEnzo

Mit der `proto`-Message kann man anschauen, auf welchem Prototyp ein Objekt
basiert:

    > myFerrariEnzo proto
    ==>  FerrariEnzo_0x559cbf4278c0:
      horsepower       = 660
      type             = "FerrariEnzo"
    > FerrariEnzo proto
    ==>  Ferrari_0x559cbf44b1e0:
      country          = "Italy"
      type             = "Ferrari"
    > Ferrari proto
    ==>  Vehicle_0x559cbf3e64f0:
      drive            = method(...)
      type             = "Vehicle"

Man sieht auch, auf welcher Ebene welche Slots definiert sind.

### Methoden

Eine Methode wird mit der `method`-Message definiert:

    > Vehicle drive := method("Brum, Brum!" print)

Sie wird aufgerufen, indem man dem Objekt den Methodennamen als Message schickt:

    > myFerrariEnzo drive
    Brum, Brum!==> Brum, Brum!

Die Definition kann man sich anschauen, indem man die `getSlot`-Message mit
dem Slotnamen verwendet:

    > myFerrariEnzo getSlot("drive")
    ==> method(
        "Brum, Brum!" print
    )

### Singleton

Ein Objekt, das einmalig ist, bezeichnet man als Singleton. Mit Java oder C#
muss man bei der Implementierung auf einige Sachen achten. Mit Io ist diese ganz
einfach:

    > TheOneAndOnly := Object clone
    > TheOneAndOnly clone := TheOneAndOnly

Die `clone`-Message des Objekts `TheOneAndOnly` wird überschrieben, sodass sie
immer wieder das gleiche Objekt zurückgibt:

    > TheOneAndOnly name := "me"
    ==> me
    > alice := TheOneAndOnly clone
    > bob := TheOneAndOnly clone
    > alice == bob
    ==> true

## Collections

Neben Objekten hat Io zwei wichtige Datenstrukturen: Listen und Maps.

### Listen

Eine Liste kann erzeugt werden, indem man `List` klont:

    > names := List clone
    ==> list()

Man kann auch die `list`-Message verwenden und initiale Elemente definieren:

    > names := list("Alice", "Bob", "Mallory")
    ==> list(Alice, Bob, Mallory)

Elemente können mittels `append` am Ende angefügt werden:

    > names append("Zorro")
    ==> list(Alice, Bob, Mallory, Zorro)

Mit `prepend` kann ein Element hinten angefügt werden:

    > names prepend("Aaron")
    list(Aaron, Alice, Bob, Mallory, Zorro)

Die Anzahl der Elemente findet man mittels `size` heraus:

    > names size
    ==> 4

Mit `isEmpty` findet man heraus, ob eine Liste leer ist:

    > names isEmpty
    false
    > list() isEmpty
    true

Mit einem null-basierten Index kann man auf bestimmte Elemente zugreifen:

    > names at(0)
    ==> Alice
    > names at(3)
    ==> Zorro

Mittels `pop` kann das letzte Element entfernt werden:

    > names pop
    ==> Zorro
    > names
    ==> list(Alice, Bob, Mallory)

Listen, die Zahlen enthalten, unterstützen verschiedene arithmetische Methoden:

    > list(1, 1, 2, 3, 5, 8) sum
    ==> 20
    > list(1, 1, 2, 3, 5, 8) average
    ==> 3.3333333333333335

### Maps

Eine neue Map wird erstellt, indem man sie von der ursprünglichen `Map` klont:

    > dog := Map clone

Elemente können mit `at` abgefragt und mit `atPut` gesetzt werden:

    > dog atPut("name", "Woofie")
    > dog atPut("age", 3)
    > dog at("name")
    ==> Woofie
    > dog at("age")
    ==> 3

Die Grösse und Keys der Map können mit den Messages `size` und `keys` abgefragt
werden:

    > dog size
    2
    > dog keys
    ==> list(name, age)

Maps können in Objekte und (verschachtelte) Listen umgewandelt werden:

    > dog asObject
    ==>  Object_0x559cc01a2f60:
      age              = 3
      name             = "Woofie"
    > dog asList
    ==> list(list(name, Woofie), list(age, 3))

## Logik und Vergleiche

Für Vergleiche stehen verschiedene Operatoren zur Verfügung:

    > 3 > 5
    ==> false
    > 2 < 7
    ==> true
    > 3 >= 4
    ==> false
    > 5 <= 4
    ==> false

Logische Verknüpfungen macht man folgendermassen:

    > true and false
    ==> false
    > false or true
    ==> true
    > true and not false
    ==> false
    > true and 0
    ==> true
    > "" and 1
    ==> true 

# Kontrollstrukturen

## Verzweigungen

Die Kontrollstrukturen sind als Funktionen umgesetzt.  Die Verzweigung mit `if`
gibt es in zwei Versionen.

Die erste erwartet eine Bedingung und zwei Messages: die erste wird ausgeführt,
wenn die Bedingung zutrifft, die zweite im anderen Fall:

    > if(9 > 3, "Of course it is!" println, "That's surprising!" println)
    Of course it is!

    > if(0, "0 evaluates to true" println, "0 evaluates to false" println)
    0 evaluates to true

    > if("0" == 0.0, "same" println, "different" println)
    different

Die zweite besteht aus drei Funktionen: `if`, `then`, `else`:

    > if(9 > 3) then("Of course it is!" println) else("That's surprising!" println)
    Of course it is!

    > if(0) then("0 evaluates to true" println) else("0 evaluates to false" println)
    0 evaluates to true

    > if("0" == 0.0) then("same" println) else("different" println)
    different

## Schleifen

Die einfachste Art der Schleife ist eine Endlosschleife mit `loop`, welche eine
Message erwartet:

    > loop("hello" println)
    hello
    hello
    hello
    ...
    [Ctrl-C]

Die `while`-Schleife erwartet eine Bedingung und eine Message:

    > i := 0
    > while(i < 3, i println; i = i + 1)
    0
    1
    2

Hier wurden mehrere Messages mit einem Semikolon kombiniert.

Die `for`-Schleife erwartet den Namen einer Zählervariable, einem Startwert
(inklusiv), einen Endwert (auch inklusiv), einen optionalen Inkrementwert
(standardmässig `1`) und eine Message:

    > for(i, 0, 3, 1, i println)    // mit Inkrementwert 1
    0
    1
    2
    3
    > for(i, 0, 3, i println)       // ohne Inkrementwert
    0
    1
    2
    3

# Operatoren

Die Operatoren werden in einem Objekt namens `OperatorTable` verwaltet:

    > OperatorTable
        Operators
      0   ? @ @@
      1   **
      2   % * /
      3   + -
      4   << >>
      5   < <= > >=
      6   != ==
      7   &
      8   ^
      9   |
      10  && and
      11  or ||
      12  ..
      13  %= &= *= += -= /= <<= >>= ^= |=
      14  return

Sie sind in der Reihenfolge ihrer _Präzedenz_ gespeichert, d.h. die
"Punktoperatoren" `%`, `*` und `/` für Modulo, Multiplikation und Division haben
eine höhere Präzedenz (2) als die "Strichoperatoren" `+` und `-` für Addition
und Subtraktion:

    > 2 * 2 + 3 * 3
    13

    > (2 * 2) + (3 * 3)
    13

Neue Operatoren können mithilfe der `addOperator`-Message definiert ewrden,
welche eine Bezeichnung und Präzedenz erwartet:

    > OperatorTable addOperator("inc", 3)

Die Semantik des Operators muss separat in einer Methode definiert werden (`inc` bedeutet
"inkrement" und erhöht eine Zahl um 1):

    > inc := method(self, self + 1)

Das Objekt `self` bezeichnet das Objekt, auf welcher die Operation ausgeführt
wird. Hierbeihandelt es sich um einen Operator, der nur mit Operand arbeitet:

    > inc 0
    1
    > inc 10
    11

Operatoren, die mit zwei Operanden arbeiten, werden folgendermassen definiert:

    > OperatorTable addOperator("bigger", 5)
    > Number bigger := method(other, self > other)
    > 5 bigger 3
    true
    > 13 bigger 100
    false

# Messaging

Jede Message hat die Slots `sender` (der Absender), `target` (der Empfänger) und
`message` (die Nachricht). Die Nachricht selber verfügt über die Slots
`arguments` und `name`.

Auf diese Slots kann folgendermassen zugegriffen werden (`messaging.io`):

    agency := Object clone
    agency messageSender := method(call sender)
    agency messageTarget := method(call target)
    agency messageArgs   := method(call message arguments)
    agency messageName   := method(call message name)

Beispiel:

    $ io -i messaging.io
    > agency messageSender("foo", 1, :bar)  // Absender-Informationen
    ==>  Object_0x...
    > agency messageTarget("foo", 1, :bar)  // Empfänger-Informationen
    ==>  Object_0x...
    > agency messageArgs("foo", 1, :bar)    // Argumentliste
    ==> list("foo", 1, : bar)
    > agency messageName("foo", 1, :bar)    // Name
    ==> messageName

## Evaluation von Messages

Bei Sprachen wie Java oder C# werden die Argumente interpretiert, bevor eine
Methode aufgerufen wird:

    public static int add(int a, int b) {
        return a + b;
    }

    add(3 + 7, 2 + 3);

Die `add()`-Methode erhält die Argumente `10` und `5`, nicht die Ausdrücke,
welche diese Parameter berechnen.

Bei Io werden die Messages unevaluiert an den Empfänger geschickt. Der Empfänger
kümmert sich dann um deren Evaluierung. Auf diese Weise können
Kontrollstrukturen programmiert werden, indem die `then`- und `else`-Blöcke erst
bei Bedarf ausgewertet werden.

## Beispiel: Kontrollstruktur `unless`

`unless` macht das Gegenteil von `if`. Falls die Bedingung (erstes Argument)
_nicht_ zutrifft, wird der Code vom zweiten Argument ausgeführt, sonst derjenige
vom zweiten Argument (`unless.io`):

    unless := method(
        (call sender doMessage(call message argAt(0))) ifFalse(
         call sender doMessage(call message argAt(1))) ifTrue(
         call sender doMessage(call message argAt(2)))
    )

Beispiel:

    $ io -h unless.io
    > unless(1 == 2, "One is not two" println, "One is two" println)
    One is not two
    > unless(1 == 1, "One is not one" println, "One is one" println)
    One is one

Mit `call sender` gelangt man an die lokalen Variablen des Absenders. Mit
`doMessage` wird ein Argument evaluiert. Die Kette `call sender doMessage`
evaluiert eine Message im Kontext (d.h. im Gültigkeitsbereich) des Senders.

Mit `call message` gelangt man an die empfangene Message. Mit `argAt(i)` kann
das Argument bei Index `i` (0-basiert) abgefragt werden.

Ein Boolean-Wert (`true` oder `false`) unterstützt die beiden Messages `ifTrue`
und `ifFalse`. Ist der Empfänger `true`, evaluiert `ifTrue` den Parameter, Ist
der Empfänger `false`, evaluiert `ifFalse` den Parameter.

    > true ifTrue("is true" println)
    is true
    ==> true

    > false ifTrue("is true" println)
    ==> false

    > false ifFalse("is false" println)
    is false
    ==> false

    > true ifFalse("is false" println)
    ==> true

Der Rückgabewert ist hier immer der Wert des Empfängers, wodurch `ifTrue` und
`ifFalse` verkettet werden können:

    > true ifTrue("is true" println) ifFalse("is false" println)
    is true
    ==> true

    > false ifTrue("is true" println) ifFalse("is false" println)
    is false
    ==> false
