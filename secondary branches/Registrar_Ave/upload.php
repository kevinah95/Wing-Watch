<?php
	$objeto=file_get_contents('php://input');
	echo '<img src="'.$objeto.'" />';
	
?>