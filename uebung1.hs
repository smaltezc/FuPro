module Uebung1 where

{-
Übung zur Vorlesung
Funktionale Programmierung
Sommersemester 2021
Übungsblatt 1
-}

{-
Block: 1
Ausgabe: 16.04.2021
Abgabe: Bis 23:59h am 22.04.2021 im ASSESS (https://ess.cs.tu-dortmund.de/ASSESS)
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
Aufgabe 1.1 (10 Punkte) - Konstante und Unäre Funktionen
-}

{-
Gegeben sei die Funktion times3 aus der Vorlesung (auf Folie 18 r genannt),
sowie die konstante Funktion three.
-}

times3 :: Int -> Int
times3 = (*) 3

three :: Int
three = 3

{-
a) Definieren Sie eine konstante Funktion k :: Int, deren Auswertung
den Wert 27 liefert.
Nutzen Sie hierfür lediglich die Funktionen times3 und three (also
insbesondere nicht(!) das Zahlenliteral 27).
-}

{-
Nutzen Sie hierzu den folgenden auskommentierten Code und vervollständigen Sie
die Definition. Testen Sie ihre Lösung anschließend, indem Sie sie in den GHCi
laden und ausführen.
-}

k :: Int
k = times3 (times3 three)

{-
b) Definieren Sie eine Funktion add4 :: Int -> Int, die eine ganze Zahl
vom Typ Int als Parameter erhält und die Summe aus 4 und dem Parameter
berechnet.
Nutzen Sie hierfür ausschließlich die Funktion successor und optional
den $ Operator, falls Sie sich ein paar Klammern sparen wollen.
-}

successor :: Int -> Int
successor = (+) 1

{-
Nutzen Sie hierzu den folgenden auskommentierten Code und vervollständigen Sie
die Definition. Testen Sie ihre Lösung anschließend, indem Sie sie in den GHCi
laden und ausführen.
-}

add4 :: Int -> Int
add4 x = add x (successor $ three)
--add4 x = x + (successor (three))

{-
Aufgabe 1.2 (10 Punkte) - Partielle Funktionsanwendung
-}

{-
a) Die Funktionsanwendung in Haskell ist per Definition bekanntermaßen
linksassoziativ.
Erweitern Sie die Definition der konstanten Funktion ten :: Int um die
impliziten Klammern.
-}

{-
(Hinweis: Die Explikation der Klammerung erhält natürlich die Semantik
des Ausdrucks.
Sollte die Datei uebung1.hs nicht mehr kompilieren, nachdem
sie die Klammern zur Definition von ten :: Int hinzugefügt haben, dann
sollten Sie ihre Lösung vielleicht noch einmal überdenken...)
-}

add4Ints :: Int -> Int -> Int -> Int -> Int
add4Ints a b c d = (((a + b) + c) + d)



ten :: Int
ten = (((add4Ints 1) 2) 3) 4

{-
b) Funktionen können auch mittels partieller Funktionsanswendung von Funktionen
höherer Stelligkeit definiert werden. Wir haben dies bereits bei der Definition
von times3 :: Int -> Int aus Aufgabe 1.1 genutzt, indem wir der binären
Multiplikation (*) :: Int -> Int -> Int nur ein von zwei Argumenten übergeben
haben.

Definieren Sie eine Funktion add6 :: Int -> Int, die eine ganze Zahl vom Typ Int
als Parameter erhält und die Summe aus 6 und dem Parameter berechnet.
Nutzen Sie für die Definition ausschließlich die Funktion add4Ints und geeignete
Zahlenliterale.
-}

{-
Nutzen Sie hierzu den folgenden auskommentierten Code und vervollständigen Sie
die Definition. Testen Sie ihre Lösung anschließend, indem Sie sie in den GHCi
laden und ausführen.
-}

add6 :: Int -> Int
add6 = add $ add4Ints 0 1 2 3  
--add6 x = x + add4Ints 0 1 2 3

{-
c) Definieren Sie mittels partieller Funktionsanwendung die binäre Addition
add :: Int -> Int -> Int ausschließlich über die vierstellige Addition
add4Ints und geeignete Zahlenliterale.
-}

{-
Nutzen Sie hierzu den folgenden auskommentierten Code und vervollständigen Sie
die Definition. Testen Sie ihre Lösung anschließend, indem Sie sie in den GHCi
laden und ausführen.
-}

add :: Int -> Int -> Int
add x y = add4Ints x y 0 0 

{-
Aufgabe 1.3 (10 Punkte) - Lambda Ausdrücke
-}

{-
a) In der Vorlesung haben sie die Definition von anonymen Funktionen mittels
Lambda-Abstraktion kennengelernt.
Definieren Sie die Funktion add4 aus Aufgabe 1.1 als add4' erneut, aber nutzen
Sie dieses Mal ausschließlich die anonymen Funktionen
(\ f x -> f $ f x)
und
(\ x -> x + 1).
-}

{-
Nutzen Sie hierzu den folgenden auskommentierten Code und vervollständigen Sie
die Definition. Testen Sie ihre Lösung anschließend, indem Sie sie in den GHCi
laden und ausführen.
-}

add4' :: Int -> Int
add4' = (\ f x -> f $ f x) (\ x -> x + 1) 
--add4' x = (\ f x -> f $ f x) (\ x -> x + 2) x
--add4' x = (\ f x -> f $ f $ f $ f x) (\ x -> x + 1) x
--add4' = (\ f x -> f $ f $ f $ f x) (\ x -> x + 1) 

{-
b)
Definieren Sie die Funktion square :: Int -> Int, die eine ganze Zahl vom
Typ Int als Parameter nimmt und diese quadriert.
Nutzen Sie für die Definition ausschließlich die anonyme Funktion
(\f x -> f x x)
und die binäre Multiplikation (*).
-}

{-
Nutzen Sie hierzu den folgenden auskommentierten Code und vervollständigen Sie
die Definition. Testen Sie ihre Lösung anschließend, indem Sie sie in den GHCi
laden und ausführen.
-}

square :: Int -> Int
square = (\f x -> f x x) (\ x y -> x * x)
--square x = (\f x -> f x ) (\ x -> x * x) x
