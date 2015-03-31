<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>



<style type="text/css">
.errorblock {
	color: #ff0000;
	background-color: #ffEEEE;
	border: 3px solid #ff0000;
	padding: 8px;
	margin: 16px;
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

TD {
	font-size: 15pt;
	face
	="Times
	New
	Roman"
}

input {
	background: #00CCFF;
	filter: alpha(opacity = 90);
	opacity: 0.9;
	color: black;
	font-family: Monaco, Courier, MonoSpace;
	-moz-border-radius: 15px;
	-webkit-border-radius: 15px;
	border-radius: 12px;
	font-size: 18px;
	padding: 5px 5px 5px 10px;
	margin: 0 auto;
}

/* Go to login link */
.joingame {
	-moz-box-shadow: inset -6px -31px 21px -16px #cae3fc;
	-webkit-box-shadow: inset -6px -31px 21px -16px #cae3fc;
	box-shadow: inset -6px -31px 21px -16px #cae3fc;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #79bbff
		), color-stop(1, #4197ee));
	background: -moz-linear-gradient(center top, #79bbff 5%, #4197ee 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#79bbff',
		endColorstr='#4197ee');
	background-color: #79bbff;
	-webkit-border-top-left-radius: 37px;
	-moz-border-radius-topleft: 37px;
	border-top-left-radius: 37px;
	-webkit-border-top-right-radius: 0px;
	-moz-border-radius-topright: 0px;
	border-top-right-radius: 0px;
	-webkit-border-bottom-right-radius: 37px;
	-moz-border-radius-bottomright: 37px;
	border-bottom-right-radius: 37px;
	-webkit-border-bottom-left-radius: 0px;
	-moz-border-radius-bottomleft: 0px;
	border-bottom-left-radius: 0px;
	text-indent: 2px;
	border: 7px solid #469df5;
	display: inline-block;
	color: #ffffff;
	font-family: Arial;
	font-size: 22px;
	font-weight: bold;
	font-style: normal;
	height: 80px;
	line-height: 80px;
	width: 400px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 0px 0px #287ace;
}

.joingame:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #4197ee
		), color-stop(1, #79bbff));
	background: -moz-linear-gradient(center top, #4197ee 5%, #79bbff 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#4197ee',
		endColorstr='#79bbff');
	background-color: #4197ee;
}

.joingame:active {
	position: relative;
	top: 1px;
}

.classname {
	-moz-box-shadow: inset 0px 1px 0px 2px #bee2f9;
	-webkit-box-shadow: inset 0px 1px 0px 2px #bee2f9;
	box-shadow: inset 0px 1px 0px 2px #bee2f9;
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #63b8ee
		), color-stop(1, #468ccf));
	background: -moz-linear-gradient(center top, #63b8ee 5%, #468ccf 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#63b8ee',
		endColorstr='#468ccf');
	background-color: #63b8ee;
	-webkit-border-top-left-radius: 0px;
	-moz-border-radius-topleft: 0px;
	border-top-left-radius: 0px;
	-webkit-border-top-right-radius: 0px;
	-moz-border-radius-topright: 0px;
	border-top-right-radius: 0px;
	-webkit-border-bottom-right-radius: 0px;
	-moz-border-radius-bottomright: 0px;
	border-bottom-right-radius: 0px;
	-webkit-border-bottom-left-radius: 0px;
	-moz-border-radius-bottomleft: 0px;
	border-bottom-left-radius: 0px;
	text-indent: 0px;
	border: 1px solid #000066;
	display: inline-block;
	color: #14396a;
	font-family: Arial;
	font-size: 15px;
	font-weight: bold;
	font-style: normal;
	height: 50px;
	line-height: 50px;
	width: 86px;
	text-decoration: none;
	text-align: center;
	text-shadow: 1px 1px 0px #7cacde;
}

.classname:hover {
	background: -webkit-gradient(linear, left top, left bottom, color-stop(0.05, #468ccf
		), color-stop(1, #63b8ee));
	background: -moz-linear-gradient(center top, #468ccf 5%, #63b8ee 100%);
	filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#468ccf',
		endColorstr='#63b8ee');
	background-color: #468ccf;
}

.classname:active {
	position: relative;
	top: 1px;
}

h1 {
	background-color: #3366FF;
	border: 3px solid black;
	text-decoration: blink;
}

a:hover {
	background-color: yellow;
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




.oneplayer {
	-moz-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	-webkit-box-shadow:inset 0px 1px 0px 0px #97c4fe;
	box-shadow:inset 0px 1px 0px 0px #97c4fe;
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #3d94f6), color-stop(1, #1e62d0) );
	background:-moz-linear-gradient( center top, #3d94f6 5%, #1e62d0 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#3d94f6', endColorstr='#1e62d0');
	background-color:#3d94f6;
	-webkit-border-top-left-radius:6px;
	-moz-border-radius-topleft:6px;
	border-top-left-radius:6px;
	-webkit-border-top-right-radius:6px;
	-moz-border-radius-topright:6px;
	border-top-right-radius:6px;
	-webkit-border-bottom-right-radius:6px;
	-moz-border-radius-bottomright:6px;
	border-bottom-right-radius:6px;
	-webkit-border-bottom-left-radius:6px;
	-moz-border-radius-bottomleft:6px;
	border-bottom-left-radius:6px;
	text-indent:0;
	border:1px solid #337fed;
	display:inline-block;
	color:#ffffff;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	font-style:normal;
	height:50px;
	line-height:50px;
	width:85px;
	text-decoration:none;
	text-align:center;
	text-shadow:1px 1px 0px #1570cd;
}
.oneplayer:hover {
	background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #1e62d0), color-stop(1, #3d94f6) );
	background:-moz-linear-gradient( center top, #1e62d0 5%, #3d94f6 100% );
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#1e62d0', endColorstr='#3d94f6');
	background-color:#1e62d0;
}.oneplayer:active {
	position:relative;
	top:1px;
}


</style>

</head>
<body>


	<h1 align="center">
		<font face="Times New Roman">Login</font>
	</h1>


	<c:if test="${not empty error}">
		<div class="errorblock">
			${sessionScope["SPRING_SECURITY_LAST_EXCEPTION"].message}</div>
	</c:if>

	<%-- 	<form:form modelAttribute="gameuser">
	 --%>
	<form name='f' action="<c:url value='j_spring_security_check' />"
		method='POST'>


		<table border="0" bgcolor="" align="center">
			<tr>
				<td>Username:</td>
				<td><input type='text' name='j_username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='j_password' /></td>
			</tr>
			<tr>
				<td><input type="submit" class="oneplayer" name="login"
					value="Login" /></td>
				<td align="right"><a href="reg.html" style="color: blue">New
						User?</a></td>
			</tr>
		</table>

	</form>


	</h1>

	<h2 align="center">


		<a href="Guest.html"class="gotohome">Play as a Guest</a>
	</h2>






</body>
</html>