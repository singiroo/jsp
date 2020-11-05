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

<%@ include file="/WEB-INF/views/layout/commonLib.jsp" %>

<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	$(document).ready(function(){
		$('#zipcodeBtn').on("click", function(){
		    new daum.Postcode({
		        oncomplete: function(data) {
		            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
		            // 예제를 참고하여 다양한 활용법을 확인해 보세요.

					console.log(data);
					$('#addr1').val(data.roadAddress);
					$('#zipcode').val(data.zonecode);
		            
		        }
		    }).open();

		});

		$('#updBtn').on('click', function(){
			//client side - validation(유효성 검사)
			//server side - validation(유효성 검사)
			//validation 로직은 일단 생략

			$('#frm').submit();

		});

		//initData();


		
	});

	function initData(){
		$('#userId').val('kyh');
		$('#userNm').val('김윤환');
		$('#alias').val('singiroo');
		$('#pass').val('java');
		$('#addr1').val('대전 중구 중앙로 76');
		$('#addr2').val('영민빌딩 4층 404호');
		$('#zipcode').val("34904");


	}



</script>







</head>

<body>
	<%@ include file="/WEB-INF/views/layout/header.jsp" %>
	<div class="container-fluid">
		<div class="row">

			<div class="col-sm-3 col-md-2 sidebar">
				<%@ include file="/WEB-INF/views/layout/left.jsp" %>
			</div>
			<div class="col-sm-9 col-sm-offset-3 col-md-10 col-md-offset-2 main">


				<form id="frm" class="form-horizontal" role="form" action="${cp }/member/update" method="post" enctype="multipart/form-data">
					
					
					<div class="form-group">
						<label for="realFileName" class="col-sm-2 control-label">사용자 사진</label>
						<div class="col-sm-10">
							<%-- <img src="${cp }/profile/${memberVo.fileName}"/> --%>
							<img src="${cp}/profileImg?userId=${memberVo.userId}"/>
							<input type="hidden" name="realFileName" value="${memberVo.realFileName }"/>
							<input type="hidden" name="fileName" value="${memberVo.fileName }"/>
							<input type="file" name="realFileNames" />
						</div>
					</div>
					
					<div class="form-group">
						<label for="userId" class="col-sm-2 control-label">사용자 아이디</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userId" name="userId"
								placeholder="사용자 아이디" value="${memberVo.userId }" readonly>							
						</div>
					</div>

					<div class="form-group">
						<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="userNm" name="userNm"
								placeholder="사용자 이름" value="${memberVo.userNm }">
						</div>
					</div>
					<div class="form-group">
						<label for="alias" class="col-sm-2 control-label">별명</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="alias" name="alias"
								placeholder="사용자 별명" value="${memberVo.alias}">
						</div>
					</div>
					<div class="form-group">
						<label for="pass" class="col-sm-2 control-label">Password</label>
						<div class="col-sm-10">
							<input type="password" class="form-control" id="pass" name="pass"
								placeholder="사용자 비밀번호" value="${memberVo.pass }">						
						</div>
					</div>
					<div class="form-group">
						<label for="addr1" class="col-sm-2 control-label">주소1</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="addr1" name="addr1"
								placeholder="사용자 기본주소" value="${memberVo.addr1 }" readonly >
							<button id="zipcodeBtn" type="button" class="btn btn-default">우편번호 찾기</button>												
						</div>
					</div>
					<div class="form-group">
						<label for="addr2" class="col-sm-2 control-label">상세주소</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="addr2" name="addr2"
								placeholder="사용자 상세주소" value="${memberVo.addr2 }">						
						</div>
					</div>
					<div class="form-group">
						<label for="zipcode" class="col-sm-2 control-label">우편번호</label>
						<div class="col-sm-10">
							<input type="text" class="form-control" id="zipcode" name="zipcode"
								placeholder="사용자 우편번호" value="${memberVo.zipcode }" readonly >						
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button id="updBtn" type="button" class="btn btn-default">사용자 수정</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>
    