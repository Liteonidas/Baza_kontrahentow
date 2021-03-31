CREATE TABLE kontrahent (
    nip     NUMBER(10) PRIMARY KEY,
    nazwa   VARCHAR(255)
);

ALTER TABLE Kontrahent 
ADD id NUMBER(10);

--Przynajmniej jeden adres glowny czyli is not null
CREATE TABLE adresy (
    id       NUMBER(10) PRIMARY KEY,
    nip      NUMBER(10),
    adres    VARCHAR(255),
    glowny   VARCHAR(3),
    status   VARCHAR(10),
    CONSTRAINT fk_nip FOREIGN KEY ( nip )
        REFERENCES kontrahent ( nip )
);

--Nazwa: KONTAKT
CREATE TABLE num_tel (
    id      NUMBER(10) PRIMARY KEY,
    nip     NUMBER(10),
    numer   NUMBER(10),
    CONSTRAINT fk_nip1 FOREIGN KEY ( nip )
        REFERENCES kontrahent ( nip )
);

CREATE TABLE info (
    id      NUMBER(10) PRIMARY KEY,
    nip     NUMBER(10),
    mail    VARCHAR(255),
    regon   NUMBER(9),
    krs     NUMBER(10),
    CONSTRAINT fk_nip2 FOREIGN KEY ( nip )
        REFERENCES kontrahent ( nip )
);

RENAME num_tel TO kontakt;
ALTER TABLE info DROP COLUMN mail;

ALTER TABLE kontakt ADD mail VARCHAR(255);

ALTER TABLE adresy DROP COLUMN adres;

--varchar nie number
ALTER TABLE adresy ADD kod_pocztowy VARCHAR(6);
ALTER TABLE adresy ADD miejscowosc VARCHAR(255);
ALTER TABLE adresy ADD ulica VARCHAR(255);
ALTER TABLE adresy ADD lokal VARCHAR(255);


CREATE SEQUENCE sq_id MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

--SELECT sq_id.currval FROM dual;


--ALTER SEQUENCE sq_id INCREMENT BY 1;

--INSERT INTO Kontrahent (nip, nazwa) VALUES (9999999999, 'test test');

--DROP SEQUENCE sq_id;

--Trigger z insertem i updatem, musze zmienic na wylaczny insert
--CREATE OR REPLACE TRIGGER trg_kontrahent_id 
--    BEFORE INSERT OR UPDATE ON kontrahent
--    REFERENCING OLD AS OLD NEW AS NEW
--    FOR EACH ROW
--BEGIN
--    :new.id := sq_id.nextval;
--END;

--Sprawdz jak regulowac wartosci triggera obecna wartosc 10 000 trzeba zmniejszyc do 0
--ALTER TRIGGER trg_kontrahent_id DISABLE;
--
--DROP TRIGGER trg_kontrahent_id2; 

CREATE OR REPLACE TRIGGER trg_kontrahent_id_insert
    BEFORE INSERT ON kontrahent
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.id := sq_id.nextval;
END;



--SELECT * FROM kontrahent
--WHERE id IS NOT NULL;



--SELECT sq_id.NEXTVAL FROM DUAL;
--
--ALTER SEQUENCE sq_id INCREMENT BY 1;

--UPDATE kontrahent SET nazwa = NULL , id = NULL
--WHERE nip = 5243671662;
--
--ALTER TABLE kontrahent
--DROP COLUMN ID;

--CREATE OR REPLACE TRIGGER trg_kontrahent_id2 
--BEFORE INSERT ON kontrahent 
--FOR EACH ROW
--WHEN (new.id IS NULL)
--BEGIN
--  SELECT sq_id.NEXTVAL
--  INTO   :new.id
--  FROM   dual;
--END;

--BEGIN
--for i in 1..2000 LOOP
--UPDATE Kontrahent (id) 
--SET id = sq_id.NEXTVAL
--WHERE id IS NULL;
--END LOOP;
--END;

