<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>화면 요청</title>
</head>
<body>

<h2>화면 요청</h2>
<form action= "<%=request.getContextPath() %>/sumCalculationServlet" method="post">

<p>시작 값은 끝 값 보다 작은 값을 입력하세요.</p>

시작 : <input type="text" name="start"/><br>

끝 : <input type="text" name="end"/><br>


<input type="submit" value="전송"/>

</form>

</body>
</html>