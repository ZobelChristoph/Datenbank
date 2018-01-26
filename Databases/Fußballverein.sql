
#############Datenbank anlegen und nutzen ###############
drop database if exists Fußball;
create database Fußball;
use Fußball;


#############Tabellen erzeugen###########################

create table Team
(
    Team_ID int not null auto_increment,
    Bezeichnung varchar (255),
    Ort varchar(255),
    primary key (Team_ID)
)engine innodb;

create table Spieler
(
    ID_Spieler int not null auto_increment,
    Nachname varchar(255),
    Vorname varchar(255),
    Geburtsdatum datetime,
    Geschlecht varchar(20),
    Beitrittsdatum datetime,
    Straße varchar(255),
    Hausnummer int not null,
    PLZ VARCHAR(5),
    Ort VARCHAR(45),
    Team_ID int not null,
    Rückennummer int not null,
    primary key (ID_Spieler),
    foreign key (Team_ID) references Team (Team_ID)
)engine innodb;


create table Spiel
(
    Spiel_ID int not null auto_increment,
    PunkteGast int not null,
    PunkteHeim int not null,
    primary key (Spiel_ID)
)engine innodb;

create table Tor
(
    Tor_ID int not null auto_increment,
    Spielminute varchar(20),
    Spiel_ID int not null,
    ID_Spieler int not null,
    Team_ID int not null,
    primary key (Tor_ID),
    foreign key (Spiel_ID) References Spiel (Spiel_ID),
    foreign key (ID_Spieler) references Spieler (ID_Spieler),
    foreign key (Team_ID) references Team (Team_ID)
)engine innodb;

create table Strafe
(
    ID_Strafe int not null auto_increment,
    Datum date,
    Höhe double not null,
    Spiel_ID int not null,
    ID_Spieler int not null,
    primary key (ID_Strafe),
    foreign key (Spiel_ID) references Spiel (Spiel_ID),
    foreign key (ID_Spieler) References Spieler (ID_Spieler)
)engine innodb;

create table Zuordnung
(
    ID_Zuordnung int not null auto_increment,
    Spiel_ID int not null,
    ID_TeamGast int not null,
    ID_TeamHeim int not null,
    primary key (ID_Zuordnung),
    foreign key (ID_TeamGast) References Team (Team_ID),
    foreign key (ID_TeamHeim) References Team (Team_ID),
    foreign key (Spiel_ID) References Spiel (Spiel_ID)
)engine innodb;


###############Daten einfügen############

insert into Team 
values 
    (null, 'Klara-Oppenheimer-Schule Lehrermannschaft', 'WürzburgKlara-Oppenheimer-Schule Lehrermannteam'),
    (null, 'Klara-Oppenheimer-Schule Schülermannschaft', 'Würzburg'),
    (null, 'FCB', 'München'),
    (null, 'FCN', 'Nürnberg');

