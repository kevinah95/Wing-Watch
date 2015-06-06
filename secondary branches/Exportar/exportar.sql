(SELECT 'ID','TIPO','USUARIO_CREACION')
UNION 
(SELECT tipo_usuario.ID,tipo_usuario.TIPO,tipo_usuario.USUARIO_CREACION
FROM tipo_usuario
INTO OUTFILE 'C:/tmp/tipo_usuario.csv'
FIELDS ENCLOSED BY '' TERMINATED BY ';' ESCAPED BY ''
LINES TERMINATED BY '\r\n');

-- http://www.mysqltutorial.org/mysql-export-table-to-csv/