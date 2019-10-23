<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "model.HighLow" %>
<%@ page import = "java.text.NumberFormat"%>

	<%
	
	NumberFormat cf = NumberFormat.getCurrencyInstance();   
   //input from ResultServlet

   HighLow input = (HighLow)request.getAttribute("input");
   int bets = (int)request.getAttribute("count");

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
	
	<p>Final Balance: <%= cf.format(input.getBalance())%></p>
	<p>Thanks for playing. You now have <%=cf.format(input.getBalance())%></p>
	<p>Number of bets: <%=bets %></p>

	
	<h2><a href="index.jsp">Play Again</a></h2>

</body>
</html>