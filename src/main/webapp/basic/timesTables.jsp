<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구구단 도표</title>
<style>
	table{
		border-collapse: collapse;
		margin : 30px;
	}


	td{
		text-align : center;
		width : 100px;
		height : 50px;
		font-size: 15px;
	}
</style>
</head>
<body>

<table border = '1'>
<% for(int i=1; i<10; i++){ %>
	<tr>
	<% for(int j=2;j<10;j++){ %>
		<td><%=j %> * <%=i %> = <%=j*i %></td>	
	<% } %>
	</tr>
<% } %>
</table>











</body>
</html>