/*
Fragen des Setup
-----------------
Laufwerke Pfaden
Binärkram.. is mir egal
DB
	--mdf (Daten) master data file
	--ldf (log data file) Transaktionsprotoll

	Ziel: Trenne Schreiben von Lesen .. Trenne Daten von Logfile

Features

Arbeitsspeicher
Max Ram : (OS) 1 GB  2GB 

früher min Ram  0 max Ram 2,14 PB

Security

Dienstkonten
NT Service werden lokal immer verwendet, auch wwenn man sie im Setup angibt
lokale verwaltete Konten  im Netz mit Computerkonten
jeder Zugriff lokal wird mit den Dienstgelöst

Volumewartungstask.. einem guten Admin ist das egal
Ausnullen nicht notwendig
-------------------------------------
xxxxxxxxxxxxxxxxxxxxxxxx00000000
-------------------------------------

Security
sa später deaktivieren unda dafür Ersatz SA
im Emergency Modus kommen Windows Admins wieder rein.. aber nur dann;-)
Startparameter -E	


Kontrolle der Serverkonfiguration
------------------------------------------

tempdb --schnell sein!!!

RAM Auslagerungen
#tabellen ##tabellen
Zeilenversionierung
IX Wartung
nur eine pro Server

--sollte eig HDD(s) besitzen
Anzahl der Dateien = Anzahl der CPU Kerne (max 8)
-- -T1118  -T1117
--> gleiches Wachstum der Dateien und UNiform EXtents (BLöcke)
---damit wg zb mehrer #tab keine gleichezeitigen Zugriffe auf den selben Block stattfinden müssen

MAXDOP
Anzahl der Kerne aber nicht mehr als 8 = Anzahl der der Datendateien
Kostenschwellwert = 5.. wird leider beim Setup nicht berücksichtigt

Kontrolle RAM
Max Arbeitssatz im Taskmanager
Gr0ße Diff zwischen aktuell und max --> Hinweis auf zu wenig RAM

Contained Database 
evtl aktivieren--> eigenständige DB


Virtualisierung
der virtuellen Maschine keine andere Hardware vorgaukeln, als die tats vorhanden ist

zB. in VM 2 Sockel mit je 4 Kernen in realer Maschine : 1 Sockel mit 8 Kernen
(kann durch kopieren einer VM von Server zu Server passieren)


Edition Version
seit SQL 2016 Sp1 



*/