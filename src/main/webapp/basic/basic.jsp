<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- jsp는 java 언어만 지원함. 그러나 jsp 개발 당시 개발자들은 확장성을 고려하여 lauguage 프로퍼티를 만들어 놓음.  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%	//스크립트릿 : 자바 로직을 작성하는 공간
		//특정 메서드 안에서 구현하는 자바로직
		//지역변수.
		Date date = new Date();
	
	%>
	<!-- expression : 화면에 출력을 해준다 
		writer.print() 에 해당.
	 -->
	현재시간 : <%= date %> 
</body>
</html>