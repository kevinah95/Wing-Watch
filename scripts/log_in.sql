DELIMITER //
CREATE DEFINER=`WingWatch`@`localhost` FUNCTION `log_in`(pNick TINYTEXT, pHash TINYTEXT)
  RETURNS VARCHAR(40)
  LANGUAGE SQL
BEGIN
  DECLARE username VARCHAR(40) ;
    SELECT usuario.NICKNAME
      INTO username
      FROM wingwatch.usuario
     WHERE usuario.NICKNAME = pNick AND usuario.HASH = pHash;
    RETURN COALESCE(username, 'Not Found');
END //