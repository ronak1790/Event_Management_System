<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%><!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register New User</title>


<style type="text/css">
BODY {
	/* background-image: url(http://wallpaperswiki.com/wallpapers/2012/12/Color-Rays-Light-Line-Colors-Beams-Light-1080x1920.jpg); */
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
}
h1{
background-color:#FF6600;
border: 3px solid black;}
a:hover
{
background-color:yellow;
}


input{
  background:#FFFF00;
  filter:alpha(opacity=90);
  opacity:0.9;
  color: black;
  font-family: Monaco, Courier, MonoSpace;
  -moz-border-radius: 15px;
  -webkit-border-radius: 15px;
  border-radius: 12px;
  font-size: 18px;
  padding: 5px 5px 5px 10px;
  margin:0 auto;
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
	width:100px;
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
		<font  face="Times New Roman" font-style:italic>Register</font>
	</h1>
	<form:form modelAttribute="gameuser">
		<table border="0" bgcolor="" align="center">

			<tr>
				<td>Username:</td>
				<td><form:input path="username" /></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><form:input type="password" path="password" /> <br /></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><form:input path="email" /> <br /></td>
			</tr>
			<tr>
				<td><input class="oneplayer" type="submit" name="register"
					value="Register" /></td>
				<td align="right"> <a href="login.html"
					style="color: blue">Go Back.</a></td>
			</tr>

		</table>

	</form:form>
	<!-- <h2 align="center">
		Go to <a href="login.html" style="color: blue">Login page.</a>
	</h2> -->
</html>