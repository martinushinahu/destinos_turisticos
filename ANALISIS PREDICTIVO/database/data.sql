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

/*verificamos si hay duplicados en la tabla*/
SELECT xid, COUNT(*) as cnt
FROM lugares_turisticos
GROUP BY xid
HAVING cnt > 1;

/*despues de intentificar los duplicados 
los eliminamos*/
DELETE FROM lugares_turisticos
WHERE xid IN (
    SELECT xid
    FROM (
        SELECT xid, ROW_NUMBER() OVER (PARTITION BY xid ORDER BY id) as rn
        FROM lugares_turisticos
    ) t
    WHERE rn > 1
);


select * from lugares_turisticos;





/*vamos a insertar los datos nustra tabla*/
LOAD DATA LOCAL INFILE 'lugares_turisticos.csv' 
INTO TABLE lugares_turisticos 
FIELDS TERMINATED BY ',' ENCLOSED BY '"' 
LINES TERMINATED BY '\n' IGNORE 1 ROWS;





select * from lugares_turisticos;



