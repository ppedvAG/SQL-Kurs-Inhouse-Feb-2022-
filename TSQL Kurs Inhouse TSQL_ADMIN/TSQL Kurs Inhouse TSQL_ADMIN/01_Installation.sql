/*
Fragen des Setup
-----------------
Laufwerke Pfaden
Bin�rkram.. is mir egal
DB
	--mdf (Daten) master data file
	--ldf (log data file) Transaktionsprotoll

	Ziel: Trenne Schreiben von Lesen .. Trenne Daten von Logfile

Features

Arbeitsspeicher
Max Ram : (OS) 1 GB  2GB 

fr�her min Ram  0 max Ram 2,14 PB

Security

Dienstkonten
NT Service werden lokal immer verwendet, auch wwenn man sie im Setup angibt
lokale verwaltete Konten  im Netz mit Computerkonten
jeder Zugriff lokal wird mit den Dienstgel�st

Volumewartungstask.. einem guten Admin ist das egal
Ausnullen nicht notwendig
-------------------------------------
xxxxxxxxxxxxxxxxxxxxxxxx00000000
-------------------------------------

Security
sa sp�ter deaktivieren unda daf�r Ersatz SA
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
--> gleiches Wachstum der Dateien und UNiform EXtents (BL�cke)
---damit wg zb mehrer #tab keine gleichezeitigen Zugriffe auf den selben Block stattfinden m�ssen

MAXDOP
Anzahl der Kerne aber nicht mehr als 8 = Anzahl der der Datendateien
Kostenschwellwert = 5.. wird leider beim Setup nicht ber�cksichtigt

Kontrolle RAM
Max Arbeitssatz im Taskmanager
Gr0�e Diff zwischen aktuell und max --> Hinweis auf zu wenig RAM

Contained Database 
evtl aktivieren--> eigenst�ndige DB


Virtualisierung
der virtuellen Maschine keine andere Hardware vorgaukeln, als die tats vorhanden ist

zB. in VM 2 Sockel mit je 4 Kernen in realer Maschine : 1 Sockel mit 8 Kernen
(kann durch kopieren einer VM von Server zu Server passieren)


Edition Version
seit SQL 2016 Sp1 



*/