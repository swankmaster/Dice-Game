<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<%@ page import = "model.HighLow" %>
<%@ page import = "java.text.NumberFormat"%>

	<%
	
	NumberFormat cf = NumberFormat.getCurrencyInstance();
	//initialize needed values (bet type, user's initial balance, amount betted)
	double balance = (Double)request.getAttribute("balance");


	//for number of bets
	int count = (int)request.getAttribute("count"); 		
	
	

	%>
<!DOCTYPE html>
<html>
<head>
<link rel = "stylesheet" type = "text/css" href = "mt.css">
<meta charset="UTF-8">
<title>MIST 4630 High-Low Game: Bet Page</title>
</head>
<body>
	<h1>4630 - Bet Page</h1>
	<p>
	Place your bet!
	</p>
	<p>
	Balance: <%=cf.format(balance)%>
	</p>
	
	<p>
	You must select the type of bet you'd like to place (Low, Seven, High)
	</p>
	<form name = "betForm" action = "doRoll" method ="post">
		<label>Type of bet:</label>
		<input type ="text" name = "type" value =""/> <br/>
		<label>Bet Amount</label>
		<input type ="text" name = "betAmount" value =""/> <br/>
		<input type = "submit" name = "submit" value ="Bet">
		<%
		count++;
		%>
		<input type = "hidden" name ="count" value ="<%=count%>"> 
		<input type = "hidden" name = "balance" value ="<%=balance%>">
		
	</form>
	
	
	<form name = "play" action="doResults" method = "post">
		<input type = "submit" name = "quit" value = "Quit">
		<%
		int quitCount = count -1;
		%>
		<input type = "hidden" name ="count" value = "<%=quitCount%>">
		<input type = "hidden" name = "balance" value ="<%=balance%>">
	</form>
	
	

</body>
</html>