CREATE TABLE "KONTRAHENT" 
   (	"ID_KONTR" NUMBER(10,0) PRIMARY KEY, 
	"NAZWA" VARCHAR(255)
   ) ;
   
CREATE TABLE "ADRESY" 
   (	"ID" NUMBER(10,0) PRIMARY KEY, 
	"ID_KONTR" NUMBER(10,0), 
	"KOD_POCZTOWY" VARCHAR(6), 
	"MIEJSCOWOSC" VARCHAR(255), 
	"ULICA" VARCHAR(255), 
	"LOKAL" VARCHAR(255),
    "GLOWNY" VARCHAR(3), 
	"STATUS" VARCHAR(10),
    CONSTRAINT fk_adresy FOREIGN KEY ( ID_KONTR )
        REFERENCES KONTRAHENT ( ID_KONTR )
   ) ;

   
CREATE TABLE "INFO" 
   (	"ID" NUMBER(10,0) PRIMARY KEY, 
    "ID_KONTR" NUMBER(10,0),
	"NIP" NUMBER(10,0), 
	"REGON" NUMBER(9,0), 
	"KRS" VARCHAR(10),
    CONSTRAINT fk_info FOREIGN KEY ( ID_KONTR )
        REFERENCES KONTRAHENT ( ID_KONTR )
   ) ;
   
ALTER TABLE INFO ADD UNIQUE (ID_KONTR);
ALTER TABLE INFO ADD UNIQUE (NIP);
ALTER TABLE INFO ADD UNIQUE (REGON);
ALTER TABLE INFO ADD UNIQUE (KRS);
   
CREATE TABLE "NUMER_TEL" 
   (	"ID" NUMBER(10,0) PRIMARY KEY, 
    "ID_KONTR" NUMBER(10,0),
	"NUMER" NUMBER(10,0),
    CONSTRAINT fk_numer FOREIGN KEY ( ID_KONTR )
        REFERENCES KONTRAHENT ( ID_KONTR )
   ) ;
   
CREATE TABLE "MAIL" 
   (	"ID" NUMBER(10,0) PRIMARY KEY, 
    "ID_KONTR" NUMBER(10,0), 
	"MAIL" VARCHAR(255),
    CONSTRAINT fk_mail FOREIGN KEY ( ID_KONTR )
        REFERENCES KONTRAHENT ( ID_KONTR )
   ) ;
   
   
--  SKRYPTY DLA KONTRAHENT------------------------------------------------------------------
--  sekwencja i trigger dla ID_KONTR
CREATE SEQUENCE sq_ID_KONTR MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ID_KONTR
    BEFORE INSERT ON KONTRAHENT
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.ID_KONTR := sq_ID_KONTR.nextval;
END;

-- tabela i inserty do wypenienia KONTRAHENTa

CREATE TABLE Test_imiona (
    id NUMBER(10) PRIMARY KEY,
    nazwa VARCHAR(255)
    );

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

--  SELECT * FROM Test_imiona;
-- 1 do 50 bo jest 40 rekordów
begin
for i in 1..50 LOOP
insert into KONTRAHENT (NAZWA) select Test_imiona.nazwa
from Test_imiona
order by dbms_random.value;
end loop;
end;

--  SELECT * FROM KONTRAHENT;

--  SKRYPTY DLA ADRESY --------------------------------------------------------------------

--  sekwencja i trigger dla ID
CREATE SEQUENCE sq_ID_ADRES MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ID_ADRES
    BEFORE INSERT ON ADRESY
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.ID := sq_ID_ADRES.nextval;
END;

-- generowanie id_kontr sekwencja i triggerem, mozna rowniez przekopiowac tabele z kontrahenta
-- ja jednak wybralem generowanie, gdyz w tym przypadku nie ma to znaczenia
CREATE SEQUENCE sq_ID_KONTR_ADRES MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ID_KONTR_ADRES
    BEFORE INSERT ON ADRESY
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.ID_KONTR := sq_ID_KONTR_ADRES.nextval;
END;

-- kod pocztowy

CREATE TABLE tmp_kod (
  kod_pocz varchar(6)
);


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
for i in 1..2000 LOOP
insert into ADRESY (KOD_POCZTOWY) select tmp FROM (select tmp_kod.kod_pocz AS tmp
from tmp_kod
order by dbms_random.value)
WHERE rownum = 1;
end loop;
end;

--  SELECT * FROM ADRESY;

-- miejscowosc

CREATE TABLE miejsc (
  id number(10),
  miejscowosc varchar(255)
);

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

-- Jesli beda problemy z plikiem ponizej nalezy rozszerzyc rozmiar ponizszym poleceniem
-- alter tablespace   undotbs1 add datafile   'C:\oraclexe\app\oracle\oradata\XE\UNDOTBS01A.DBF' size 500m autoextend on;