INSERT INTO Test_imiona (id,nazwa) VALUES ('1','Susan G. Barton');
INSERT INTO Test_imiona (id,nazwa) VALUES ('2','Alexis R. Trevino');
INSERT INTO Test_imiona (id,nazwa) VALUES ('3','Anastasia R. Baird');
INSERT INTO Test_imiona (id,nazwa) VALUES ('4','Meghan B. Maddox');
INSERT INTO Test_imiona (id,nazwa) VALUES ('5','Charles U. Baird');
INSERT INTO Test_imiona (id,nazwa) VALUES ('6','Elmo M. Chambers');
INSERT INTO Test_imiona (id,nazwa) VALUES ('7','Jolene K. Booth');
INSERT INTO Test_imiona (id,nazwa) VALUES ('8','Allistair V. Church');
INSERT INTO Test_imiona (id,nazwa) VALUES ('9','Penelope V. Anthony');
INSERT INTO Test_imiona (id,nazwa) VALUES ('10','Davis Y. Burke');
INSERT INTO Test_imiona (id,nazwa) VALUES ('11','Karleigh Z. Young');
INSERT INTO Test_imiona (id,nazwa) VALUES ('12','Paula X. Avila');
INSERT INTO Test_imiona (id,nazwa) VALUES ('13','Illiana X. Blake');
INSERT INTO Test_imiona (id,nazwa) VALUES ('14','Brendan M. Powers');
INSERT INTO Test_imiona (id,nazwa) VALUES ('15','Carissa N. Vazquez');
INSERT INTO Test_imiona (id,nazwa) VALUES ('16','Veda R. Curry');
INSERT INTO Test_imiona (id,nazwa) VALUES ('17','Ina T. Parsons');
INSERT INTO Test_imiona (id,nazwa) VALUES ('18','Rylee Y. Prince');
INSERT INTO Test_imiona (id,nazwa) VALUES ('19','Mechelle Y. Keller');
INSERT INTO Test_imiona (id,nazwa) VALUES ('20','Jerome B. Pratt');
INSERT INTO Test_imiona (id,nazwa) VALUES ('21','Hu B. Duffy');
INSERT INTO Test_imiona (id,nazwa) VALUES ('22','Heidi C. Acevedo');
INSERT INTO Test_imiona (id,nazwa) VALUES ('23','Edward E. Hodges');
INSERT INTO Test_imiona (id,nazwa) VALUES ('24','Clarke X. Lowery');
INSERT INTO Test_imiona (id,nazwa) VALUES ('25','Mohammad V. Patel');
INSERT INTO Test_imiona (id,nazwa) VALUES ('26','Charde A. Moore');
INSERT INTO Test_imiona (id,nazwa) VALUES ('27','Sharon T. Best');
INSERT INTO Test_imiona (id,nazwa) VALUES ('28','Lillian M. Tate');
INSERT INTO Test_imiona (id,nazwa) VALUES ('29','Kaye Z. Lyons');
INSERT INTO Test_imiona (id,nazwa) VALUES ('30','Jarrod S. Baird');
INSERT INTO Test_imiona (id,nazwa) VALUES ('31','Keaton Z. Horn');
INSERT INTO Test_imiona (id,nazwa) VALUES ('32','Lee Z. Sherman');
INSERT INTO Test_imiona (id,nazwa) VALUES ('33','Mercedes K. Byers');
INSERT INTO Test_imiona (id,nazwa) VALUES ('34','Sade Y. Gates');
INSERT INTO Test_imiona (id,nazwa) VALUES ('35','Odessa Q. Allen');
INSERT INTO Test_imiona (id,nazwa) VALUES ('36','Kermit H. Conner');
INSERT INTO Test_imiona (id,nazwa) VALUES ('37','Laura J. Barron');
INSERT INTO Test_imiona (id,nazwa) VALUES ('38','Ferris G. Morin');
INSERT INTO Test_imiona (id,nazwa) VALUES ('39','Richard U. Chase');
INSERT INTO Test_imiona (id,nazwa) VALUES ('40','Rahim V. Montoya');

CREATE SEQUENCE sq_nip
minvalue 5243658352
maxvalue 9999999999
start with 5243658352
INCREMENT BY 11;

--DROP SEQUENCE sq_nip;

CREATE TABLE Test_imiona (
    id NUMBER(2) PRIMARY KEY,
    nazwa VARCHAR(255)
    );
    
CREATE TABLE Test_imiona1 (
    id NUMBER(10),
    nazwa VARCHAR(255)
    );
    
CREATE SEQUENCE sq_id_test MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

--ALTER SEQUENCE sq_id_test INCREMENT BY 1;

--SELECT sq_id_test.NEXTVAL FROM DUAL;
--
--select sq_id_test.currval from dual;

--DROP SEQUENCE sq_id_test;

CREATE OR REPLACE TRIGGER trg_test_id BEFORE
    INSERT ON Test_imiona1
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.id := sq_id_test.nextval;
END;

--ALTER TRIGGER trg_kontrahent_id2 DISABLE;

--SELECT * FROM Test_imiona1
--ORDER BY id;

--insert into Test_imiona1 (nazwa) select Test_imiona.nazwa
--from Test_imiona
--order by dbms_random.value;
  
BEGIN
for i in 1..2000 LOOP
INSERT INTO Kontrahent (nip) VALUES (sq_nip.NEXTVAL);
END LOOP;
END;


--UPDATE Kontrahent 
--SET kontrahent.id = kontrahent.id - 8000
--WHERE kontrahent.id > 1;

--select * from Kontrahent
--ORDER BY id;

begin
for i in 1..50 LOOP
insert into Test_imiona1 (nazwa) select Test_imiona.nazwa
from Test_imiona
order by dbms_random.value;
end loop;
end;

begin
for i in 1..50 LOOP
insert into Kontrahent (nazwa) select Test_imiona.nazwa
from Test_imiona
order by dbms_random.value;
end loop;
end;

begin
for i in 1..2000 LOOP
UPDATE Kontrahent 
SET nazwa =
    (select test_imiona1.nazwa
    from Test_imiona1
    order by dbms_random.value)
