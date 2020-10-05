<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>session에 저장된 값 출력하기</h2>
<%int result = (Integer)session.getAttribute("sumResult"); %>
결과 : <%=result %>
</body>
</html>