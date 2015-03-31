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

h1 {
	background-color: #0066FF;
	border: 3px solid black
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


</style>
</head>
<body>
	<h1 align="center">Welcome to Saved Games</h1>
	<table border="1" align="center">
		<tr>
			<th colspan="2" bgcolor=99FF00>List of Saved Games</th>
		</tr>


		<c:forEach items="${save}" var="i">
			<tr bgcolor="FFFFCC">
				<td><a href="displaySaveGames.html?i=${i.getGame_id()}">${i.getSave_time()}</a></br>
				</td>
			</tr>
		</c:forEach>

	</table>

	<h3 align="center">
	<a  href="ttt.html" class="gotohome">Go to home</a>
	</h3>

</body>
</html>