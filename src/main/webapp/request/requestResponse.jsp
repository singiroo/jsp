<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>getRequestResponse</title>
</head>
<body>
	<%request.setCharacterEncoding("utf-8"); %>
	<h1>전송 method : <%=request.getMethod() %></h1>
	<h1>요청 url : <%=request.getRequestURI() %></h1>
	userId 파라미터는 michael, jones 두개를 보내지만 getParameter를 호출하면 첫번째
	파라미터 값을 반환<br>
	request.getParameter("userId") : <%=request.getParameter("userId") %>
	<br><br>
	String[]을 반환<br>
	request.getParameterValues("userId") : 
	<%	String[] userIds = request.getParameterValues("userId"); 
		for(String userId : userIds){ 
	%>
			<%= userId %>,
	<%		
		}
	%>
	<br><br>
	parameterMap : Map &lt;String, String[]&gt;
	request.getParamterMap() : <%=request.getParameterMap() %>
	
	요청에 존재하는 파라미터 이름 출력하기
	
	request.parameterNames() :<br>
	<% Enumeration<String> names = request.getParameterNames();
		
		while(names.hasMoreElements()){
			String name = names.nextElement();
	%>
			<p><%=name %> </p>
	<%
	
		}
	
	%>
	
	
	
		



</body>
</html>