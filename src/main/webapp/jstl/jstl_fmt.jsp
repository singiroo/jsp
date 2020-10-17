<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>국제화</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/js/js.cookie-2.2.1.min.js"></script>
<script>

$(function(){
	console.log("<c:out value = '${param.lang}'/>")
	
	var lang = "<c:out value = '${param.lang}'/>"
		
	if(lang != ""){
		$('option[value = '+lang+']').prop('selected', true).css({'color' : 'red', 'font-weight' : 'bold'})
	}else{
		$('option[value = ko]').prop('selected', true)
	}

	$('select').on('change', function(){
		$('form').submit()
		
	})
	
})

</script>

</head>
<body>
	<%-- 1. jQuery 라이브러리 추가 
		 2. select box 생성
		  	option 3가지 언어 (ko, ja, en) 선택가능
		 3. 페이지가 로딩이 되었을 때 사용자가 요청한 언어로 option 태그가 선택이 된 상태로 표현
		 4. 만약에 사용자가 언어 설정 파라미터를 보내지 않았을 경우 기본값으로 한국어가 설정되게 끔
		 5. option 태그가 바뀌면 자동으로 jstl_fmt.jsp로 재요청 
		    EL안에서 삼항연산자 사용가능 --%>

	<!-- locale 정보를 변경  -->
	<fmt:setLocale value="${param.lang }" scope="request" />
	
	
	<form action="${pageContext.request.contextPath }/jstl/jstl_fmt.jsp" method="get">
		<select name="lang">
			<option class="lang"  value="ko">ko</option>
			<option class="lang"  value="ja">ja</option>
			<option class="lang"  value="en">en</option>
		</select>	
	</form>
	
	


	<!-- 사용할 리소스 번들 설정 (리소스번들명_로케일.properties)
		kr.or.ddit.resource message_로케일.properties  -->
	<%
		request.setAttribute("userId", "brown");
	%>
	
	<fmt:bundle basename="kr.or.ddit.resource.message">
		<fmt:message key="GREETING" var="greeting"/>[${greeting }] <br>
		<fmt:message key="LOGIN_MSG"> 
			<fmt:param value="${userId }"/>
		</fmt:message>
	</fmt:bundle>

	<h3>setBundle</h3>
	<!-- setBundle : 번들 메시지를 변수에 저장하여 message 태그에서 사용하게끔 하는 태그 -->
	
	<fmt:setBundle basename="kr.or.ddit.resource.message" var="msg"/>
	
	<fmt:message key="GREETING" bundle="${msg }"/>
	
	
	
</body>
</html>