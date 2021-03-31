SELECT K.ID_KONTR, K.NAZWA, COUNT(a.id) as liczba_adresow
FROM KONTRAHENT K
LEFT JOIN ADRESY A
ON K.ID_KONTR = a.id_kontr
GROUP BY K.ID_KONTR, K.NAZWA
ORDER BY k.id_kontr;


SELECT ID_KONTR, COUNT(ID) FROM ADRESY
GROUP BY ID_KONTR, ID
ORDER BY ID;

-- 3 sposoby
SELECT COUNT(nazwa) FROM kontrahent
WHERE nazwa IN (SELECT nazwa FROM KONTRAHENT 
WHERE nazwa LIKE '%Kermit%');

SELECT COUNT(nazwa) FROM kontrahent
WHERE nazwa LIKE '%Kermit%';

SELECT COUNT(nazwa) FROM kontrahent
GROUP BY nazwa HAVING nazwa LIKE '%Kermit%';

-- ..............

SELECT * FROM KONTRAHENT 
WHERE nazwa LIKE '%Kermit%';

CREATE TABLE osoby (
  id number(10) primary key,
  imie varchar(255),
  nazwisko varchar(255)
);

CREATE TABLE osoby (
  id number(10) primary key,
  imie varchar(255),
  nazwisko varchar(255),
  pesel varchar(255)
);

INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('1','Baxter','Luke Gates','94070819519');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('2','Quemby','Jesse Stark','99012050174');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('3','Oliver','Marvin Soto','95034440797');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('4','Reagan','Ronan Wheeler','97031616517');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('5','Richard','Charles Garner','98031217061');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('6','Julian','Bert Mckay','95085363247');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('7','Indigo','Axel Snow','91069841225');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('8','Fulton','Howard Morris','91052204862');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('9','Hashim','Vaughan Williamson','97023464370');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('10','Dorothy','Magee Knight','94087922637');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('11','Travis','Kevin Shannon','93044683556');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('12','Yeo','Alfonso Drake','94030566005');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('13','Raymond','Alec Reid','99060756581');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('14','Amelia','Ira Whitley','94005005249');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('15','Emily','Alfonso Lucas','99006586282');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('16','Glenna','Lev Silva','90027122162');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('17','Merritt','Octavius French','92008138729');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('18','Finn','Ralph Ross','99006242045');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('19','Rhonda','Leroy Rivers','90074242562');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('20','Heather','Russell Little','92058186986');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('21','Macaulay','Armando Bryan','99015491199');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('22','Meghan','Colby Guerra','98080018644');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('23','Isabelle','Kirk Fischer','90051711803');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('24','Iliana','Ivan Estes','96062534922');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('25','Xanthus','Dieter Howell','98098234540');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('26','Mechelle','Cairo Copeland','98002147404');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('27','May','Leonard Rodriguez','91059352831');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('28','Myra','Len Love','91019181461');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('29','Mohammad','Richard Matthews','94026892608');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('30','Merrill','Fitzgerald Garcia','99016183604');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('31','Mariam','Clayton Fields','97069827470');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('32','Basil','Linus Tyler','93039192494');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('33','Cameron','Armand Finch','94073935211');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('34','Calista','Ali Higgins','99051957891');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('35','Palmer','Austin Boone','90050470718');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('36','Alyssa','Axel Cooley','95023643138');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('37','Dieter','Damian Jefferson','90004184280');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('38','Desirae','Derek Phillips','93008109362');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('39','Nayda','Dorian Oneal','90040962473');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('40','Sarah','Thomas Christian','93010342073');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('41','Walter','Theodore Grimes','99029192806');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('42','Stewart','Xanthus Grant','91040529651');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('43','Myra','Tanek Lucas','99092281684');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('44','Maggy','Wing Hamilton','99083563987');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('45','Amal','Ferris Aguirre','90005174773');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('46','Abra','Yardley Farmer','91060620018');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('47','Hilel','Palmer Lynn','97073577577');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('48','Blake','Vernon Lang','95062961288');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('49','Ella','Igor Blanchard','93042289766');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('50','Caleb','Clayton Horn','98072681248');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('51','Illana','Felix Jacobson','96053487512');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('52','Quentin','Geoffrey Clayton','97018420918');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('53','Brenden','Tad Park','92001054510');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('54','Sybil','Kenneth Suarez','96010984166');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('55','Zachary','Beau Tyler','90091819530');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('56','Nasim','Ira Mayo','91007192064');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('57','Camilla','Keane Ferrell','96079260170');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('58','Debra','Lane Burris','92015289800');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('59','Len','Colton White','98035241508');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('60','Jordan','Emmanuel Logan','95042578690');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('61','Cameran','Dean Walls','91019172165');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('62','Ocean','Timothy Woods','98040694249');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('63','Karen','Zane Moreno','94066478490');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('64','Hanna','Brenden Rios','95023192087');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('65','Castor','Josiah Ramirez','95072422168');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('66','Patrick','Callum Mitchell','96055696459');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('67','Sarah','Lucas Wilkins','91078993641');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('68','Stone','Yasir Holt','90011982548');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('69','Buckminster','Cairo Schultz','98063840757');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('70','Lila','Hoyt Moran','99011191502');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('71','Morgan','Alden Booker','99065877653');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('72','Amela','Fritz Riddle','90013778479');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('73','Kristen','Robert Vance','96030800906');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('74','Kirsten','Tate Hahn','92059663364');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('75','Olympia','Hector Cook','95089447310');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('76','Hall','Zephania Carver','94091050486');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('77','Gray','Hector Dunlap','96089153302');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('78','Dane','Julian Nielsen','99097027277');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('79','Hillary','Owen Estrada','94010155323');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('80','Eric','Erich Watts','96060995585');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('81','Gary','Vaughan Rowe','91014852104');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('82','Conan','Calvin Welch','97051185051');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('83','Byron','Hammett Booker','97009238040');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('84','Kessie','Duncan Meadows','97046268143');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('85','Garrett','Kadeem Day','98067071151');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('86','Arsenio','Phelan Leonard','99089032617');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('87','Drew','Fitzgerald Hammond','90057483779');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('88','Jada','Otto Riley','96082890388');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('89','Gabriel','Tiger Dale','96053387792');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('90','Keaton','Gabriel Butler','98008855614');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('91','Ulla','Yardley Harding','99032861027');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('92','Ignatius','Lyle Klein','91034397578');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('93','Hadley','Logan Harrell','99025415818');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('94','Barrett','Zeph Larsen','92008944468');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('95','Sydney','Adrian Reyes','96055591984');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('96','Jasper','Duncan Merrill','90017827348');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('97','Christen','Hedley Foley','96099589244');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('98','Rinah','Zeph Harding','99092435036');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('99','Ruth','Curran Trujillo','95063488747');
INSERT INTO osoby (id,imie,nazwisko,pesel) VALUES ('100','Maite','Zachery Marquez','95020000409');

SELECT * FROM osoby;

SELECT * FROM osoby
WHERE CAST(SUBSTR(pesel, 1, 2) AS number) <= 96 AND CAST(SUBSTR(pesel,1,2) AS number) >= 94 ORDER BY pesel;

SELECT * FROM osoby
WHERE CAST(SUBSTR(pesel, 1, 2) AS number) = 95;

