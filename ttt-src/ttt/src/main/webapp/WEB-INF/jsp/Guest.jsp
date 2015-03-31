<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<style type="text/css">
BODY {
	background-image: url(3.jpg);
	background-repeat: no-repeat;
	background-color: #cccccc;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

p.uppercase {
	text-transform: uppercase;
}

td {
background-color: #FFFF33;
	width: 50px;
	height: 50px;
}

div {
	text-align: center;
	font-size: 30px;
	height: 50px;
	width: 50px
}

p {
	color: #330000;
}

a:hover {
	background-color: yellow;
}




/* Logout */



.logout {
	-moz-box-shadow:inset 0px 1px 0px 0px #f29c93;
	-webkit-box-shadow:inset 0px 1px 0px 0px #f29c93;
	box-shadow:inset 0px 1px 0px 0px #f29c93;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #fe1a00), color-stop(1, #ce0100) );
	background:-moz-linear-gradient( center top, #fe1a00 5%, #ce0100 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#fe1a00', endColorstr='#ce0100');
	background-color:#fe1a00;
	-webkit-border-top-left-radius:37px;
	-moz-border-radius-topleft:37px;
	border-top-left-radius:37px;
	-webkit-border-top-right-radius:0px;
	-moz-border-radius-topright:0px;
	border-top-right-radius:0px;
	-webkit-border-bottom-right-radius:37px;
	-moz-border-radius-bottomright:37px;
	border-bottom-right-radius:37px;
	-webkit-border-bottom-left-radius:0px;
	-moz-border-radius-bottomleft:0px;
	border-bottom-left-radius:0px;
	text-indent:0;
	border:1px solid #d83526;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:65px;
	line-height:65px;
	width:131px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #b23e35;
}
.logout:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ce0100), color-stop(1, #fe1a00) );
	background:-moz-linear-gradient( center top, #ce0100 5%, #fe1a00 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ce0100', endColorstr='#fe1a00');
	background-color:#ce0100;
}.logout:active {
	position:relative;
	top:1px;
}







/* navigation */
.navigation {
	-moz-box-shadow:inset -7px -11px 0px -14px #caefab;
	-webkit-box-shadow:inset -7px -11px 0px -14px #caefab;
	box-shadow:inset -7px -11px 0px -14px #caefab;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #77d42a), color-stop(1, #5cb811) );
	background:-moz-linear-gradient( center top, #77d42a 5%, #5cb811 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#77d42a', endColorstr='#5cb811');
	background-color:#77d42a;
	-webkit-border-top-left-radius:16px;
	-moz-border-radius-topleft:16px;
	border-top-left-radius:16px;
	-webkit-border-top-right-radius:16px;
	-moz-border-radius-topright:16px;
	border-top-right-radius:16px;
	-webkit-border-bottom-right-radius:16px;
	-moz-border-radius-bottomright:16px;
	border-bottom-right-radius:16px;
	-webkit-border-bottom-left-radius:16px;
	-moz-border-radius-bottomleft:16px;
	border-bottom-left-radius:16px;
	text-indent:0px;
	border:7px solid #268a16;
	display:inline-block;
	color:#306108;
	font-family:Arial;
	font-size:19px;
	font-weight:bold;
	font-style:normal;
	height:43px;
	line-height:43px;
	width:198px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #aade7c;
}
.navigation:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #5cb811), color-stop(1, #77d42a) );
	background:-moz-linear-gradient( center top, #5cb811 5%, #77d42a 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5cb811', endColorstr='#77d42a');
	background-color:#5cb811;
}.navigation:active {
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
p{
background-color:white;}
h1{
background-color:#CCCCFF;}
</style>



</head>
<body>
<h1 align="center">Welcome To
		<font color="#DC143C" face="Times New Roman" font-style:italic>Tic</font>
		<font color="red" face="Times New Roman" font-style:italic>Tac</font>
		<font color="#8B0000" face="Times New Roman" font-style:italic>Toe</font>
		<font face="Times New Roman">Guest Game</font>
	</h1>

		
	<table border='1' cellpadding="10" cellspacing="0" align="center">
		<tr>
			<td><c:choose>
				
					<c:when test="${player.contains('1')}">
						<div style="color: blue">X</div>  
					</c:when>
						<c:when test="${computer.contains('1')}">
						<div style="color: red">O</div>
					</c:when>
					<c:otherwise>
						<a href="Guest2.html?id=1">_</a>
					</c:otherwise>
				</c:choose></td>
			<td><c:choose>
					
					<c:when test="${player.contains('2')}">
						<div style="color: blue">X</div>
					</c:when>
					<c:when test="${computer.contains('2')}">
						<div style="color: red">O</div>
					</c:when>
					<c:otherwise>
						<a href="Guest2.html?id=2">_</a>
					</c:otherwise>
				</c:choose></td>
			<td><c:choose>
				
					<c:when test="${player.contains('3')}">
						<div style="color: blue">X</div>
					</c:when>
						<c:when test="${computer.contains('3')}">
						<div style="color: red">O</div>
					</c:when>
					<c:otherwise>
						<a href="Guest2.html?id=3">_</a>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td><c:choose>
					
					<c:when test="${player.contains('4')}">
						<div style="color: blue">X</div>
					</c:when>
					<c:when test="${computer.contains('4')}">
						<div style="color: red">O</div>
					</c:when>
					<c:otherwise>
						<a href="Guest2.html?id=4">_</a>
					</c:otherwise>
				</c:choose></td>
			<td><c:choose>
					<c:when test="${player.contains('5')}">
						<div style="color: blue">X</div>
					</c:when>
					<c:when test="${computer.contains('5')}">
						<div style="color: red">O</div>
					</c:when>
					
					<c:otherwise>
						<a href="Guest2.html?id=5">_</a>
					</c:otherwise>
				</c:choose></td>
			<td><c:choose>
					<c:when test="${player.contains('6')}">
						<div style="color: blue">X</div>
					</c:when>
					<c:when test="${computer.contains('6')}">
						<div style="color: red">O</div>
					</c:when>
					
					<c:otherwise>
						<a href="Guest2.html?id=6">_</a>
					</c:otherwise>
				</c:choose></td>
		</tr>
		<tr>
			<td><c:choose>
					<c:when test="${player.contains('7')}">
						<div style="color: blue">X</div>
					</c:when>
					<c:when test="${computer.contains('7')}">
						<div style="color: red">O</div>
					</c:when>
					<c:otherwise>
						<a href="Guest2.html?id=7">_</a>
					</c:otherwise>
				</c:choose></td>
			<td><c:choose>
					<c:when test="${player.contains('8')}">
						<div style="color: blue">X</div>
					</c:when>
					<c:when test="${computer.contains('8')}">
						<div style="color: red">O</div>
					</c:when>
					<c:otherwise>
						<a href="Guest2.html?id=8">_</a>
					</c:otherwise>
				</c:choose></td>
			<td><c:choose>
					<c:when test="${player.contains('9')}">
						<div style="color: blue">X</div>
					</c:when>
					<c:when test="${computer.contains('9')}">
						<div style="color: red">O</div>
					</c:when>
					
					<c:otherwise>
						<a href="Guest2.html?id=9">_</a>
					</c:otherwise>
				</c:choose></td>
		</tr>
	</table>

	<br>
	<h2 align="center">
	<p>${message}</p><br>
	<a  href="login.html" class="gotohome">Go to Login</a>
	</h2>
			
	
</body>
</html>