WHERE nazwa IS NULL;
end loop;
end;

--UPDATE Kontrahent 
--SET nazwa =
--    (select nazwa
--    from Test_imiona1
--    order by dbms_random.value)
--WHERE nazwa IS NULL;

SELECT Test_imiona1.nazwa
INTO kontrahent.nazwa
FROM Test_imiona1;

UPDATE Kontrahent 
SET nazwa =
    (select Test_imiona1.nazwa 
    from Test_imiona1
    WHERE Test_imiona1.id = kontrahent.id);

UPDATE kontrahent 
SET kontrahent.nazwa = test_imiona1.nazwa
FROM Kontrahent
JOIN test_imiona1
ON kontrahent.id = test_imiona1.id;

UPDATE nazwa 
SET nazwa = test_imiona1.nazwa
FROM
    kontrahent
    JOIN test_imiona1 ON kontrahent.nazwa = nazwa;
    
CREATE SEQUENCE sq_id_uniw MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;
    
--ustalanie inddeksow w adresach, kontaktach, info - zmienialem nazwy
begin
for i in 1..2000 LOOP
INSERT INTO info (id)
VALUES (i);
end loop;
end;
    
--DELETE FROM Kontrahent;

--insert into Kontrahent (nazwa) select Test_imiona1 (nazwa)
--from Test_imiona1;

UPDATE info 
SET nip =
    (select kontrahent.nip 
    from kontrahent
    WHERE kontrahent.id = info.id);

--SELECT nip, count(id) FROM adresy
--group by nip having nip = 5243672509;

UPDATE adresy
SET glowny = 'tak'
WHERE glowny IS NULL;
--
begin
for i in 1..2000 LOOP
INSERT INTO mail_zlonczony (id)
VALUES (i);
end loop;
end; 

SELECT * FROM mail_zlonczony ORDER BY id;

CREATE TABLE mail (
    id NUMBER(10) PRIMARY KEY,
    czlon1   VARCHAR(255),
    czlon2   VARCHAR(255),
    czlon3   VARCHAR(255)
);

CREATE TABLE mail_zlonczony (
    id NUMBER(10) PRIMARY KEY,
    caly_mail   VARCHAR(255)
);


ALTER TABLE mail_zlonczony MODIFY caly_mail VARCHAR(765);

SELECT * FROM mail_zlonczony
ORDER BY id ASC;

begin
  for i in 1..2000 LOOP
    UPDATE mail_zlonczony SET caly_mail = (select ma FROM (select mail.czlon1||mail.czlon2||mail.czlon3 AS ma
                                          from mail
                                          where rownum = 1
                                          order by dbms_random.value))
                                          WHERE id = i;
  end loop;
end;

begin

  for i in 1..2000 LOOP
    UPDATE mail_zlonczony SET caly_mail = '1'
                                          WHERE id = i;
  end loop;
end;

select M1.czlon1||M2.czlon2||M3.czlon3
                    from mail M1, mail M2, mail M3
                    order by dbms_random.value;
                                          
--begin
--
--  for i in 1..2000 LOOP
--    UPDATE mail_zlonczony 
--    SET caly_mail = (select ma FROM (select M1.czlon1||M2.czlon2||M3.czlon3 AS ma
--                    from mail M1, mail M2, mail M3
--                    order by dbms_random.value)
--                    where rownum = 1)
--    WHERE id = i;
--  end loop;
--end;


/
set serveroutput on;
declare
v_random_mail VARCHAR(765);
begin
    for i in 1..2000 loop
        select ma
        into v_random_mail
        from (select M1.czlon1||M2.czlon2||M3.czlon3 AS ma
            from mail M1, mail M2, mail M3
            order by dbms_random.value)
        where rownum = 1;
        dbms_output.put_line(v_random_mail);
        
        update mail_zlonczony
        set caly_mail = v_random_mail
        where id = i;
    end loop;
end;
/

ALTER TABLE mail_zlonczony MODIFY caly_mail VARCHAR(255);

UPDATE kontakt 
SET mail =
    (select mail_zlonczony.caly_mail 
    from mail_zlonczony
    WHERE mail_zlonczony.id = kontakt.id);

SELECT * FROM kontakt
ORDER BY id ASC;

declare
zmienna number(9) := 385243547;
begin
for i in 1..2000 LOOP
zmienna := zmienna + 5;
UPDATE kontakt
SET numer = zmienna
WHERE id = i;
end loop;
end;

--generuje regony
declare
zmienna1 number(9) := 365095696;
begin
for i in 1..2000 LOOP
zmienna1 := zmienna1 + 5;
UPDATE info
SET regon = zmienna1
WHERE id = i;
end loop;
end;

SELECT * FROM info
ORDER BY id ASC;

declare
krs1 number(10) := 0000630893;
begin
for i in 1..2000 LOOP
krs1 := krs1 + 5;
UPDATE info
SET krs = krs1
WHERE id = i;
end loop;
end;


--Funkcja do KRSu dopelniajaca zera z lewej
SELECT krs, LPAD(krs, 10, 0) AS nr FROM info;

