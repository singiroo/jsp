<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false"
				aria-controls="navbar">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<%--접속을 안했을 때 : ==> []--%>
			<%-- 접속을 했을 때 : [brown] ==> [brown] --%> 
			<%-- MemberVO memberVo = (MemberVO)session.getAttribute("S_MEMBER"); --%>
			
			<a class="navbar-brand" href="#">JSP/SPRING 
			<c:choose>
				<c:when test="${S_MEMBER != null }">[${S_MEMBER.userId }]</c:when>
				<c:otherwise>[]</c:otherwise>
			</c:choose>
			 <%-- if(memberVo != null) out.print("["+memberVo.getUserId()+"]"); --%></a>
		</div>
		<div id="navbar" class="navbar-collapse collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a href="#">Dashboard</a></li>
				<li><a href="#">Settings</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="#">Help</a></li>
				<li><a href="${cp }/logout">Logout</a></li>
			</ul>
			<form class="navbar-form navbar-right">
				<input type="text" class="form-control" placeholder="Search...">
			</form>
		</div>
	</div>
</nav>