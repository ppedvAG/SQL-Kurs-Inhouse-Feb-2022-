
--Bucketcount.. Anzahl der Slots ..entschiedt �ber RAM VErbrauch , aber auch �ber Performance 

--Wird uf die n�chste 2er Potenz gerundet
--> 1 MIo --> 1.048.576
--> Bucket Count *8
-- + 8 bytes mal Anzahl der zeilen

---> 1,073,741,824 ---> 8.589.934.592 bytes

--Formel um den idealen Bucketcount zu finden bei einer bestenden Menge an Datens�tzen
--Siehe auch Ordner IM im Projekt mit Demo : Ticketreservation

SELECT
  POWER(
    2,
    CEILING( LOG( COUNT( 0)) / LOG( 2)))
    AS 'BUCKET_COUNT'
FROM
  (SELECT DISTINCT id 
      FROM ku) T