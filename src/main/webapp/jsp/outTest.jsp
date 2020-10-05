<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<% out.println("out.equals(response.getWriter()) : "+out.equals(response.getWriter())+"<br><br>"); %>
<%=out %>
<br>
<%=response.getWriter() %>


</body>
</html>