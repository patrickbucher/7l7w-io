# Aufgaben

## 1. Ausprobieren (max. 10 min.)

Schauen Sie sich die Beispiele im Verzeichnis `examples` an. Schauen Sie sich
den Code an und führen jedes Beispiel mittels `io` aus, z.B.:

    $ cd examples
    $ io average.io

So erhalten Sie schnell ein Gefühl für die Sprache.

## 2. Tutorial überfliegen (max. 15 min.)

Überfliegen Sie das Tutorial in der Datei `README.md`. Sie können auch Beispiele
interaktiv ausführen:

    $ io

## 3. Matrix erweitern

Betrachten Sie sich die Datei `matrix.io` im Verzeichnis `examples`. Sie werden
den Code in den nächsten Schritten erweitern. Führen Sie den Code nach jeder
Änderung aus:

    $ cd examples
    $ io matrix.io

### 3.1 Matrix erstellen

Betrachten Sie sich die Methoden `dim`, `set` und `get`. Erstellen Sie eine
Matrix namens `myMatrix` mit zwei Zeilen und drei Spalten und den folgenden
Werten:

    1 3 5
    2 4 6

Geben sie diese mithilfe der `output`-Methode aus.

### 3.2 Matrix transponieren

Betrachten Sie sich die Methode `transpose`. Wenden Sie diese auf ihre oben
definierte Matrix `myMatrix` an. Welchen Effekt hat diese? Was passiert, wenn
Sie `transpose` noch einmal ausführen?

### 3.3 Matrix abspeichern

Betrachten sie sich die Methode `saveToFile`. Verwenden Sie diese, um Ihre
Matrix `myMatrix` in der Datei `my-matrix.txt` abzuspeichern.

### 3.4 Matrix erweitern

Eine Matrix mit den Methoden `dim`, `set` und `get` aufzubauen ist mühsam. Mit
der Methode `readFromFile` können Sie eine Matrix aus einer Textdatei lesen.

Erstellen Sie eine Datei `my-big-matrix.txt`, in welcher Sie eine grössere
Matrix (Mindestdimensionen: 4x4) bestehend aus Zahlen definieren.

Lesen Sie diese Matrix beim Programmstart ein. Verwenden Sie hierzu die Variable
`myBigMatrix`.

### 3.5 Matrix summieren

Schreiben Sie eine neue Methode namens `sum`, mit welcher Sie die Zahlen in
einer Matrix aufsummieren können.

### 3.6 Elemente zählen

Schreiben Sie eine neue Methode namens `size`, welche die Anzahl der Elemente in
der Matrix zurückgibt.

Tipp: Sie müssen nicht alle Elemente durchzählen, da die Matrix rechteckig ist.

### 3.7 Durchschnitt berechnen

Schreiben Sie eine neue Methode namens `average`, welche den Durchschnitt aller
Elemente in der Matrix berechnet. Verwenden Sie hierzu die zuvor geschriebenen
Methoden `sum` und `size`.

### 3.8 Skalare Multiplikation

Schreiben Sie eine neue Methode namens `scalarMultiply`, welche einen Parameter
`x` erwartet, und jedes Element mit diesem Parameter aufmultipliziert. Die
folgende Matrix:

    1 2 3
    4 5 6

Wird nach der Multiplikation mit 3 folgendermassen aussehen:

    3 6 9
    12 15 18

### 3.9 Zusatzaufgabe: Matrizenmultiplikation (schwierig)

Schreiben Sie eine Methode `multiplyWith`, welche als Parameter eine andere
Matrix erwartet. Zwei Matrizen mit den Dimensionen `(m,n)` und `(p,q)` lassen
sich miteinander multiplizieren, falls `n=p` gilt. Das Ergebnis ist eine Matrix
der Dimension `(m,q)`.

Im Wikipedia-Artikel zur
[Matrizenmultiplikation](https://de.wikipedia.org/wiki/Matrizenmultiplikation)
finden Sie weitere Informationen.

Beispiel:

    1 2 3     1 2     3 5 
    4 3 1  x  1 0  =  7 9
              0 1     

Mit der folgenden Darstellung lässt sich die Multiplikation einfacher
nachvollziehen:

            1 2
            1 0
            0 1

    1 2 3   3 5
    4 3 1   7 9

Die Elemente einer Zeile (z.B. `1 2 3`) werden paarweise mit den Elementen jeder
Spalte (z.B. `1 1 0`) multipliziert und dann aufsummiert (z.B. `1*1 + 2*1 + 3*0
= 3`).
