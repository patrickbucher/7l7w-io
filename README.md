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
