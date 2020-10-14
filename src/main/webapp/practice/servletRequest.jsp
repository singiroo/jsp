<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	request.getLocalAddr() : local IP = <%= request.getLocalAddr() %><br>
	request.getRemoteAddr() : Client IP = <%=request.getRemoteAddr() %><br>
	request.getContentLength() : 요청정보 길이 = <%=request.getContentLength()%><br>
	request.getCharacterEncoding() : 요청정보 인코딩 = <%=request.getCharacterEncoding()%> <br>
	request.getContentType() : 요청정보 컨텐트 타입 = <%=request.getContentType() %><br>
	request.getProtocol() : 요청 프로토콜 = <%=request.getProtocol() %><br>
	request.getMethod() : 요청 메소드 = <%=request.getMethod() %><br>
	request.getRequestURI() : 요청 URI = <%=request.getRequestURI() %><br>
	request.getContextPath() : contextPath(웹 애플리케이션 이름) = ${pageContext.request.contextPath }<br>
	request.getServerName() : 서버이름 = <%=request.getServerName() %><br>
	request.getServerPort() : 서버포트 = <%=request.getServerPort() %><br>
	request.getServletContext() : 마지막 디스패치된 서블릿 = <%=request.getServletContext() %><br>
	request.getServletPath() : 서블릿 패스 = <%=request.getServletPath() %><br>
</body>
</html>