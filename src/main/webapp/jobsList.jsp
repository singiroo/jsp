<%@page import="kr.or.ddit.jobs.model.JobsVo"%>
<%@page import="kr.or.ddit.member.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Jsp</title>

<%@include file="/layout/commonLib.jsp" %>

</head>

<body>


<%@ include file="/layout/header.jsp" %>		

<div class="container-fluid">
		<div class="row">
			
<div class="col-sm-3 col-md-2 sidebar">
	<%@ include file="/layout/left.jsp" %>
</div>
<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">
				

<div class="row">
	<div class="col-sm-8 blog-main">
		<h2 class="sub-header">사용자</h2>
		<div class="table-responsive">
			<table class="table table-striped">
				<tr>
					<th>직업 코드</th>
					<th>직업명</th>
					<th>최소급여</th>
					<th>최대급여</th>
				</tr>
				
				<c:forEach var="jobs" items="${map.jobsList }" >
					<tr>
						<td>${jobs.job_id }</td>
						<td>${jobs.job_title }</td>
						<td>${jobs.min_salary }</td>
						<td>${jobs.max_salary }</td>
					</tr>
				</c:forEach>
				<%-- <% List<JobsVo> jobsList = (List<JobsVo>)request.getAttribute("jobsList");
					for(JobsVo jobs : jobsList){
						out.println("<tr>");
						out.println("<td>"+jobs.getJob_id()+"</td>");
						out.println("<td>"+jobs.getJob_title()+"</td>");
						out.println("</tr>");
					}
				%> --%>
			</table>
		</div>

		<a class="btn btn-default pull-right">사용자 등록</a>

		<div class="text-center">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${map.totalPage }" step="1">
					<li><a href="${pageContext.request.contextPath }/jobsServlet?page=${i}">${i }</a></li>
				</c:forEach>	
			</ul>
		</div>
	</div>
</div>
	</div>
		</div>
	</div>
</body>
</html>





