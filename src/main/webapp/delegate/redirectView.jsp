<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	redirectView.jsp
	
	<table border="1">
		<tr>
			<th>이름</th>
		</tr>
		<%-- request 객체에 저장된rangers 속성을 이용하여  tr, td 그리고 ranger 이름 출력 --%>
		<% List<String> rangers = (List<String>) request.getAttribute("rangers"); 

			for(String name : rangers){ 
		%>
				<tr>
					<td><%=name %></td>
				</tr>		
		<%
			}
		%>
	</table>
</body>
</html>