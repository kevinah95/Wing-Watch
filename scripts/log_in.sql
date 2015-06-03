DELIMITER //
CREATE DEFINER=`WingWatch`@`localhost` FUNCTION `log_in`(pNick TINYTEXT, pContrasenia TINYTEXT)
  RETURNS VARCHAR(40)
  LANGUAGE SQL
BEGIN
  DECLARE username VARCHAR(40) ;
    SELECT usuario.NICKNAME
      INTO username
      FROM wingwatch.usuario
     WHERE usuario.NICKNAME = pNick AND usuario.PASSWORD = pContrasenia;
    RETURN COALESCE(username, 'Not Found');
END //