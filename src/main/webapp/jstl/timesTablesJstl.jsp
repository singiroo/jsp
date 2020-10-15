<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JSTL을 이용한 timesTables</title>
<style>
table{
	border-collapse: collapse;
}

td{
	width : 120px;
	height : 40px;
	text-align : center;
}
</style>
</head>
<body>
	<table border="1">
		<c:forEach var="i" begin="1" end="9" step="1">
			<tr>
				<c:forEach var="j" begin="2" end="9" step="1">
					<td>${j } * ${i } = ${j*i }</td>
				</c:forEach>
			</tr>
		</c:forEach>
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>