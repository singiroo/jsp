<%@page import="kr.or.ddit.member.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
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

<script>
	$(document).ready(function(){
		$('tbody tr').on('click', function(){
			//data-userId
			var userid = $(this).data("userid");
			console.log(userid);
			console.log("tbody tr click!!");
			console.log("userId : "+ userid);

			document.location="/jsp/member?userId="+ userid;
		});
			
	});
		
</script>
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
					<th>사용자 아이디</th>
					<th>사용자 이름</th>
					<th>사용자 별명</th>
					<th>등록일시</th>
				</tr>	
			<tbody id="memberList">
				<c:forEach var="member" items="${map.memberList }">
					<tr data-userid="${member.userId }">
					<td>${member.userId }</td>
					<td>${member.userNm }</td>
					<td>${member.alias }</td>
					<!-- format : yyyy-MM-dd -->
					<td>
						<fmt:parseDate var="parsingDate" value="${member.reg_dt }" pattern="yyyy-MM-dd"/> 
					 	<fmt:formatDate value="${parsingDate }" pattern="yyyy-MM-dd"/>
					</td>
					</tr>
			
				</c:forEach>			
			</tbody>
			</table>
		</div>
		memberList.size() : ${memberList.size() }<br>
		pages : ${totalPage }<br>
		currPage : ${pageNo }<br>
		pageSize : ${pageSize}
		
		<a class="btn btn-default pull-right" href="${cp }/memberRegist">사용자 등록</a>

		<div class="text-center">
			<ul class="pagination">
				<c:forEach var="i" begin="1" end="${map.totalPage }" >
					<c:choose>
						<c:when test="${i == pageNo}">
							<li class="active"><span>${i}</span></li>					
						</c:when>
						<c:otherwise>
							<li><a href="${pageContext.request.contextPath }/memberList?page=${i}&pageSize=${pageSize}">${i }</a></li>					
						</c:otherwise>
					</c:choose>
					
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
