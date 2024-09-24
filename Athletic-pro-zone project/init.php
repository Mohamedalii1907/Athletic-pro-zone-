<?php

	ini_set('display_errors', 'On');
	error_reporting(E_ALL);

	include 'admin/connect.php';

	echo '<link rel="icon" type="image/x-icon" href="admin/layout/css/images/logo/Logo Files/For Web/png/web.png">';

	$sessionUser = '';
	
	if (isset($_SESSION['user'])) {
		$sessionUser = $_SESSION['user'];
	}

	$tpl 	= 'includes/templates/'; 
	$func	= 'includes/functions/'; 
	$css 	= 'layout/css/'; 
	$js 	= 'layout/js/'; 

	include $func . 'functions.php';
	include $tpl . 'header.php';
	