Alter table info
ADD krs1 varchar(10);


begin
for i in 1..2000 loop
UPDATE info
SET krs1 = LPAD(krs, 10, 0)
WHERE id = i;
end loop;
end;

ALTER TABLE info
DROP COLUMN krs;

ALTER TABLE info
  RENAME COLUMN krs1 TO krs;
  
  
SELECT * FROM adresy order by id;
SELECT * FROM info order by id;
SELECT * FROM kontakt order by id;
SELECT * FROM kontrahent order by id;

  
--INSERT INTO adresy (id,nip) VALUES ('2001',5243672509);
--
--DELETE FROM adresy WHERE id=2001;

--DROP TABLe Test_imiona1;

insert into mail (id, czlon1, czlon2, czlon3) values (1, 'Whitman', 'McVaugh', 'wmcvaugh0@columbia.edu');
insert into mail (id, czlon1, czlon2, czlon3) values (2, 'Lester', 'Pietrzak', 'lpietrzak1@friendfeed.com');
insert into mail (id, czlon1, czlon2, czlon3) values (3, 'Adaline', 'Defont', 'adefont2@gov.uk');
insert into mail (id, czlon1, czlon2, czlon3) values (4, 'Hana', 'Bockman', 'hbockman3@vimeo.com');
insert into mail (id, czlon1, czlon2, czlon3) values (5, 'Allianora', 'Durno', 'adurno4@sun.com');
insert into mail (id, czlon1, czlon2, czlon3) values (6, 'Maiga', 'Boldock', 'mboldock5@pcworld.com');
insert into mail (id, czlon1, czlon2, czlon3) values (7, 'Hi', 'Udale', 'hudale6@odnoklassniki.ru');
insert into mail (id, czlon1, czlon2, czlon3) values (8, 'Danielle', 'Goodburn', 'dgoodburn7@chronoengine.com');
insert into mail (id, czlon1, czlon2, czlon3) values (9, 'Traci', 'Twamley', 'ttwamley8@theatlantic.com');
insert into mail (id, czlon1, czlon2, czlon3) values (10, 'Craig', 'McKmurrie', 'cmckmurrie9@wufoo.com');
insert into mail (id, czlon1, czlon2, czlon3) values (11, 'Mikaela', 'Accomb', 'maccomba@webs.com');
insert into mail (id, czlon1, czlon2, czlon3) values (12, 'Krystle', 'Murch', 'kmurchb@cisco.com');
insert into mail (id, czlon1, czlon2, czlon3) values (13, 'Dru', 'Camelin', 'dcamelinc@timesonline.co.uk');
insert into mail (id, czlon1, czlon2, czlon3) values (14, 'Tildie', 'Burgher', 'tburgherd@salon.com');
insert into mail (id, czlon1, czlon2, czlon3) values (15, 'Anna-diane', 'Dackombe', 'adackombee@digg.com');
insert into mail (id, czlon1, czlon2, czlon3) values (16, 'Bertine', 'Vandenhoff', 'bvandenhofff@moonfruit.com');
insert into mail (id, czlon1, czlon2, czlon3) values (17, 'Conrado', 'Pennicard', 'cpennicardg@so-net.ne.jp');
insert into mail (id, czlon1, czlon2, czlon3) values (18, 'Daren', 'Pester', 'dpesterh@miibeian.gov.cn');
insert into mail (id, czlon1, czlon2, czlon3) values (19, 'Crystal', 'Jansky', 'cjanskyi@indiatimes.com');
insert into mail (id, czlon1, czlon2, czlon3) values (20, 'Allin', 'Szymanski', 'aszymanskij@soundcloud.com');
insert into mail (id, czlon1, czlon2, czlon3) values (21, 'Wileen', 'Whatsize', 'wwhatsizek@wunderground.com');
insert into mail (id, czlon1, czlon2, czlon3) values (22, 'Ertha', 'Sibbson', 'esibbsonl@constantcontact.com');
insert into mail (id, czlon1, czlon2, czlon3) values (23, 'Fanechka', 'Knapton', 'fknaptonm@disqus.com');
insert into mail (id, czlon1, czlon2, czlon3) values (24, 'Arden', 'Juanico', 'ajuanicon@answers.com');
insert into mail (id, czlon1, czlon2, czlon3) values (25, 'Phaidra', 'Crehan', 'pcrehano@ucoz.ru');
insert into mail (id, czlon1, czlon2, czlon3) values (26, 'Tadd', 'Morter', 'tmorterp@vistaprint.com');
insert into mail (id, czlon1, czlon2, czlon3) values (27, 'Rad', 'Witherow', 'rwitherowq@ca.gov');
insert into mail (id, czlon1, czlon2, czlon3) values (28, 'Townie', 'Dadd', 'tdaddr@si.edu');
insert into mail (id, czlon1, czlon2, czlon3) values (29, 'Ellery', 'Wayt', 'ewayts@printfriendly.com');
insert into mail (id, czlon1, czlon2, czlon3) values (30, 'Odilia', 'Cattini', 'ocattinit@weather.com');
insert into mail (id, czlon1, czlon2, czlon3) values (31, 'Ashli', 'Rosenshine', 'arosenshineu@goo.ne.jp');
insert into mail (id, czlon1, czlon2, czlon3) values (32, 'Nicolais', 'Ridge', 'nridgev@about.me');
insert into mail (id, czlon1, czlon2, czlon3) values (33, 'Arabelle', 'Simmig', 'asimmigw@ted.com');
insert into mail (id, czlon1, czlon2, czlon3) values (34, 'Emyle', 'Powland', 'epowlandx@bing.com');
insert into mail (id, czlon1, czlon2, czlon3) values (35, 'Jodi', 'Ricci', 'jricciy@chicagotribune.com');
insert into mail (id, czlon1, czlon2, czlon3) values (36, 'Orel', 'Falcus', 'ofalcusz@about.com');
insert into mail (id, czlon1, czlon2, czlon3) values (37, 'Emmie', 'Deem', 'edeem10@cargocollective.com');
insert into mail (id, czlon1, czlon2, czlon3) values (38, 'Trudie', 'Chalke', 'tchalke11@seattletimes.com');
insert into mail (id, czlon1, czlon2, czlon3) values (39, 'Simmonds', 'Besson', 'sbesson12@topsy.com');
insert into mail (id, czlon1, czlon2, czlon3) values (40, 'Zara', 'Casino', 'zcasino13@oakley.com');



