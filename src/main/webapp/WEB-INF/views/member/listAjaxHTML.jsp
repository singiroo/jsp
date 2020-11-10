<%@page import="kr.or.ddit.member.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="member" items="${memberList }">
	<tr data-userid="${member.userId }">
		<td>${member.userId }</td>
		<td>${member.userNm }</td>
		<td>${member.alias }</td>
		<!-- format : yyyy-MM-dd -->
		 <td> <fmt:formatDate value="${member.reg_dt }" pattern="yyyy-MM-dd" /></td>
	</tr>
</c:forEach>

$$$SEPARATOR$$$

<c:forEach var="i" begin="1" end="${totalPage }">
	<c:choose>
		<c:when test="${i == pageVo.page}">
			<li class="active"><span>${i}</span></li>
		</c:when>
		<c:otherwise>
			<li><a href="javascript:memberListAjaxHTML(${i});">${i }</a></li>
		</c:otherwise>
	</c:choose>
</c:forEach>
		