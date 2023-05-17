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




ALTER TABLE lugares_turisticos RENAME COLUMN imagen_url TO maps_url;

SELECT maps_url
FROM lugares_turisticos;

/*modificamos la columna para aumentar la cantidad de caracteres*/
ALTER TABLE lugares_turisticos MODIFY maps_url VARCHAR(500);


/*en el DATAFRAME de python de reemplazó los valores nulos por -1
vamos a corregir esos valores, pero primero vamos a identificar esos valores*/
SELECT name, latitude, longitude FROM lugares_turisticos WHERE country = 'Perú' AND name = '-1';
SELECT name, latitude, longitude FROM lugares_turisticos WHERE country = 'Perú';

SELECT xid, name, country, latitude, longitude
FROM lugares_turisticos
WHERE name = -1 OR longitude = -1 OR latitude = -1;
/*resultado Perú con 46 resultados con valores -1*/

UPDATE lugares_turisticos
SET name = CASE
    WHEN latitude = -14.8689 AND longitude = -75.0001 THEN 'Centro Energético de Orcono Nazca'
    WHEN latitude = -14.8675 AND longitude = -74.9946 THEN 'Esferico Orcona'
    WHEN latitude = -14.8211 AND longitude = -75.0051 THEN 'Líneas de Nazca - Astronauta'
    WHEN latitude = -14.8154 AND longitude = -75.0046 THEN 'Santuario Ocungalla - Nazca'
    WHEN latitude = -14.8085 AND longitude = -75.0404 THEN 'Santuario Ocungalla Pat.2 - Nazca'
    WHEN latitude = -14.807 AND longitude = -75.0646 THEN 'Santuario Ocungalla Pat.3 - Nazca'
    WHEN latitude = -14.8044 AND longitude = -75.0612 THEN 'Santuario Ocungalla Pat.4 - Nazca'
    WHEN latitude = -14.7932 AND longitude = -75.0759 THEN 'Santuario Ocungalla Pat.5 - Nazca'
    WHEN latitude = -14.7868 AND longitude = -75.0157 THEN 'Santuario Ocungalla Pat.6 - Nazca'
    WHEN latitude = -14.7852 AND longitude = -75.07 THEN 'Santuario Ocungalla Pat.7 - Nazca'
    WHEN latitude = -14.7505 AND longitude = -75.0695 THEN 'Santuario Ocungalla Pat.8 - Nazca'
    WHEN latitude = -14.7125 AND longitude = -75.1274 THEN 'Líneas de Nazca - Mono'
    WHEN latitude = -14.7054 AND longitude = -75.1283 THEN 'Líneas de Nazca - Cóndor'
    WHEN latitude = -14.6988 AND longitude = -75.1434 THEN 'Mirador de las líneas de Nazca'
    WHEN latitude = -14.6955 AND longitude = -75.124 THEN 'Líneas de Nazca Part.1 - Espiral'
    WHEN latitude = -14.695 AND longitude = -75.1434 THEN 'Líneas de Nazca Part.2'
    WHEN latitude = -14.6946 AND longitude = -75.1447 THEN 'Líneas de Nazca Part.3'
    WHEN latitude = -14.6943 AND longitude = -75.1041 THEN 'Líneas de Nazca Part.4'
    WHEN latitude = -14.6941 AND longitude = -75.1288 THEN 'Líneas de Nazca Part.5'
    WHEN latitude = -14.6928 AND longitude = -75.1147 THEN 'Líneas de Nazca Part.6'
    WHEN latitude = -14.6925 AND longitude = -75.1222 THEN 'Líneas de Nazca Part.7'
    WHEN latitude = -14.692 AND longitude = -75.1451 THEN 'Líneas de Nazca Part.8'
    WHEN latitude = -14.6919 AND longitude = -75.1476 THEN 'Líneas de Nazca Part.9'
    WHEN latitude = -14.6905 AND longitude = -75.1228 THEN 'Líneas de Nazca Part.10'
    WHEN latitude = -14.6903 AND longitude = -75.1212 THEN  'Líneas de Nazca Part.11'
    WHEN latitude = -14.6902 AND longitude = -75.1228 THEN 'Líneas de Nazca Part.12'
    WHEN latitude = -14.69 AND longitude = -75.1223 THEN 'Líneas de Nazca Part.13'
    WHEN latitude = -14.6898 AND longitude = -75.1223 THEN 'Líneas de Nazca Part.14'
    WHEN latitude = -14.6883 AND longitude = -75.1053 THEN 'Líneas de Nazca Part.15'
    WHEN latitude = -14.6858 AND longitude = -75.1444 THEN 'Dunas Nazca'
    WHEN latitude = -14.68 AND longitude = -75.1011 THEN 'Dunas Nazca part.2'
    WHEN latitude = -14.6788 AND longitude = -75.0927 THEN 'Dunas Nazca part.3'
    WHEN latitude = -14.6784 AND longitude = -75.0928 THEN 'Dunas Nazca part.4'
    WHEN latitude = -14.6779 AND longitude = -75.087 THEN 'Dunas Nazca part.5'
    WHEN latitude = -14.6776 AND longitude = -75.092 THEN 'Dunas Nazca part.6'
    WHEN latitude = -14.6764 AND longitude = -75.0926 THEN 'Dunas Nazca part.7'
    WHEN latitude = -14.5286 AND longitude = -75.1654 THEN 'Líneas de Carapo - Palpa'
    WHEN latitude = -14.5284 AND longitude = -75.1653 THEN 'Líneas de Carapo - Palpa Part.2'
    WHEN latitude = -14.5284 AND longitude = -75.1662 THEN 'Líneas de Carapo - Palpa Part.3'
    WHEN latitude = -14.5279 AND longitude = -75.1662 THEN 'Líneas de Carapo - Palpa Part.4'
    WHEN latitude = -14.5278 AND longitude = -75.165 THEN 'Líneas de Carapo - Palpa Part.5'
    WHEN latitude = -14.5267 AND longitude = -75.1648 THEN 'Líneas de Carapo - Palpa Part.6'
    WHEN latitude = -0.219438 AND longitude = -78.512 THEN 'Plaza Grande con Edificios Emblemáticos'
    WHEN latitude = 17.5485 AND longitude = 103.358 THEN 'Khm Sa-At'
    WHEN latitude = 41.9039 AND longitude = 44.0959 THEN 'Khidistavi-Ateni-Boshuri'
    WHEN latitude = 47.372 AND longitude = 8.54494 THEN 'Spiegelgasse'
    ELSE name
