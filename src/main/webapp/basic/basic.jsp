<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%-- jsp는 java 언어만 지원함. 그러나 jsp 개발 당시 개발자들은 확장성을 고려하여 lauguage 프로퍼티를 만들어 놓음.  --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<%-- jsp 스크립트 : 서버에서 실행되고 그 결과는 클라이언트에게 전달된다.
		<% %>, <%= %>	
	 --%> 
	 <%String str = "msg"; %>
	 <%String str2 = ""; %>
	 <%String str3 = "hello"; %>
 <script>
 	/* 서버 사이드 변수에 클라이언트 사이드 값을 대입 하는 경우(x)
 	   서버 사이드 스크립트가 먼저 실행되므로 논리적으로 말이 안된다. */
 	<%=str%> = 'test';
 	//<%=str2%> = 'test'; // jsp주석은 서버에서 실행되고 클라이언트에서 주석처리됨?
 	<%--<%=str2%> = 'test';--%> // 서버쪽에서도 실행 안되는 주석
	console.log('<%=str%>');

	/* 클라이언트 사이드 변수에 서버 사이드 변수 값을 대입 
	   서버 사이드 스크립트가 먼저 실행되므로 논리적으로 말이 됨.*/
	var msg = '<%=str3%>';
	






	
 </script>
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