CREATE TABLE kody_pocz (
  id number(10),
  kod_pocz varchar(6)
);
DROP TABLE kody_pocz;
INSERT INTO tmp_kod (kod_pocz) VALUES ('85-410');
INSERT INTO tmp_kod (kod_pocz) VALUES ('82-079');
INSERT INTO tmp_kod (kod_pocz) VALUES ('57-054');
INSERT INTO tmp_kod (kod_pocz) VALUES ('54-238');
INSERT INTO tmp_kod (kod_pocz) VALUES ('76-226');
INSERT INTO tmp_kod (kod_pocz) VALUES ('98-787');
INSERT INTO tmp_kod (kod_pocz) VALUES ('33-104');
INSERT INTO tmp_kod (kod_pocz) VALUES ('45-076');
INSERT INTO tmp_kod (kod_pocz) VALUES ('94-157');
INSERT INTO tmp_kod (kod_pocz) VALUES ('61-025');
INSERT INTO tmp_kod (kod_pocz) VALUES ('48-610');
INSERT INTO tmp_kod (kod_pocz) VALUES ('85-825');
INSERT INTO tmp_kod (kod_pocz) VALUES ('89-435');
INSERT INTO tmp_kod (kod_pocz) VALUES ('60-557');
INSERT INTO tmp_kod (kod_pocz) VALUES ('41-769');
INSERT INTO tmp_kod (kod_pocz) VALUES ('19-259');
INSERT INTO tmp_kod (kod_pocz) VALUES ('77-094');
INSERT INTO tmp_kod (kod_pocz) VALUES ('72-177');
INSERT INTO tmp_kod (kod_pocz) VALUES ('71-138');
INSERT INTO tmp_kod (kod_pocz) VALUES ('81-520');
INSERT INTO tmp_kod (kod_pocz) VALUES ('71-291');
INSERT INTO tmp_kod (kod_pocz) VALUES ('05-647');
INSERT INTO tmp_kod (kod_pocz) VALUES ('43-626');
INSERT INTO tmp_kod (kod_pocz) VALUES ('75-974');
INSERT INTO tmp_kod (kod_pocz) VALUES ('04-537');
INSERT INTO tmp_kod (kod_pocz) VALUES ('16-566');
INSERT INTO tmp_kod (kod_pocz) VALUES ('23-538');
INSERT INTO tmp_kod (kod_pocz) VALUES ('01-037');
INSERT INTO tmp_kod (kod_pocz) VALUES ('80-406');
INSERT INTO tmp_kod (kod_pocz) VALUES ('83-807');
INSERT INTO tmp_kod (kod_pocz) VALUES ('62-898');
INSERT INTO tmp_kod (kod_pocz) VALUES ('97-215');
INSERT INTO tmp_kod (kod_pocz) VALUES ('41-312');
INSERT INTO tmp_kod (kod_pocz) VALUES ('43-124');
INSERT INTO tmp_kod (kod_pocz) VALUES ('64-037');
INSERT INTO tmp_kod (kod_pocz) VALUES ('91-356');
INSERT INTO tmp_kod (kod_pocz) VALUES ('40-799');
INSERT INTO tmp_kod (kod_pocz) VALUES ('92-772');
INSERT INTO tmp_kod (kod_pocz) VALUES ('33-198');
INSERT INTO tmp_kod (kod_pocz) VALUES ('49-020');
INSERT INTO tmp_kod (kod_pocz) VALUES ('85-657');
INSERT INTO tmp_kod (kod_pocz) VALUES ('42-551');
INSERT INTO tmp_kod (kod_pocz) VALUES ('51-702');
INSERT INTO tmp_kod (kod_pocz) VALUES ('94-626');
INSERT INTO tmp_kod (kod_pocz) VALUES ('15-013');
INSERT INTO tmp_kod (kod_pocz) VALUES ('67-585');
INSERT INTO tmp_kod (kod_pocz) VALUES ('78-751');
INSERT INTO tmp_kod (kod_pocz) VALUES ('15-101');
INSERT INTO tmp_kod (kod_pocz) VALUES ('36-496');
INSERT INTO tmp_kod (kod_pocz) VALUES ('08-616');
INSERT INTO tmp_kod (kod_pocz) VALUES ('05-384');
INSERT INTO tmp_kod (kod_pocz) VALUES ('55-999');
INSERT INTO tmp_kod (kod_pocz) VALUES ('56-897');
INSERT INTO tmp_kod (kod_pocz) VALUES ('42-266');
INSERT INTO tmp_kod (kod_pocz) VALUES ('59-338');
INSERT INTO tmp_kod (kod_pocz) VALUES ('24-880');
INSERT INTO tmp_kod (kod_pocz) VALUES ('75-126');
INSERT INTO tmp_kod (kod_pocz) VALUES ('75-126');
INSERT INTO tmp_kod (kod_pocz) VALUES ('34-584');
INSERT INTO tmp_kod (kod_pocz) VALUES ('83-796');
INSERT INTO tmp_kod (kod_pocz) VALUES ('59-037');
INSERT INTO tmp_kod (kod_pocz) VALUES ('31-090');
INSERT INTO tmp_kod (kod_pocz) VALUES ('41-763');
INSERT INTO tmp_kod (kod_pocz) VALUES ('78-389');
INSERT INTO tmp_kod (kod_pocz) VALUES ('75-246');
INSERT INTO tmp_kod (kod_pocz) VALUES ('70-447');
INSERT INTO tmp_kod (kod_pocz) VALUES ('26-424');
INSERT INTO tmp_kod (kod_pocz) VALUES ('60-984');
INSERT INTO tmp_kod (kod_pocz) VALUES ('47-107');
INSERT INTO tmp_kod (kod_pocz) VALUES ('85-002');
INSERT INTO tmp_kod (kod_pocz) VALUES ('47-322');
INSERT INTO tmp_kod (kod_pocz) VALUES ('85-587');
INSERT INTO tmp_kod (kod_pocz) VALUES ('73-482');
INSERT INTO tmp_kod (kod_pocz) VALUES ('20-074');
INSERT INTO tmp_kod (kod_pocz) VALUES ('37-264');
INSERT INTO tmp_kod (kod_pocz) VALUES ('13-894');
INSERT INTO tmp_kod (kod_pocz) VALUES ('20-627');
INSERT INTO tmp_kod (kod_pocz) VALUES ('40-781');
INSERT INTO tmp_kod (kod_pocz) VALUES ('73-796');