insert into Spieler
values 
    #Spieler von Team 1
    (null, 'Zobel', 'Christoph', '1977-02-12 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '12', '97286', 'Winterhausen',1, 1), 
    (null, 'Steinam', 'Karl', '1913-07-08 00:00:00', 'männlich', '2013-07-07 00:00:00', 'Musterstraße', '15', '97070', 'Würzburg',1, 2),
    (null, 'Schellenberger', 'Mario', '1983-07-08 00:00:00', 'männlich', '2013-07-07 00:00:00', 'Waldallee', '15', '97070', 'Würzburg',1, 3),
    (null, 'Sych', 'Gerd', '1968-07-08 00:00:00', 'männlich', '2013-07-07 00:00:00', 'Strandallee', '15', '97070', 'Würzburg',1, 4),
    (null, 'Borachard', 'Frank', '1950-07-08 00:00:00', 'männlich', '2013-07-07 00:00:00', 'Musterstraße', '15', '97070', 'Würzburg',1, 5),
    (null, 'Kral', 'Christian', '1973-07-08 00:00:00', 'männlich', '2013-07-07 00:00:00', 'Musterstraße', '15', '97070', 'Würzburg',1, 6),
    (null, 'Rebhan', 'Timo', '1973-07-08 00:00:00', 'männlich', '2013-07-07 00:00:00', 'Musterstraße', '15', '97070', 'Würzburg',1, 7),
    (null, 'Baierl', 'Helmut', '1943-07-08 00:00:00', 'männlich', '2013-07-07 00:00:00', 'Musterstraße', '15', '97070', 'Würzburg',1, 8),
    (null, 'Sierl', 'Norbert', '1946-07-08 00:00:00', 'männlich', '2013-07-07 00:00:00', 'Musterstraße', '15', '97070', 'Würzburg',1, 9),
    (null, 'Tröster', 'Anni', '1969-07-08 00:00:00', 'weiblich', '2013-07-07 00:00:00', 'Musterstraße', '15', '97070', 'Würzburg',1, 10),
    (null, 'Lange', 'Martin', '1979-04-08 00:00:00', 'männlich', '2013-07-07 00:00:00', 'Musterstraße', '15', '97070', 'Würzburg',1, 10),
    (null, 'Wallner', 'Renate', '1983-11-25 00:00:00', 'weiblich', '2013-06-06 00:00:00', 'Musterstraße', '16', '97070', 'Würzburg',1, 11),
    
    
    
    #Spieler von Team 2 - Schülermannschaft
    (null, 'Lotze', 'Jürgen', '1991-12-31 00:00:00', 'männlich', '2013-09-09 00:00:00', 'Musterstraße', '13', '97070', 'Würzburg',2,10),
    (null, 'Loos', 'Sebastian', '1979-09-04 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '14','97070', 'Würzburg',2, 9),
    (null, 'Messi', 'Lionel', '1989-09-04 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '17', '97070', 'Würzburg',2, 8),
    (null, 'Markert', 'Patrick', '1986-02-04 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '18', '97070', 'Würzburg',2, 7),
    (null, 'Richter', 'Daniel', '1994-01-05 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',2,5),
    (null, 'Mueller', 'Klaus', '1994-01-04 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',2,4),
    (null, 'Schneider', 'Matthias', '1995-02-06 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',2,3),
    (null, 'Richter', 'Bernd', '1997-03-07 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',2,2),
    (null, 'Kaiser', ' Kurt', '1998-09-11 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',2,1),
    (null, 'Schöll', 'Willi', '1991-04-04 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',2,11),
    (null, 'Friedrich', 'Micheal', '1992-05-01 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',2,12),

    #Spieler von Team 3 - FCB
    (null, 'Schmitz', 'Benno', '1994-11-17 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,14),
    (null, 'Chessa', 'Dennis', '1992-11-10 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,13),
    (null, 'Buck', 'Stefan', '1980-09-03 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,12),
    (null, 'Wein', 'Daniel', '1994-02-05 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,11),
    (null, 'Strieder', 'Rico', '1994-09-04 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,10),
    (null, 'Derflinger', 'Christian', '1994-02-02 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,9),
    (null, 'Schöpf', 'Alessandro', '1994-07-02 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,8),
    (null, 'Fischer', 'Bastian', '1993-01-20 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,7),
    (null, 'Schweinsteiger', 'Tobias', '1982-03-12 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,6),
    (null, 'Weihrauch', 'Patrick', '1994-03-03 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,5),
    (null, 'Friesenbichler', 'Kevin', '1994-05-06 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,4),
    (null, 'Green', 'Julian', '1995-06-06 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',3,3),


    #Spieler von Team 4 - FCN
    (null, 'Schäfer', 'Raphael', '1979-01-30 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',4,11),
    (null, 'Rakovsky', 'Patrick', '1993-06-02 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',4,10),
    (null, 'Uphoff', 'Benjamin', '1993-08-08 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',4,9),
    (null, 'Pogatetz', 'Emanuel', '1983-01-16 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',4,8),
    (null, 'Nilsson', 'Per', '1982-09-15 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',4,7),    
    (null, 'Marcos', 'Antonio', '1983-05-25 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',4,6),
    (null, 'Angha', 'Martin', '1994-02-01 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Musterstraße', '19', '97070', 'Würzburg',4,5),
    (null, 'Korczowski', 'Noah', '1994-01-22 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Prunkalllee', '19', '97070', 'Würzburg',4,4),
    (null, 'Plattenhardt', 'Marvin', '1994-09-04 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Prunkalllee', '19', '97070', 'Würzburg',4,3),
    (null, 'Dabanli', 'Berkay', '1994-09-04 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Prunkalllee', '19', '97070', 'Würzburg',4,2),
    (null, 'Javier', 'Pinola', '1994-09-04 00:00:00', 'männlich', '2013-06-06 00:00:00', 'Spiegelallee', '19', '97070', 'Würzburg',4,1);
    
    
INSERT INTO Spiel
	VALUES (null, 3, 0),
	(null, 3, 0),
	(null, 1, 1),
	(null, 1, 1),
 (null, 5, 1);

INSERT INTO Zuordnung
	VALUES (null, 1, (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Lehrermannschaft'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, 2, (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Lehrermannschaft'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'FCN')),
		(null, 3, (SELECT Team_ID FROM Team WHERE Bezeichnung = 'FCN'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, 4, (SELECT Team_ID FROM Team WHERE Bezeichnung = 'FCB'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'FCN')),
    (null, 5, (SELECT Team_ID FROM Team WHERE Bezeichnung = 'FCN'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'FCB'));




INSERT INTO Tor
	VALUES (null, '2', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Lotze'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, '14', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Lotze'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, '41', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Lotze'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, '45+2', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Lotze'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, '66', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Lotze'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),

		(null, '18', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Loos'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, '28', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Loos'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, '38', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Loos'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, '45', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Loos'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Schülermannschaft')),
		(null, '90+3', 1, (SELECT ID_Spieler FROM Spieler WHERE  Nachname = 'Zobel'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Lehrermannschaft')),
		(null, '58', 2, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Wallner'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Lehrermannschaft')),
  (null, '90+3', 2, (SELECT ID_Spieler FROM Spieler WHERE  Nachname = 'Zobel'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Lehrermannschaft')),
		(null, '58', 1, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Wallner'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Lehrermannschaft')),
		(null, '78', 2, (SELECT ID_Spieler FROM Spieler WHERE Nachname = 'Markert'), (SELECT Team_ID FROM Team WHERE Bezeichnung = 'Klara-Oppenheimer-Schule Lehrermannschaft'));


INSERT INTO Strafe
VALUES (null, '2013-02-02', '2000.00', '1', '3'),
		(null, '2013-04-27', '1337.00', '2', '1'),
		(null, '2013-07-01', '8000.85', '3', '4'),
		(null, '2013-03-13', '735.83', '4','4'); 

