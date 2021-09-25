# 1. Aufgabe: Repository forken und klonen

Erstellen Sie einen persönlichen Fork von diesem Repository. Klonen Sie das
Repository anschliessend, damit Sie lokal damit arbeiten können.

Pull Requests brauchen Sie keine zu machen.

# 2. Aufgabe: Io installieren

Zunächst müssen Sie den `io`-Interpreter installieren. Dazu gibt es verschiedene
Möglichkeiten. Auf der offiziellen Webseite gibt es
[Binaries](https://iolanguage.org/binaries.html), die Sie herunterladen können.

## Windows

1. Laden Sie sich das
   [Windows-Archiv](http://iobin.suspended-chord.info/win32/iobin-win32-current.zip)
   herunter.
2. Entpacken Sie das Verzeichnis (`iobin-win32-current`) und öffnen Sie es.
3. Starten Sie das Programm `IoLanguage2013.11.05-win32.exe` und entpacken Sie
   die Dateien ins vorgeschlagene Verzeichnis `IoLanguage`.
4. Verschiebe Sie das Verzeichnis `IoLanguage` in Ihr persönliches
   Benutzerverzeichnis (z.B. `C:\Users\patrick` bzw. `%USERPROFILE%`).
5. Löschen Sie die Datei `io.exe` im Verzeichnis `IoLanguage`.
6. Bennen Sie die Datei `io_static.exe` Im Verzeichnis `IoLanguage` nach
   `io.exe` um.
7. Erweitern Sie die `Path`-Umgebungsvariable um den Wert
   `%USERPROFILE\IoLanguage\bin`.
8. Führen Sie `io` mit der PowerShell oder `cmd.exe` aus.

## Ubuntu

1. Laden Sie sich das
   [Debian-Package](http://iobin.suspended-chord.info/linux/iobin-linux-x64-deb-current.zip)
   herunter und entpacken Sie es. (Alternative: [32bit
   Debian-Package](http://iobin.suspended-chord.info/linux/iobin-linux-x86-deb-current.zip))
2. Im entpackten Verzeichnis können Sie nun die Datei mit der Endung `.deb`
   installieren:
    1. Entweder per GUI: Rechtsklick, `"Mit Software-Installation öffnen"`
    2. Oder per Kommandozeile: `sudo dpkg -i IoLanguage-*.deb`
3. Führen Sie `io` im Terminal aus.

## macOS

Falls Sie Homebrew verwenden, installieren Sie `io` mit dem folgenden Befehl:

    $ brew install io

Ansonsten verwenden Sie das offizielle
[Binary](http://iobin.suspended-chord.info/mac/iobin-mac-current.zip). Entpacken
Sie dieses in ihr `$HOME`-Verzeichnis und erweitern Sie Ihre `$PATH`-Variable,
sodass das `bin`-Unterverzeichnis von Io gefunden werden kann.

# 3. Aufgabe: Ausprobieren und Tutorial überfliegen

Nehmen Sie sich für die erste Aufgabe maximal 15 Minuten Zeit (time-boxed).

Schauen Sie sich die Beispiele im Verzeichnis `examples` an. Betrachen Sie den
Code und führen Sie einige Beispiele mittels `io` aus, z.B.:

    $ cd examples
    $ io average.io

So erhalten Sie schnell ein Gefühl für die Sprache.

Überfliegen Sie anschliessend das Tutorial in der Datei `README.md`. Sie können
auch Beispiele interaktiv ausführen:

    $ io

# 4. Aufgabe: Matrix

Betrachten Sie sich die Datei `matrix.io` im Verzeichnis `examples`. Sie werden
den Code in den nächsten Schritten erweitern. Führen Sie den Code nach jeder
Änderung aus:

    $ cd examples
    $ io matrix.io

Auf den ersten ca. 70 Zeilen wird der `Matrix`-Typ definiert. Auf den unteren
ca. 20 Zeilen wird die Verwendung davon demonstriert.

## 4.1 Matrix erstellen

Betrachten Sie sich die Methoden `dim`, `set` und `get`. Erstellen Sie eine
Matrix namens `myMatrix` mit drei Zeilen und zwei Spalten und den folgenden
Werten:

    1 4
    2 5
    3 6

Geben sie diese mithilfe der `output`-Methode aus.

## 4.2 Matrix transponieren

Betrachten Sie sich die Methode `transpose`. Wenden Sie diese auf ihre oben
definierte Matrix `myMatrix` an. Welchen Effekt hat diese? Was passiert, wenn
Sie `transpose` auf eine bereits transponierte Matrix ausführen?

## 4.3 Matrix abspeichern

Betrachten sie sich die Methode `saveToFile`. Verwenden Sie diese, um Ihre
Matrix `myMatrix` in der Datei `my-matrix.txt` abzuspeichern.

## 4.4 Matrix einlesen

Eine Matrix mit den Methoden `dim`, `set` und `get` aufzubauen ist mühsam. Mit
der Methode `readFromFile` können Sie eine Matrix aus einer Textdatei lesen.

Erstellen Sie eine Datei `my-big-matrix.txt`, in welcher Sie eine grössere
Matrix (Mindestdimensionen: 5x4) bestehend aus Zahlen definieren.

Lesen Sie diese Matrix beim Programmstart ein. Verwenden Sie hierzu die Variable
`myBigMatrix`.

## 4.5 Matrix summieren

Schreiben Sie eine neue Methode namens `sum`, mit welcher Sie die Zahlen in
einer Matrix aufsummieren können.

## 4.6 Elemente zählen

Schreiben Sie eine neue Methode namens `size`, welche die Anzahl der Elemente in
der Matrix zurückgibt.

Tipp: Sie müssen nicht alle Elemente durchzählen, da die Matrix rechteckig ist.

## 4.7 Durchschnitt berechnen

Schreiben Sie eine neue Methode namens `average`, welche den Durchschnitt aller
Elemente in der Matrix berechnet. Verwenden Sie hierzu die zuvor geschriebenen
Methoden `sum` und `size`.

## 4.8 Skalare Multiplikation

Schreiben Sie eine neue Methode namens `scalarMultiply`, welche einen Parameter
`x` erwartet, und jedes Element mit diesem Parameter aufmultipliziert. Die
folgende Matrix:

    1 2 3
    4 5 6

Wird nach der Multiplikation mit 3 folgendermassen aussehen:

    3 6 9
    12 15 18

## 4.9 Zusatzaufgabe: Matrizenmultiplikation (schwierig)

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
