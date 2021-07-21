USE SWABHAV;
CREATE TABLE REGIONS ( region_id int , region_name VARCHAR(25));

ALTER TABLE REGIONS ADD CONSTRAINT reg_id_pk PRIMARY KEY (region_id);

INSERT INTO regions VALUES( 1, 'Europe');
INSERT INTO regions VALUES( 2, 'Americas');
INSERT INTO regions VALUES( 3, 'Asia');
INSERT INTO regions VALUES( 4, 'Middle East and Africa');

SELECT * FROM REGIONS;