begin
for i in 1..79 LOOP
INSERT INTO tmp_kod (id)
VALUES (i);
end loop;
end;

ALTER TABLE kody_pocz
ADD id NUMBER(10);

--DELETE FROM tmp_kod;

SELECT * FROM tmp_kod;


INSERT INTO tmp_kod
select kod_pocz FROM kody_pocz
WHERE 

CREATE TABLE tmp_kod (
  id number(10),
  kod_pocz varchar(6)
);

ALTER SEQUENCE sq_id_tmp INCREMENT BY 1;
SELECT sq_id_tmp.NEXTVAL FROM dual; 
SELECT sq_id_tmp.CURRVAL FROM dual; 


CREATE SEQUENCE sq_id_tmp MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_tmp_id BEFORE
    INSERT ON tmp_kod
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.id := sq_id_tmp.nextval;
END;


CREATE SEQUENCE sq_kody_pocz_id MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_kody_pocz_id BEFORE
    INSERT ON kody_pocz
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.id := sq_kody_pocz_id.nextval;
END;

ALTER SEQUENCE sq_kody_pocz_id INCREMENT BY -1;
SELECT sq_kody_pocz_id.NEXTVAL FROM dual; 
SELECT sq_kody_pocz_id.CURRVAL FROM dual;

begin
for i in 1..2000 LOOP
insert into kody_pocz (kod_pocz) select tmp FROM (select tmp_kod.kod_pocz AS tmp
from tmp_kod
order by dbms_random.value)
WHERE rownum = 1;
end loop;
end;


SELECT * FROM kody_pocz;

UPDATE adresy 
SET kod_pocztowy =
    (select kody_pocz.kod_pocz 
    from kody_pocz
    WHERE kody_pocz.id = adresy.id);

UPDATE adresy 
SET status = 'aktywny';


SELECT * FROM adresy;
--DELETE FROM kody_pocz;

select tmp FROM (select tmp_kod.kod_pocz AS tmp
from tmp_kod
order by dbms_random.value)
WHERE rownum =1;

CREATE TABLE miejsc (
  id number(10),
  miejscowosc varchar(255)
);

