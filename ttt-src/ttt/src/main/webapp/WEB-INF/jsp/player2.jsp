<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

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

td {
background-color:yellow;
	height: 50px;
	width: 50px;
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
<script type="text/javascript" src="js/jquery-2.1.1.min.js"></script>
<script type="text/javascript">
$(function() {
		$.ajax({

			url : "multigame.json",
			cache: false,
			success : function(data) {

				var uname="${user}";
				
				 for(var i=0;i<data.games.length;i++)
					 {
					 
					 $('#gb').empty();
					   var game=data.games[i].gamename.split('-');
					
					   var host=game[0];
					   var join=game[1];
					   var hl=data.games[i].player1;
					   var jl=data.games[i].player2;
					   
					  
					   if(host===uname)
						   {
						   for(var j=1;j<=9;j++)
				    	   {
							   var jid ;
				    	   	if(j === 1)
				    	   		{
				    	   			$('#gb').append("<tr id="+j+">");
				    	   			jid=j;
				    	   		}
				    	   	else if(j === 4)
			    	   		{
			    	   			$('#gb').append("<tr id="+j+">");
			    	   			jid=j;
			    	   		}
				    	   	else if (j===7)
				    	   	{
			    	   			$('#gb').append("<tr id="+j+">");
			    	   			jid=j;
			    	   		}
				    	   	
				    	       if($.inArray(""+j,hl)>-1)
				    	    	 

				    	    	  {
				    	    	
				    	    	   // $('#'+jid).empty();
				    	    	    $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>X</a></td>");
				    	    	  }
				    	      else  if($.inArray(""+j,jl)>-1)

			    	    	  {
				    	    	 // $('#'+j).empty();
				    	    	    $('#'+jid).append("<td align='center' font-color='red'><a href='game2player.html?m="+j+"'>O</a></td>");
			    	    	  }
				    	      else
				    	    	  {
				    	    	  $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>_</a></td>");
				    	    	  }
				    	      
				    	   }
						   if(data.games[i].result != null)
							   $('#outcome').append("<h2 align='center'>"+data.games[i].result+"</h2>");
				       break;
						   }
					   else if(uname=== join)
						   {
						   for(var j=1;j<=9;j++)
				    	   {
							   var jid ;
								if(j === 1)
				    	   		{
				    	   			$('#gb').append("<tr id="+j+">");
				    	   			jid=j;
				    	   		}
				    	   	else if(j === 4)
			    	   		{
			    	   			$('#gb').append("<tr id="+j+">");
			    	   			jid=j;
			    	   		}
				    	   	else if (j===7)
				    	   	{
			    	   			$('#gb').append("<tr id="+j+">");
			    	   			jid=j;
			    	   		}
				    	      if($.inArray(""+j,hl)>-1)

				    	    	  {
				    	    	
				    	    	  //  $('#'+jid).empty();
				    	    	    $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>X</a></td>");
				    	    	  }
				    	      else  if($.inArray(""+j,jl)>-1)

			    	    	  {
				    	    	 // $('#'+j).empty();
				    	    	    $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>O</a></td>");
			    	    	  }
				    	      else
			    	    	  {
			    	    	  $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>_</a></td>");
			    	    	  }
				    	      
				    	   }
						   if(data.games[i].result != null)
							   $('#outcome').append("<b>"+data.games[i].result+" </b>");
				       break;
						   } 
					 }
			
			},
		});
		update();
	});
	
	
function update() {
	$.ajax({
		url : "multigame.deferred.json",
		cache: false,
		success : function(data) {

		
			var uname="${user}";
			
			 for(var i=0;i<data.length;i++)
			 {
			 
			 $('#gb').empty();
			   var game=data[i].gamename.split('-');
			
			   var host=game[0];
			   var join=game[1];
			   var hl=data[i].player1;
			   var jl=data[i].player2;
			   
			  
			   if(host===uname)
				   {
				   for(var j=1;j<=9;j++)
		    	   {
					   var jid ;
		    	   	if(j === 1)
		    	   		{
		    	   			$('#gb').append("<tr id="+j+">");
		    	   			jid=j;
		    	   		}
		    	   	else if(j === 4)
	    	   		{
	    	   			$('#gb').append("<tr id="+j+">");
	    	   			jid=j;
	    	   		}
		    	   	else if (j===7)
		    	   	{
	    	   			$('#gb').append("<tr id="+j+">");
	    	   			jid=j;
	    	   		}
		    	   	
		    	      if($.inArray(""+j,hl)>-1)
		    	    	 

		    	    	  {
		    	    	
		    	    	   // $('#'+jid).empty();
		    	    	    $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>X</a></td>");
		    	    	  }
		    	      else  if($.inArray(""+j,jl)>-1)

	    	    	  {
		    	    	 // $('#'+j).empty();
		    	    	    $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>O</a></td>");
	    	    	  }
		    	      else
		    	    	  {
		    	    	  $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>_</a></td>");
		    	    	  }
		    	      
		    	   }
				   
				   if(data[i].result != null)
					   $('#outcome').append("<b>"+data[i].result+" </b>");
		       break;				   }
			   else if(uname=== join)
				   {
				   for(var j=1;j<=9;j++)
		    	   {
					   var jid ;
						if(j === 1)
		    	   		{
		    	   			$('#gb').append("<tr id="+j+">");
		    	   			jid=j;
		    	   		}
		    	   	else if(j === 4)
	    	   		{
	    	   			$('#gb').append("<tr id="+j+">");
	    	   			jid=j;
	    	   		}
		    	   	else if (j===7)
		    	   	{
	    	   			$('#gb').append("<tr id="+j+">");
	    	   			jid=j;
	    	   		}
		    	      if($.inArray(""+j,hl)>-1)

		    	    	  {
		    	    	
		    	    	  //  $('#'+jid).empty();
		    	    	    $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>X</a></td>");
		    	    	  }
		    	      else  if($.inArray(""+j,jl)>-1)

	    	    	  {
		    	    	 // $('#'+j).empty();
		    	    	    $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>O</a></td>");
	    	    	  }
		    	      else
	    	    	  {
	    	    	  $('#'+jid).append("<td align='center'><a href='game2player.html?m="+j+"'>_</a></td>");
	    	    	  }
		    	      
		    	   }
				   if(data[i].result != null)
					   $('#outcome').append("<b>"+data[i].result+"</b>");
		       break;
				   } 
				 }

			
			update();
		},
	});
}

</script>

</head>
<body bgcolor="FFCCFF">


	<h1 align="center">
		<font face="Times New Roman">Welcome to Two Player</font> <font
			color="#DC143C" face="Times New Roman" font-style:italic>Tic</font> <font
			color="red" face="Times New Roman" font-style:italic>Tac</font> <font
			color="#8B0000" face="Times New Roman" font-style:italic>Toe</font> <font
			face="Times New Roman">Game</font>
	</h1>


	<h3 align="center"> &nbsp ${msg}</h3>



	<table border="1" align="center" id="gb">
		<!--   <tr id="1">
			<td id="1"><a href="game2player.html?m=1">_</a></td>
			<td id="2"><a href="game2player.html?m=2">_</a></td>
			<td id="3"><a href="game2player.html?m=3">_</a></td>
		</tr>

		<tr id="2">
			<td id="4"><a href="game2player.html?m=4">_</a></td>
			<td id="5"><a href="game2player.html?m=5">_</a></td>
			<td id="6"><a href="game2player.html?m=6">_</a></td>
		</tr>



		<tr id="3">
			<td id="7"><a href="game2player.html?m=7">_</a></td>
			<td id="8"><a href="game2player.html?m=8">_</a></td>
			<td id="9"><a href="game2player.html?m=9">_</a></td>
		</tr>  -->

	</table>
	<h3 align="center">	
<h4 align="center">	<a  href="GameHome.html" class="gotohome" align="center">Go to home</a></h4>
	
		
	</h3>

<div class="rss">
  
 <!--  <input type="checkbox" id="buttonThree" /> -->
  <label for="buttonThree"> <!-- class="attention" -->
    <i></i>
  </label>
  
</div>

<div id="outcome"></div>

</body>
</html>