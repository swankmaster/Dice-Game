<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import = "model.HighLow"%>
    
    <%
    HighLow input = new HighLow();
    int count = 0;
    
    %>


<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type = "text/css" href = "mt.css">
<meta charset="UTF-8">
<title>MIST 4630 High-Low Game</title>
</head>
<body>
	<h1>MIST 4630 High-Low Game</h1>
	<p>Place a bet and try your luck</p>
	<p>
	<img src = "Dice-1.png" alt= "start" height = "42" width = "42">
	<img src = "Dice-3.png" alt= "start" height = "42" width = "42">
	</p>
	<p>Your initial balance is $1,000.00</p>
	<form name = "play" action="doBet" method = "post">
		<input type = "hidden" name ="balance" value ="<%=input.getBalance()%>">
		<input type = "hidden" name = "count" value ="<%=count%>">
		<input type = "submit" name = "play" value = "Play"/>
	</form>
	

</body>
</html>