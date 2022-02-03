/*
CPU
MAXDOP regelt nur eine Abfrage: 
1 oder alle(Maxdop), das hängt vom Kostenschwellwert

RAM
MAX RAM Vorschlag (Gesamter RAM  - OS)


HDD
Pfade: Trenne Log und Daten ... (versch HDDs).. pro DB

Wachstum der Datendateien  (vor allem beim Logfile)...1000
Startgröße (Lebenszeit)

Volumewartungstaks: Ausnullen vermeiden (Lok Sicherheits)


tempdb
Anzahl der Datendateien = Anzahl der Kerne (max 8)
Datendateien sind immer gleich groß -T 1117
uniform extents  -Vermeiden von Latches -T1118



Serversetttings

Kompression der Backus
Containeddatabases
KOstenschwellwert: von 5 auf 25


DB Design
Diagramm
Tipp: wieviele Spalten kann eine Tabelle haben...

create table rezepte ( id int, z1 int sparse null

decimal mind 42% NULL , damit +-0
"text"   60%
bit 98%

Füllgrad der Seiten
dbcc showcontig('ku')


*/

16 GB
 6-12241 MB


 2te Instanz
 0-12241
