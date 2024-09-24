<?php

	include 'connect.php';

	echo '<link rel="icon" type="image/x-icon" href="layout/css/images/logo/Logo Files/For Web/png/web.png">';

	$tpl 	= 'includes/templates/'; 
	$lang 	= 'includes/languages/'; 
	$func	= 'includes/functions/'; 
	$css 	= 'layout/css/'; 
	$js 	= 'layout/js/'; 

	include $func . 'functions.php';
	include $lang . 'english.php';
	include $tpl . 'header.php';

	if (!isset($noNavbar)) { include $tpl . 'navbar.php'; }
	

	