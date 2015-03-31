<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Game History</title>

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

h1{
background-color:#FF6633;
border: 3px solid black}
h3{
background-color:#3366FF;
border: 3px solid black}

a:hover
{
background-color:yellow;
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

	<h1 align="center">Welcome to Game History</h1>

	<table border="1" align="center">
		<tr>
			<th colspan="2" bgcolor=99FF00>Summary</th>
			
		</tr>

		<tr bgcolor=99CCFF >
			<td>Number of completed games:</td>
			<td>${allcompletedgames}</td>
		</tr>

		<tr bgcolor=99FFFF>
			<td>Number of 1-player games completed.</td>
			<td>${all1player}</td>
		</tr>

		<tr bgcolor=99CCFF>
			<td>Number of 2-player games completed</td>
			<td>${all2player}</td>
		</tr>

		<tr bgcolor=99FFFF>
			<td>The win rate against AI.</td>
			<td>${allWinRateAgainstAI}%</td>
		</tr>

		<tr bgcolor=99CCFF>
			<td>The win rate against human players.</td>
			<td>${getplayerWinRateAgainstHuman}%</td>
		</tr>

		

	</table>

	<h2 align="center"><a  href="ttt.html" class="gotohome" align="center">Go to home</a></h2>


</br>
</br>

<h1 align="center">The list of games played this month.</h1>
	<table border = "1" align="center">
		<tr bgcolor="#FFFF00">
			<th>Sr</th>
			<th>Start Time</th>
			<th>End Time</th>
			<th>Duration(MiliSeconds)</th>
			<th>Opponent Name</th>
			<th>Result</th>
		</tr>
		<c:forEach items="${mm}" var="m" varStatus="vs">
			<tr bgcolor="FFFFCC">
				<td>${vs.index+1}</td>
				<td>${m.getStartTime()}</td>
				<td>${m.getEndTime()}</td>
				<td>${m.getDuration()}</td>
				<td>${m.getOpponent()}</td>
				<td>${m.getResult()}</td>
			</tr>
		</c:forEach>
	</table>
	
<h4 align="center">	<a  href="ttt.html" class="gotohome" align="center">Go to home</a></h4>






</body>
</html>