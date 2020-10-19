<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<% Date now = new Date();
		request.setAttribute("now", now);
	%>
	<%-- us : mm-dd-yyyy
		 ko : yyyy. mm. dd ==> 2020-10-19, 2020/10/19  --%>
	<fmt:setLocale value="en-US"/>
	now : ${now } <br>
	now-formatDate : <fmt:formatDate value="${now }" /> <br>
	now-formatDate : <fmt:formatDate value="${now }" pattern="yyyy-MM-dd"/> <br>
	
	<%-- 문자 ==> 날짜 
		"2020-10-19 10:15" 문자열을 날짜 타입으로 변경--%>
	<% 
		request.setAttribute("nowStr", "2020/10/19 20:08");
	%>
	
	<fmt:parseDate value="${nowStr }" pattern="yyyy/M/dd HH:ss" /><br><br>
	<!-- String 날짜 자료를 순서대로 가져올때 pattern에 제시한 대로 가져옴 2020-10-19 10:15:13 의 문자열로 이루어진 날짜 데이터가 있다 가정하고
	     parseDate 태그의 pattern 속성의 값을 "mmdd"로 하면 2020의 앞부분 20은 mm 즉, 분 데이터로 파싱하고, 뒷부분 20은 dd, 날짜 데이터로 파싱함
	     날짜의 구분자가 들어갈 경우 구분자도 똑같이 pattern 속성에 작성해야 제대로 파싱을 함. 아니면 파싱 오류가 발생    -->
	Sun Jan 19 00:10:00 KST 2020

</body>
</html>