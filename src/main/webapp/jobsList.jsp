<%@page import="kr.or.ddit.jobs.model.JobsVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table{
	border-collapse: collapse;
}

</style>

</head>
<body>
<table border="1">
	<tr>
		<th>직업 코드</th>
		<th>직업명</th>
	</tr>

<% List<JobsVo> jobsList = (List<JobsVo>)request.getAttribute("jobsList");
	for(JobsVo jobs : jobsList){
		out.println("<tr>");
		out.println("<td>"+jobs.getJob_id()+"</td>");
		out.println("<td>"+jobs.getJob_title()+"</td>");
		out.println("</tr>");
	}
%>

</table>

</body>
</html>