/
set serveroutput on;
declare
v_miejsc VARCHAR(255);
begin
    for i in 1..2000 loop
        select tmp 
        into v_miejsc 
        FROM (select miejsc.miejscowosc AS tmp
        from miejsc
        order by dbms_random.value)
        WHERE rownum = 1;
        dbms_output.put_line(v_miejsc);
        
        update ADRESY
        set MIEJSCOWOSC = v_miejsc
        where id = i;
    end loop;
end;
/

-- SELECT * FROM ADRESY;

-- ULICA
CREATE TABLE ulica (
    id number(10),
    ul varchar(255)
);

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
INSERT INTO ulica (id,ul) VALUES ('27','Semper Street');
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

-- SELECT * FROM ulica;

/
set serveroutput on;
declare
v_ulica VARCHAR(255);
begin
    for i in 1..2000 loop
        select tmp 
        into v_ulica 
        FROM (select ulica.ul AS tmp
        from ulica
        order by dbms_random.value)
        WHERE rownum = 1;
        dbms_output.put_line(v_ulica);
        
        update ADRESY
        set ULICA = v_ulica
        where id = i;
    end loop;
end;
/

-- LOKAL

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

-- SELECT * FROM lokal;

/
set serveroutput on;
declare
v_lokal VARCHAR(255);
begin
    for i in 1..2000 loop
        select tmp 
        into v_lokal 
        FROM (select lokal.lok AS tmp
        from lokal
        order by dbms_random.value)
        WHERE rownum = 1;
        dbms_output.put_line(v_lokal);
        
        update ADRESY
        set LOKAL = v_lokal
        where id = i;
    end loop;
end;
/

SELECT * FROM ADRESY order by id;

-- GLOWNY

UPDATE ADRESY
SET GLOWNY = 'tak'
WHERE GLOWNY IS NULL;

-- STATUS

UPDATE ADRESY
SET STATUS = 'aktywny'
WHERE STATUS IS NULL;

-- SKRYPTY DLA INFO-------------------------------------------------------------------------

--  "ID" 
CREATE SEQUENCE sq_ID_INFO MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ID_INFO
    BEFORE INSERT ON INFO
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.ID := sq_ID_INFO.nextval;
END;

--  "ID_KONTR" 
CREATE SEQUENCE sq_ID_KONTR_INFO MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ID_KONTR_INFO
    BEFORE INSERT ON INFO
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.ID_KONTR := sq_ID_KONTR_INFO.nextval;
END;

--	"NIP"  

/
set serveroutput on;
declare
v_nip NUMBER(10) := 5243658352;
begin
    for i in 1..2000 loop
        INSERT INTO INFO (NIP)
        VALUES (v_nip);
        dbms_output.put_line(v_nip);
        v_nip := v_nip + 11;
    end loop;
end;
/

-- SELECT * FROM INFO;

--	"REGON"

set serveroutput on;
declare
v_reg NUMBER(9) := 365095696;
begin
    for i in 1..2000 LOOP
        UPDATE INFO
        SET REGON = v_reg
        WHERE id = i;
        dbms_output.put_line(v_reg);
        v_reg := v_reg + 5;
    end loop;
end;

--	"KRS"

declare
v_krs NUMBER(10) := 0000630893;
begin
    for i in 1..2000 LOOP
        UPDATE INFO
        SET KRS = LPAD(v_krs, 10, 0)
        WHERE id = i;
        v_krs := v_krs + 5;
    end loop;
end;


-- SKRYPTY DLA NUMER_TEL--------------------------------------------------------------------

--   "ID"
CREATE SEQUENCE sq_ID_NUMER_TEL MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ID_NUMER_TEL
    BEFORE INSERT ON NUMER_TEL
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.ID := sq_ID_NUMER_TEL.nextval;
END;


--   "ID_KONTR" 
CREATE SEQUENCE sq_ID_KONTR_NUMER_TEL MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ID_KONTR_NUMER_TEL
    BEFORE INSERT ON NUMER_TEL
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.ID_KONTR := sq_ID_KONTR_NUMER_TEL.nextval;
END;


--	 "NUMER"
declare
v_num_tel NUMBER(9) := 785243547;
begin
    for i in 1..2000 LOOP
        INSERT INTO NUMER_TEL (NUMER)
        VALUES (v_num_tel);
        v_num_tel := v_num_tel + 5;
    end loop;
end;

SELECT * FROM NUMER_TEL;

-- SKRYPTY DLA MAIL-------------------------------------------------------------------------

--   "ID"
CREATE SEQUENCE sq_ID_MAIL MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ID_MAIL
    BEFORE INSERT ON MAIL
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.ID := sq_ID_MAIL.nextval;
END;