CREATE SEQUENCE sq_miejsc_id MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_miejsc_id BEFORE
    INSERT ON miejsc_tmp
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.id := sq_miejsc_id.nextval;
END;

CREATE TABLE miejsc_tmp (
  id number(10),
  miejscowosc_tmp varchar(255)
);

begin
for i in 1..2000 LOOP
insert into miejsc_tmp (miejscowosc_tmp) select tmp FROM (select miejsc.miejscowosc AS tmp
from miejsc
order by dbms_random.value)
WHERE rownum = 1;
end loop;
end;

SELECT * FROM adresy order by id;

UPDATE adresy 
SET miejscowosc =
    (select miejsc_tmp.miejscowosc_tmp 
    from miejsc_tmp
    WHERE miejsc_tmp.id = adresy.id);



INSERT INTO miejsc (miejscowosc,id) VALUES ('Sunnyvale','1');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Butte','2');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Orlando','3');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Elmira','4');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Biddeford','5');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Baltimore','6');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Bessemer','7');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Guthrie','8');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Los Angeles','9');
INSERT INTO miejsc (miejscowosc,id) VALUES ('San Antonio','10');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Cypress','11');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Chino Hills','12');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Riverside','13');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Redlands','14');
INSERT INTO miejsc (miejscowosc,id) VALUES ('North Charleston','15');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Fairfax','16');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Cranston','17');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Lynchburg','18');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Cerritos','19');
INSERT INTO miejsc (miejscowosc,id) VALUES ('New Haven','20');
INSERT INTO miejsc (miejscowosc,id) VALUES ('San Angelo','21');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Bell','22');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Suffolk','23');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Pocatello','24');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Madison','25');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Batavia','26');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Fort Dodge','27');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Grambling','28');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Pomona','29');
INSERT INTO miejsc (miejscowosc,id) VALUES ('West Palm Beach','30');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Vacaville','31');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Moraga','32');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Bethany','33');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Montpelier','34');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Springfield','35');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Cincinnati','36');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Norfolk','37');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Walnut','38');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Manitowoc','39');
INSERT INTO miejsc (miejscowosc,id) VALUES ('Cedar Rapids','40');

CREATE TABLE ulica (
  ul varchar(255)
);
ALTER TABLE ulica ADD id number(10);

INSERT INTO ulica (id,ul) VALUES ('1','Vitae Street');
INSERT INTO ulica (id,ul) VALUES ('2','Nec Street');
INSERT INTO ulica (id,ul) VALUES ('3','At, Street');
INSERT INTO ulica (id,ul) VALUES ('4','Nec, St.');
INSERT INTO ulica (id,ul) VALUES ('5','Enim. Avenue');
INSERT INTO ulica (id,ul) VALUES ('6','Orci. Rd.');
INSERT INTO ulica (id,ul) VALUES ('7','Egestas. Av.');
INSERT INTO ulica (id,ul) VALUES ('8','Mauris St.');
INSERT INTO ulica (id,ul) VALUES ('9','Vel Ave');
INSERT INTO ulica (id,ul) VALUES ('10','Ante Ave');
INSERT INTO ulica (id,ul) VALUES ('11','Mollis Ave');
INSERT INTO ulica (id,ul) VALUES ('12','Lorem Avenue');
INSERT INTO ulica (id,ul) VALUES ('13','Quis, Avenue');
INSERT INTO ulica (id,ul) VALUES ('14','Nec Street');
INSERT INTO ulica (id,ul) VALUES ('15','Proin St.');
INSERT INTO ulica (id,ul) VALUES ('16','Mollis Ave');
INSERT INTO ulica (id,ul) VALUES ('17','Sollicitudin Avenue');
INSERT INTO ulica (id,ul) VALUES ('18','Elit, Av.');
INSERT INTO ulica (id,ul) VALUES ('19','Magna. Av.');
INSERT INTO ulica (id,ul) VALUES ('20','Elit, Road');
INSERT INTO ulica (id,ul) VALUES ('21','Accumsan Road');
INSERT INTO ulica (id,ul) VALUES ('22','Donec Street');
INSERT INTO ulica (id,ul) VALUES ('23','Leo. Ave');
INSERT INTO ulica (id,ul) VALUES ('24','Felis Rd.');
INSERT INTO ulica (id,ul) VALUES ('25','Et Rd.');
INSERT INTO ulica (id,ul) VALUES ('26','Ac Rd.');
INSERT INTO ulica (id,ul) VALUES ('27','652, 5702 Semper Street');
INSERT INTO ulica (id,ul) VALUES ('28','Sit Road');
INSERT INTO ulica (id,ul) VALUES ('29','Sem Road');
INSERT INTO ulica (id,ul) VALUES ('30','Pede Rd.');
INSERT INTO ulica (id,ul) VALUES ('31','Rutrum. St.');
INSERT INTO ulica (id,ul) VALUES ('32','Sapien Street');
INSERT INTO ulica (id,ul) VALUES ('33','Proin St.');
INSERT INTO ulica (id,ul) VALUES ('34','Sit St.');
INSERT INTO ulica (id,ul) VALUES ('35','Enim Av.');
INSERT INTO ulica (id,ul) VALUES ('36','Feugiat Rd.');
INSERT INTO ulica (id,ul) VALUES ('37','Nunc St.');
INSERT INTO ulica (id,ul) VALUES ('38','Curae; St.');
INSERT INTO ulica (id,ul) VALUES ('39','Ut Avenue');
INSERT INTO ulica (id,ul) VALUES ('40','Tellus Rd.');

