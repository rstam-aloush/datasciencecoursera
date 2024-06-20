# CodeBook

Dieses CodeBook beschreibt die Variablen, die Daten und die durchgeführten Arbeiten zur Bereinigung des Datensets.

## Datenquelle

Die Daten stammen aus dem `UCI HAR Dataset`, das von den Beschleunigungssensoren des Samsung Galaxy S Smartphones gesammelt wurde.

## Transformationen

1.  Vereinigung der Trainings- und Testsets zu einem Datensatz.
2.  Extraktion der Messungen des Mittelwerts und der Standardabweichung für jede Messung.
3.  Benennung der Aktivitäten mit beschreibenden Namen.
4.  Kennzeichnung des Datensatzes mit beschreibenden Variablennamen.
5.  Erstellung eines zweiten, unabhängigen, ordentlichen Datensatzes mit dem Durchschnitt jeder Variable für jede Aktivität und jedes Subjekt.

## Variablen

-   `subject`: Die ID des Subjekts, das die Daten aufgezeichnet hat (1 bis 30).
-   `activity`: Die Aktivität, die das Subjekt ausgeführt hat (z.B. Gehen, Stehen).
-   Alle anderen Variablen sind die Mittelwerte und Standardabweichungen der Messungen, die in den Daten enthalten sind.