END;

DELETE FROM lugares_turisticos WHERE name = '-1';



/*Cuando se hizo la inserción de los datos desde el DataFrame de Python
alguno paises  se ingresaron con su nombre en su indioma en la columna country,
 actualizar esos nombres de los paises a español*/

UPDATE lugares_turisticos
SET country = REPLACE(country, 'ประเทศไทย', 'Tailandia')
WHERE country = 'ประเทศไทย';

UPDATE lugares_turisticos
SET country = REPLACE(country, 'Geogia', 'Georgia')
WHERE country = 'Geogia';

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


/*Actualizamos la Primera Ronda de Países*/
UPDATE lugares_turisticos
SET country =
    CASE
        WHEN country = '日本' THEN 'Japón'
        WHEN country = 'Slovenija' THEN '	'
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
    
    /*Actualizamos la 2da Ronde de Países
    porque no me fijé en todos los países que faltaban*/
    
    UPDATE lugares_turisticos
SET country =
    CASE
        WHEN country = 'Việt Nam' THEN 'Vietnam'
        WHEN country = 'България' THEN 'Bulgaria'
        WHEN country = 'Қазақстан' THEN "Kazajstán"
        WHEN country = 'Монгол улс ᠮᠤᠩᠭᠤᠯ ᠤᠯᠤᠰ' THEN 'Mongolia'
        WHEN country = 'ایران' THEN 'Irán'
        WHEN country = 'پاکستان' THEN 'Pakistán'
        WHEN country = 'سوريا' THEN 'Siria'
        WHEN country = 'ປະເທດລາວ' THEN 'Laos'
        WHEN country = '조선민주주의인민공화국' THEN 'Corea del Norte'
               ELSE country
    END;
    
    /*Verificamos nuestro países en orden alfabético*/
 SELECT DISTINCT country FROM lugares_turisticos ORDER BY country ASC;