CREATE SEQUENCE sq_ulica_id MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ulica_id BEFORE
    INSERT ON ulica_tmp
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.id := sq_ulica_id.nextval;
END;

CREATE TABLE ulica_tmp (
  id number(10),
  ul_tmp varchar(255)
);

begin
for i in 1..2000 LOOP
insert into ulica_tmp (ul_tmp) select tmp FROM (select ulica.ul AS tmp
from ulica
order by dbms_random.value)
WHERE rownum = 1;
end loop;
end;

SELECT * FROM ulica order by id;

UPDATE adresy 
SET ulica =
    (select ulica_tmp.ul_tmp 
    from ulica_tmp
    WHERE ulica_tmp.id = adresy.id);
    
SELECT * FROM adresy order by id;

CREATE TABLE lokal (
    id number(10),
    lok varchar(255)
);

INSERT INTO lokal (id,lok) VALUES ('1','1/2');
INSERT INTO lokal (id,lok) VALUES ('2','1/3');
INSERT INTO lokal (id,lok) VALUES ('3','1/4');
INSERT INTO lokal (id,lok) VALUES ('4','1/5');
INSERT INTO lokal (id,lok) VALUES ('5','1/6');
INSERT INTO lokal (id,lok) VALUES ('6','1/7');
INSERT INTO lokal (id,lok) VALUES ('7','1/8');
INSERT INTO lokal (id,lok) VALUES ('8','2/9');
INSERT INTO lokal (id,lok) VALUES ('9','2/8');
INSERT INTO lokal (id,lok) VALUES ('10','2/7');
INSERT INTO lokal (id,lok) VALUES ('11','2/6');
INSERT INTO lokal (id,lok) VALUES ('12','2/5');
INSERT INTO lokal (id,lok) VALUES ('13','2/4');
INSERT INTO lokal (id,lok) VALUES ('14','2/3');
INSERT INTO lokal (id,lok) VALUES ('15','3/1');
INSERT INTO lokal (id,lok) VALUES ('16','3/2');
INSERT INTO lokal (id,lok) VALUES ('17','3/4');
INSERT INTO lokal (id,lok) VALUES ('18','3/5');
INSERT INTO lokal (id,lok) VALUES ('19','3/6');
INSERT INTO lokal (id,lok) VALUES ('20','3/7');
INSERT INTO lokal (id,lok) VALUES ('21','3/8');
INSERT INTO lokal (id,lok) VALUES ('22','3/9');
INSERT INTO lokal (id,lok) VALUES ('23','4/8');
INSERT INTO lokal (id,lok) VALUES ('24','4/7');
INSERT INTO lokal (id,lok) VALUES ('25','4/6');
INSERT INTO lokal (id,lok) VALUES ('26','4/5');
INSERT INTO lokal (id,lok) VALUES ('27','4/3');
INSERT INTO lokal (id,lok) VALUES ('28','4/2');
INSERT INTO lokal (id,lok) VALUES ('29','4/1');
INSERT INTO lokal (id,lok) VALUES ('30','4/9');
INSERT INTO lokal (id,lok) VALUES ('31','5/9');
INSERT INTO lokal (id,lok) VALUES ('32','5/8');
INSERT INTO lokal (id,lok) VALUES ('33','5/7');
INSERT INTO lokal (id,lok) VALUES ('34','5/6');
INSERT INTO lokal (id,lok) VALUES ('35','5/4');
INSERT INTO lokal (id,lok) VALUES ('36','6/3');
INSERT INTO lokal (id,lok) VALUES ('37','6/2');
INSERT INTO lokal (id,lok) VALUES ('38','6/1');
INSERT INTO lokal (id,lok) VALUES ('39','6/7');
INSERT INTO lokal (id,lok) VALUES ('40','6/8');

CREATE SEQUENCE sq_lokal_id MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_lokal_id BEFORE
    INSERT ON lokal_tmp
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.id := sq_lokal_id.nextval;
END;

CREATE TABLE lokal_tmp (
  id number(10),
  lok_tmp varchar(255)
);

begin
for i in 1..2000 LOOP
insert into lokal_tmp (lok_tmp) select tmp FROM (select lokal.lok AS tmp
from lokal
order by dbms_random.value)
WHERE rownum = 1;
end loop;
end;

UPDATE adresy 
SET lokal =
    (select lokal_tmp.lok_tmp 
    from lokal_tmp
    WHERE lokal_tmp.id = adresy.id);

SELECT * FROM adresy order by id;