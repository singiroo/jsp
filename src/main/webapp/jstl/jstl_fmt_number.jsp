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
	<% //<c:set var = "price" value="10000"/> 
		request.setAttribute("price", 100000);
	%>
	
	<fmt:setLocale value="de_DE" />
	<%-- 숫자 ===> 문자 --%>	
	price : ${price } <br>
	price :  - type-number : <fmt:formatNumber value="${price }" type="number"/> <br>
	<%-- value는 1이 100%의 개념으로 인식 --%>
	price :  - type-percent : <fmt:formatNumber value="0.1" type="percent"/> <br>

	price :  - type-currency : <fmt:formatNumber value="100000" type="currency"/> <br>
	price - pattern <fmt:formatNumber value="${price }" pattern="00,0000.00"/> <br><br>
	
	<%-- 문자 ==> 숫자 (파라미터 처리)
	     100.000,52(문자) ==> 100000.52(숫자) --%>
	parseNumber : <fmt:parseNumber value="100.000,52"/> <br>
	parseNumber : <fmt:parseNumber value="100.000,52" var="num"/> num = ${num } <br>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>