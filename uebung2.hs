module Uebung2 where

{-
Übung zur Vorlesung
Funktionale Programmierung
Sommersemester 2021
Übungsblatt 2
-}

{-
Block: 1
Ausgabe: 23.04.2021
Abgabe: Bis 23:59h am 29.04.2021 im ASSESS (https://ess.cs.tu-dortmund.de/ASSESS)
-}

{-
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
Nach der Bearbeitung einzelner Aufgaben, sowie nach der Bearbeitung aller
Aufgaben sollte diese Datei kompilieren.
Ist dies nicht der Fall, sollten Sie ihre Lösung(en) überdenken.
Falls Sie eine Aufgabe nicht lösen können, so kommentieren Sie bitte Ihren
Lösungsversuch einfach wieder aus. Wir werden uns ihre Lösungen, sowie
auskommentierte Teillösungen anschauen.

Bitte achten Sie darauf immer kompilierende Dateien abzugeben!
Geben Sie nur Quellcode und Kommentare als .hs Dateien ab. Abgaben als
kompiliertes Programm (.ho, .exe, ...) oder in anderen Formaten (z.B.
.doc, .pdf, ...) werden nicht akzeptiert.
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
-}

{-
Aufgabe 2.1 (10 Punkte) - Evaluation von Lambda-Ausdrücken
-}
{-
Werten Sie die folgenden Ausdrücke schrittweise aus.
Geben Sie möglichst alle (!) Zwischenschritte an.

Verwenden Sie bitte pro Zwischenschritt eine Zeile.
-}

{-
Bearbeiten Sie die folgenden Kommentare, um die Aufgabe zu lösen.

Tipp: Jeder einzelne Zwischenschritt sollte für sich kompilieren und im ghci zum
selben Ergebnis ausgewertet werden.
-}

{-
a) (\ f x -> f x x) (\x y -> x) 5
~> (\ f -> \x -> f x x) (\x y -> x) 5
~> (\x -> (\x y -> x) x x) 5
~> (\x -> (\x -> \y -> x) x x) 5
~> (\x -> (\y -> x) x) 5
~> (\x -> x) 5
~> 5

Anmerkung: Die "..." sollen Sie natürlich durch die entsprechenden Lösungen ersetzen...
-}

{-
b) (\ f -> f (f 2)) (\ x -> x * x)
~> (\ x -> x * x) ( (\ x -> x * x) 2)
~> (\x -> (x * x) * (x * x)) 2
~> (\x -> x * x * x * x) 2
~> ( 2 * 2 * 2 * 2) 
~> 16

Anmerkung: Die "..." sollen Sie natürlich durch die entsprechenden Lösungen ersetzen...
-}


{-
Aufgabe 2.2 (10 Punkte) - Pattern Matching und Rekursion
-}

{-
Die Collatz-Funktion ist wie folgt definiert:

       { n/2, falls n gerade
c(n) = {
       { 3n + 1, falls n ungerade

https://de.wikipedia.org/wiki/Collatz-Problem
-}

{-
a) Implementieren Sie eine Haskell-Funktion collatz :: Int -> Int,
die für eine natürliche Zahl das nächste Element in der Collatz-Folge berechnet.
Gehen Sie also davon aus, dass die Funktion collatz nur natürliche Zahlen als
Argument erhält.
Die Funktion div :: Int -> Int -> Int implementiert die Integerdivision
in Haskell.

Nutzen Sie zur Definition von collatz die auf den Folien vorgestellte Variante
der "bewachten Lösung". Sie sollen also explizit keinen bedingten Ausdruck
(if-then-else) verwenden, sondern geeignete "Wächter" einsetzen.
-}

{-
Hinweis: Sie dürfen alle Funktionen des Prelude zur Definition nutzen.
Nutzen Sie also eventuell die in uebung0.hs vorgestellten Wege, um
geeignete Funktionen zu finden, die bereits im Prelude implementiert sind.
Sie dürfen zusätzliche hilfreiche Funktionen natürlich auch selber implementieren.
-}


{-
Nutzen Sie den folgenden auskommentierten Code und vervollständigen Sie
die Definition. Testen Sie ihre Lösung anschließend, indem Sie sie in den GHCi
laden und ausführen.
-}

collatz :: Int -> Int
collatz n
       | even n = div n 2
       | otherwise = 3 * n + 1 


{-
b) Die Collatz-Folge ergibt sich aus der mehrfachen Anwendung der Funktion
collatz auf eine natürliche Zahl n. Man nimmt an, dass die Collatz-Folge
für jede natürliche Zahl irgendwann einmal den Wert 1 erreicht, bzw. in den
Zyklus (4,2,1) mündet.

Implementieren Sie eine Funktion collatzMax :: Int -> Int, die für eine
gegebene natürliche Zahl n die größte Zahl zurückgibt, die die Collatz-Folge
für den Startwert n annimmt.

Beispiele:
• n = 4 : (4,2,1,...), collatzMax 4 ~> 4
• n = 21 : (21,64,32,16,8,4,2,1,...), collatzMax 21 ~> 64
• n = 1 : (1,4,2,1,...), collatzMax 1 ~> 4
-}

{-
Hinweis: Sie dürfen alle Funktionen des Prelude zur Definition nutzen.
Nutzen Sie also eventuell die in uebung0.hs vorgestellten Wege, um
geeignete Funktionen zu finden, die bereits im Prelude implementiert sind.
Sie dürfen zusätzliche hilfreiche Funktionen natürlich auch selber implementieren.
-}


{-
Nutzen Sie  den folgenden auskommentierten Code und vervollständigen Sie
die Definition. Testen Sie ihre Lösung anschließend, indem Sie sie in den GHCi
laden und ausführen.
-}

collatzMax :: Int -> Int
collatzMax n = if n == 1 then 1
                         else max n (collatzMax (collatz n) )
                           

{-
Aufgabe 2.3 (10 Punkte) - Typklassen 
-}

{-
a) Implementieren Sie eine Funktion h, die den Typ
Read a => (b -> c) -> (a -> b) -> String -> c
hat.

Tipp: Für eine geeignete Implementierung könnten Beispielaufrufe zum Testen
wie folgt aussehen:
• h show (+1.5) "2.5" ~> "4.0"
• h (+1) (+1) "2" ~> 4
-}

{-
Nutzen Sie den folgenden auskommentierten Code und vervollständigen Sie
die Definition. Testen Sie ihre Lösung anschließend, indem Sie sie in den GHCi
laden und ausführen.
-}

h :: Read a => (b -> c) -> (a -> b) -> String -> c
h f g s = f (g(read s))


{-
b) Gegeben ist die folgende Typklasse MyNumber, deren Instanzen die Funktionen
appendMyNumber und prependMyNumber implementieren.

Machen Sie die Typen Int und Bool zu Instanzen von MyNumber, wobei Sie folgende
Vorgaben für appendMyNumber und prependMyNumber bei der Implementierung erfüllen
müssen:
appendMyNumber übersetzt das Argument in einen String und konkateniert
IHRE Matrikelnummer an das Ende dieses Strings.
prependMyNumber übersetzt das Argument in einen String und konkateniert
IHRE Matrikelnummer an den Anfang dieses Strings.
-}

class Show a => MyNumber a where
  appendMyNumber :: a -> String
  prependMyNumber :: a -> String
instance MyNumber Int where
       appendMyNumber x = show x ++ "216399"
       prependMyNumber x = "216399" ++ show x

instance MyNumber Bool where
       appendMyNumber x = show x ++ "216399"
       prependMyNumber x = "216399" ++ show x

