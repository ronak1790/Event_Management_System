<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Host Game</title>
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		$.ajax({

			url : "hostgame.json",
			success : function(data) {

				$("#hostlist").empty();
				data.usernames.forEach(function(username) {
					$("#hostlist").append("<li>" + username + "</li>");

					//window.location.replace("http://localhost:8080/ttt/player2.html");
				});
			},
		});
		update();
	});

	$(function() {
		$.ajax({

			url : "joingame.json",
			success : function(data) {

				$("#joinedlist").empty();
				data.usernames.forEach(function(username) {
					$("#joinedlist").append("<li>" + username + "</li>");
				});
			},
		});
		joinupdate();
	});

	function update() {
		$.ajax({
			url : "hostgame.deferred.json",
			success : function(data) {

				$("#hostlist").empty();

				data.forEach(function(username) {
					//window.location.replace("http://localhost:8080/ttt/player2.html");

					$("#hostlist").append("<li>" + username + "</li>");

				});
				update();
			},
		});
	}

	function joinupdate() {
		$.ajax({
			url : "joingame.deferred.json",
			success : function(data) {

				$("#joinedlist").empty();
				data.forEach(function(username) {

					$("#joinedlist").append("<li>" + username + "</li>");
					window.location
							.replace("http://localhost:8080/ttt/player2.html");
				});

				joinupdate();
			},
		});
	}
</script>


<style>
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

ul {
	text-align: center
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
	<h1 align="center">
		<font color="#DC143C" face="Times New Roman" font-style:italic>Tic</font>
		<font color="red" face="Times New Roman" font-style:italic>Tac</font>
		<font color="#8B0000" face="Times New Roman" font-style:italic>Toe</font>
		<font face="Times New Roman">2 Player Game</font>
	</h1>


	<h3 align="center">Waiting for other player to join Game</h3>
	<ul align="center" id="hostlist"></ul>
	<ul align="center" id="joinedlist"></ul>



	<h3 align="center">
		<a href="GameHome.html" style="color: blue">Go to home</a>
	</h3>
	
		<h3 align="center">	
<h4 align="center">	<a  href="GameHome.html" class="gotohome" align="center">Go to home</a></h4>
	
		
	</h3>
	
	
</body>
</html>
