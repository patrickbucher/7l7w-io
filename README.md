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
