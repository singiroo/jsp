<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>scope 영역/수명 확인</title>
</head>
<body>
	request : <%=request.getAttribute("requestAttr") %> <br>
	session : <%=session.getAttribute("sessionAttr") %><br>
	application : <%=application.getAttribute("applicationAttr") %> <br>
</body>
</html>