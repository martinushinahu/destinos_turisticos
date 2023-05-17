CREATE DATABASE destinos_turisticos;
USE destinos_turisticos;

CREATE TABLE lugares_turisticos (
    xid VARCHAR(255) NOT NULL,
    name VARCHAR(255) NOT NULL,
    rate FLOAT,
    osm VARCHAR(255),
    wikidata VARCHAR(255),
    kinds VARCHAR(255),
    longitude FLOAT,
    latitude FLOAT,
    PRIMARY KEY (xid)
);

SELECT * FROM lugares_turisticos;

SELECT NAME, COUNTRY
FROM lugares_turisticos;


/*Cuando se hizo la inserción de los datos desde el DataFrame de Python
alguno paises  se ingresaron con su nombre en su indioma en la columna country,
 actualizar esos nombres de los paises a español*/
SELECT * FROM lugares_turisticos;

SELECT COUNTRY FROM lugares_turisticos;

UPDATE lugares_turisticos
SET country = REPLACE(country, 'ประเทศไทย', 'Tailandia')
WHERE country = 'ประเทศไทย';

UPDATE lugares_turisticos
SET country = REPLACE(country, 'საქართველო', 'Geogia')
WHERE country = 'საქართველო';

UPDATE lugares_turisticos
SET country = REPLACE(country, 'Österreich', 'Austria')
WHERE country = 'Österreich';


UPDATE lugares_turisticos
SET country = REPLACE(country, 'Türkiye', 'Turquía')
WHERE country = 'Türkiye';

UPDATE lugares_turisticos
SET country = REPLACE(country, '中国', 'China')
WHERE country = '中国';

UPDATE lugares_turisticos
SET country = REPLACE(country, 'Հայաստան', 'Armenia')
WHERE country = 'Հայաստան';

UPDATE lugares_turisticos
SET country = REPLACE(country, '대한민국', 'Corea del Sur')
WHERE country = '대한민국';
/*xid,name,rate,rate,osm,wikidata,kinds,loguitude,latitude,country,image,description*/


UPDATE lugares_turisticos
SET country =
    CASE
        WHEN country = '日本' THEN 'Japón'
        WHEN country = 'Slovenija' THEN 'Eslovenia'
        WHEN country LIKE '%Deutschland%' OR country LIKE '%Schweiz%' OR country LIKE '%Suisse%' OR country LIKE '%Svizzera%' OR country LIKE '%Svizra%' THEN 'Alemania'
        WHEN country = 'Ελλάς' THEN 'Grecia'
        WHEN country = 'Bosna i Hercegovina / Босна и Херцеговина' THEN 'Bosnia y Herzegovina'
        WHEN country = 'تونس' THEN 'Túnez'
        WHEN country = 'ព្រះរាជាណាចក្រ​កម្ពុជា' THEN 'Camboya'
        WHEN country = 'Россия' THEN 'Rusia'
        WHEN country = '臺灣' THEN 'Taiwán'
        WHEN country = 'Lëtzebuerg' THEN 'Luxemburgo'
        WHEN country = 'العراق' THEN 'Irak'
        WHEN country = 'Hrvatska' THEN 'Croacia'
        WHEN country = 'বাংলাদেশ' THEN 'Bangladesh'
        WHEN country = 'Nederland' THEN 'Países Bajos'
        WHEN country = 'မြန်မာ' THEN 'Myanmar'
        WHEN country = 'Éire / Ireland' THEN 'Irlanda'
        ELSE country
    END;
