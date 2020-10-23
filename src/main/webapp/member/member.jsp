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

<%@ include file="/layout/commonLib.jsp" %>

<script>
	$(document).ready(function(){
		$('#profileDownBtn').on('click', function(){
			document.location = "${cp}/profileDownload?userId=${memberVo.userId}";
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


				<form class="form-horizontal" role="form">
					<!-- <div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userId" name="userId"
								placeholder="사용자 아이디">
						</div>
					</div> -->

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 사진</label>
						<div class="col-sm-10">
							<%-- <img src="${cp }/profile/${memberVo.fileName}"/> --%>
							
							<img src="${cp}/profileImg?userId=${memberVo.userId}"/><br>
							<button id="profileDownBtn" type="button" 
							class="btn btn-default">다운로드: ${memberVo.realFileName }</button>
						</div>
					</div>
					
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label>
						<div class="col-sm-10">
							<label class="control-label">${memberVo.userId }</label>
						</div>
					</div>

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
						<div class="col-sm-10">
							<label class="control-label">${memberVo.userNm }</label>
						</div>
					</div>
					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">별명</label>
						<div class="col-sm-10">
							<label class="control-label">${memberVo.alias }</label>
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<label class="control-label">${memberVo.pass }</label>						
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">주소1</label>
						<div class="col-sm-10">
							<label class="control-label">${memberVo.addr1 }</label>						
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">상세주소</label>
						<div class="col-sm-10">
							<label class="control-label">${memberVo.addr2 }</label>						
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">우편번호</label>
						<div class="col-sm-10">
							<label class="control-label">${memberVo.zipcode }</label>						
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">등록일자</label>
						<div class="col-sm-10">
							<!-- yyyy mm dd  -->
							<!-- 타입이 String이라서 파싱해서 Date 타입으로 바꾸고 다시 formatted String으로 바꿔줌  -->
							<%-- ${memberVo.reg_dt } --%>
							<fmt:parseDate value="${memberVo.reg_dt }" pattern="yyyy-MM-dd" var="regDt" />
							<label class="control-label"><fmt:formatDate value="${regDt }" pattern="yyyy MM dd"/></label>						
						</div>
					</div>

					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<a href="${cp }/memberUpdate?userId=${memberVo.userId}"><button type="button" class="btn btn-default">사용자 수정</button></a>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
    