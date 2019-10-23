<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
   <%@ page import = "model.HighLow" %>
   <%@ page import = "java.text.NumberFormat"%>

<%
	
	NumberFormat cf = NumberFormat.getCurrencyInstance();
   //input from RollServlet
   int d1 = (int)request.getAttribute("d1");
   int d2 = (int)request.getAttribute("d2");
   HighLow input = (HighLow)request.getAttribute("input");
   boolean win = (boolean)request.getAttribute("win");
   String imgDice1 = "Dice-"+d1+".png";
   String imgDice2 = "Dice-"+d2+".png";
   double earnings = input.getEarnings();
   double newbalance = input.getBalance();
   int count = (int) request.getAttribute("count");
   %>
   
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type = "text/css" href = "mt.css">
<meta charset="UTF-8">
<title>MIST 4630 High-Low Game</title>
</head>
<body>
	<h1>MIST 4630 High-Low Game: Results</h1>
	
	<p>Current Balance: <%= cf.format(newbalance)%></p>
	<p>Current Bet: <%=cf.format(input.getBetAmount()) %></p>
	<p>Current Bet Type: <%=input.getBetType() %></p>
	
	<p>Your roll:</p>
	<p>
	<img src = <%=imgDice1%>  alt= "start" height = "42" width = "42">
	<img src = <%=imgDice2%> alt= "start" height = "42" width = "42">
	</p>
	<%=input.getMsg()%>
	
	
	
	<form name = "play" action="doBet" method = "post">
		<input type = "submit" name = "submit" value ="Bet Again">
		<input type = "hidden" name = "balance" value="<%=newbalance%>">
		<input type = "hidden" name ="count" value = <%=count%>> 
		</form>
	
	<form name = "quit" action="doResults" method = "post">
		<input type = "submit" name = "quit" value = "Quit">
		<input type = "hidden" name = "balance" value="<%=newbalance%>">
		<input type = "hidden" name ="count" value = <%=count%>> 
		
	</form>

	

</body>
</html>