--   "ID_KONTR" 
CREATE SEQUENCE sq_ID_KONTR_MAIL MINVALUE 1 MAXVALUE 9999999999 START WITH 1 INCREMENT BY 1;

CREATE OR REPLACE TRIGGER trg_ID_KONTR_MAIL
    BEFORE INSERT ON MAIL
    REFERENCING OLD AS OLD NEW AS NEW
    FOR EACH ROW
BEGIN
    :new.ID_KONTR := sq_ID_KONTR_MAIL.nextval;
END;

--   MAIL

CREATE TABLE mail_tmp (
    id NUMBER(10) PRIMARY KEY,
    czlon1   VARCHAR(255),
    czlon2   VARCHAR(255),
    czlon3   VARCHAR(255)
);

insert into mail_tmp (id, czlon1, czlon2, czlon3) values (1, 'Whitman', 'McVaugh', 'wmcvaugh0@columbia.edu');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (2, 'Lester', 'Pietrzak', 'lpietrzak1@friendfeed.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (3, 'Adaline', 'Defont', 'adefont2@gov.uk');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (4, 'Hana', 'Bockman', 'hbockman3@vimeo.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (5, 'Allianora', 'Durno', 'adurno4@sun.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (6, 'Maiga', 'Boldock', 'mboldock5@pcworld.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (7, 'Hi', 'Udale', 'hudale6@odnoklassniki.ru');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (8, 'Danielle', 'Goodburn', 'dgoodburn7@chronoengine.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (9, 'Traci', 'Twamley', 'ttwamley8@theatlantic.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (10, 'Craig', 'McKmurrie', 'cmckmurrie9@wufoo.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (11, 'Mikaela', 'Accomb', 'maccomba@webs.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (12, 'Krystle', 'Murch', 'kmurchb@cisco.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (13, 'Dru', 'Camelin', 'dcamelinc@timesonline.co.uk');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (14, 'Tildie', 'Burgher', 'tburgherd@salon.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (15, 'Anna-diane', 'Dackombe', 'adackombee@digg.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (16, 'Bertine', 'Vandenhoff', 'bvandenhofff@moonfruit.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (17, 'Conrado', 'Pennicard', 'cpennicardg@so-net.ne.jp');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (18, 'Daren', 'Pester', 'dpesterh@miibeian.gov.cn');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (19, 'Crystal', 'Jansky', 'cjanskyi@indiatimes.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (20, 'Allin', 'Szymanski', 'aszymanskij@soundcloud.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (21, 'Wileen', 'Whatsize', 'wwhatsizek@wunderground.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (22, 'Ertha', 'Sibbson', 'esibbsonl@constantcontact.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (23, 'Fanechka', 'Knapton', 'fknaptonm@disqus.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (24, 'Arden', 'Juanico', 'ajuanicon@answers.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (25, 'Phaidra', 'Crehan', 'pcrehano@ucoz.ru');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (26, 'Tadd', 'Morter', 'tmorterp@vistaprint.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (27, 'Rad', 'Witherow', 'rwitherowq@ca.gov');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (28, 'Townie', 'Dadd', 'tdaddr@si.edu');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (29, 'Ellery', 'Wayt', 'ewayts@printfriendly.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (30, 'Odilia', 'Cattini', 'ocattinit@weather.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (31, 'Ashli', 'Rosenshine', 'arosenshineu@goo.ne.jp');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (32, 'Nicolais', 'Ridge', 'nridgev@about.me');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (33, 'Arabelle', 'Simmig', 'asimmigw@ted.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (34, 'Emyle', 'Powland', 'epowlandx@bing.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (35, 'Jodi', 'Ricci', 'jricciy@chicagotribune.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (36, 'Orel', 'Falcus', 'ofalcusz@about.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (37, 'Emmie', 'Deem', 'edeem10@cargocollective.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (38, 'Trudie', 'Chalke', 'tchalke11@seattletimes.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (39, 'Simmonds', 'Besson', 'sbesson12@topsy.com');
insert into mail_tmp (id, czlon1, czlon2, czlon3) values (40, 'Zara', 'Casino', 'zcasino13@oakley.com');

ALTER TABLE MAIL MODIFY MAIL VARCHAR(765);

/
set serveroutput on;
declare
v_random_mail VARCHAR(765);
begin
    for i in 1..2000 loop
        select ma
        into v_random_mail
        from (select M1.czlon1||M2.czlon2||M3.czlon3 AS ma
            from mail_tmp M1, mail_tmp M2, mail_tmp M3
            order by dbms_random.value)
        where rownum = 1;
        dbms_output.put_line(v_random_mail);
        
        INSERT INTO MAIL (MAIL)
        VALUES (v_random_mail);
    end loop;
end;
/

-- SELECT * FROM MAIL;
