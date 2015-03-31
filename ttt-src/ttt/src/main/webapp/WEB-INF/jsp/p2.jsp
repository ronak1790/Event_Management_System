<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">
p.uppercase {
	text-transform: uppercase;
}

BODY {
	background-image: url(3.jpg);
	background-repeat: no-repeat;
	background-color: #cccccc;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

a:hover {
	background-color: yellow;
}

a {
	color: #FF0000;
}


/* One player and two player button */

.hostjoingame {
	-moz-box-shadow:inset 8px 29px 12px -16px #e184f3;
	-webkit-box-shadow:inset 8px 29px 12px -16px #e184f3;
	box-shadow:inset 8px 29px 12px -16px #e184f3;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #c123de), color-stop(1, #a20dbd) );
	background:-moz-linear-gradient( center top, #c123de 5%, #a20dbd 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#c123de', endColorstr='#a20dbd');
	background-color:#c123de;
	-webkit-border-top-left-radius:32px;
	-moz-border-radius-topleft:32px;
	border-top-left-radius:32px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:32px;
	-moz-border-radius-bottomright:32px;
	border-bottom-right-radius:32px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:2px;
	border:7px solid #a511c0;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:22px;
	font-weight:bold;
	font-style:normal;
	height:54px;
	line-height:54px;
	width:200px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #9b14b3;
}
.hostjoingame:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #a20dbd), color-stop(1, #c123de) );
	background:-moz-linear-gradient( center top, #a20dbd 5%, #c123de 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#a20dbd', endColorstr='#c123de');
	background-color:#a20dbd;
}.hostjoingame:active {
	position:relative;
	top:1px;
}




/* go to home */

.gotohome {
	-moz-box-shadow:inset -7px -1px 0px -14px #bee2f9;
	-webkit-box-shadow:inset -7px -1px 0px -14px #bee2f9;
	box-shadow:inset -7px -1px 0px -14px #bee2f9;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #63b8ee), color-stop(1, #468ccf) );
	background:-moz-linear-gradient( center top, #63b8ee 5%, #468ccf 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#63b8ee', endColorstr='#468ccf');
	background-color:#63b8ee;
	-webkit-border-top-left-radius:42px;
	-moz-border-radius-topleft:42px;
	border-top-left-radius:42px;
	-webkit-border-top-right-radius:42px;
	-moz-border-radius-topright:42px;
	border-top-right-radius:42px;
	-webkit-border-bottom-right-radius:42px;
	-moz-border-radius-bottomright:42px;
	border-bottom-right-radius:42px;
	-webkit-border-bottom-left-radius:42px;
	-moz-border-radius-bottomleft:42px;
	border-bottom-left-radius:42px;
	text-indent:0px;
	border:7px solid #3866a3;
	display:inline-block;
	color:#14396a;
	font-family:Arial;
	font-size:21px;
	font-weight:bold;
	font-style:normal;
	height:43px;
	line-height:43px;
	width:198px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #7cacde;
}
.gotohome:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #468ccf), color-stop(1, #63b8ee) );
	background:-moz-linear-gradient( center top, #468ccf 5%, #63b8ee 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#468ccf', endColorstr='#63b8ee');
	background-color:#468ccf;
}.gotohome:active {
	position:relative;
	top:1px;
}





/* host a game */

.hostgame {
	-moz-box-shadow:inset -6px -31px 21px -16px #caefab;
	-webkit-box-shadow:inset -6px -31px 21px -16px #caefab;
	box-shadow:inset -6px -31px 21px -16px #caefab;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #77d42a), color-stop(1, #5cb811) );
	background:-moz-linear-gradient( center top, #77d42a 5%, #5cb811 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77d42a', endColorstr='#5cb811');
	background-color:#77d42a;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:2px;
	border:7px solid #268a16;
	display:inline-block;
	color:#306108;
	font-family:Arial;
	font-size:22px;
	font-weight:bold;
	font-style:normal;
	height:80px;
	line-height:80px;
	width:200px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 0px 0px #aade7c;
}
.hostgame:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5cb811), color-stop(1, #77d42a) );
	background:-moz-linear-gradient( center top, #5cb811 5%, #77d42a 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5cb811', endColorstr='#77d42a');
	background-color:#5cb811;
}.hostgame:active {
	position:relative;
	top:1px;
}

/* join the game */


.joingame {
	-moz-box-shadow:inset -6px -31px 21px -16px #f29c93;
	-webkit-box-shadow:inset -6px -31px 21px -16px #f29c93;
	box-shadow:inset -6px -31px 21px -16px #f29c93;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fe1a00), color-stop(1, #ce0100) );
	background:-moz-linear-gradient( center top, #fe1a00 5%, #ce0100 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe1a00', endColorstr='#ce0100');
	background-color:#fe1a00;
	-webkit-border-top-left-radius:0px;
	-moz-border-radius-topleft:0px;
	border-top-left-radius:0px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:0px;
	-moz-border-radius-bottomright:0px;
	border-bottom-right-radius:0px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:2px;
	border:7px solid #d83526;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:22px;
	font-weight:bold;
	font-style:normal;
	height:80px;
	line-height:80px;
	width:200px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 0px 0px #b23e35;
}
.joingame:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ce0100), color-stop(1, #fe1a00) );
	background:-moz-linear-gradient( center top, #ce0100 5%, #fe1a00 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100', endColorstr='#fe1a00');
	background-color:#ce0100;
}.joingame:active {
	position:relative;
	top:1px;
}
</style>
</head>
<body bgcolor="#CC99FF">


	<h1 align="center" background-color="yellow";>
		<font face="Times New Roman">Welcome to</font> <font color="#DC143C"
			face="Times New Roman" font-style:italic>Tic</font> <font color="red"
			face="Times New Roman" font-style:italic>Tac</font> <font
			color="#8B0000" face="Times New Roman" font-style:italic>Toe</font> <font
			face="Times New Roman"> 2 Player Game</font>

	</h1>

	<h1 align="center">

		
		<a href="hostgame.html" class="hostgame">Host Game</a>
		<a href="joingame.html" class="joingame">Join Game</a>
	</h1>



	<h3 align="center">	
<h4 align="center">	<a  href="GameHome.html" class="gotohome" align="center">Go to home</a></h4>
	
		
	</h3>
	<br>
</body>
</html>