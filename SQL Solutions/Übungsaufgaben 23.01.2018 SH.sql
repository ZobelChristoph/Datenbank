USE select_a1;

#Aufgabe 1
SELECT name, kundennr, Zahlungsart
FROM kunde;

#Aufgabe 2
SELECT Bezeichnung, Nettopreis
FROM artikel;

#Aufgabe 3
SELECT NAME, ABTEILUNGSNR
FROM mitarbeiter;

#Aufgabe 4
SELECT NAME
FROM hersteller;

#Aufgabe 5
SELECT *
FROM artikel
WHERE Nettopreis > 100;

#Aufgabe 6
SELECT NAME
FROM mitarbeiter
WHERE ABTEILUNGSNR = 2;
DESCRIBE MITARBEITER;

#Aufgabe 7
SELECT NAME
FROM kunde
WHERE KUNDENNR > 50 AND ORT != 'KÖLN';

#Aufgabe 8
SELECT * 
FROM artikel 
WHERE KATEGORIE = 3 AND NETTOPREIS < 50; 

SELECT * 
	FROM artikel 
	WHERE KATEGORIE = (SELECT Kategorienr FROM kategorie WHERE Bezeichnung = 'Grafikkarten')
	AND NETTOPREIS < 50; 

