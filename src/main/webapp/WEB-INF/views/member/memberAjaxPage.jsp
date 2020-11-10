<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script>
	$(document).ready(function(){
		var id = "${userId}";
		console.log(id);
		memberAjaxHTML(id);

		$('#profileDownBtn').on('click', function(){
			document.location = "${cp}/profileDownload?userId=${memberVo.userId}";
		});
	});

	function memberAjaxHTML(id){
		$.ajax({url : "/member/memberAjaxHTML",
				data : {userId : id },
				method : "get",
				success : function(data){
					$('#userId').text(data.memberVo.userId);
					$('#userNm').text(data.memberVo.userNm);
					$('#alias').text(data.memberVo.alias);
					$('#password').text(data.memberVo.pass);
					$('#addr1').text(data.memberVo.addr1);
					$('#addr2').text(data.memberVo.addr2);
					$('#zipcode').text(data.memberVo.zipcode);
					$('#reg_dt').text(data.memberVo.fmt_reg_dt);
					$('#profileDownBtn').text("다운로드 : "+data.memberVo.realFileName);
					//src="${cp}/profileImgView?userId=${memberVo.userId}"
					$('#userProfile').attr('src', "/profileImgView?userId="+data.memberVo.userId);
					//${cp }/member/updateView?userId=${memberVo.userId}
					$('#updatelink').attr('href', "/member/updateView?userId="+data.memberVo.userId);
				}

		});

	}



	
</script>

		tiles : memberAjaxHTML.jsp
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
					<img id="userProfile" /><br>
					<button id="profileDownBtn" type="button" 
					class="btn btn-default"></button>
				</div>
			</div>
			
			<div class="form-group">
				<label for="userNm" class="col-sm-2 control-label">사용자 아이디</label>
				<div class="col-sm-10">
					<label id = "userId" class="control-label"></label>
				</div>
			</div>

			<div class="form-group">
				<label for="userNm" class="col-sm-2 control-label">사용자 이름</label>
				<div class="col-sm-10">
					<label id="userNm" class="control-label"></label>
				</div>
			</div>
			<div class="form-group">
				<label for="userNm" class="col-sm-2 control-label">별명</label>
				<div class="col-sm-10">
					<label id="alias" class="control-label"></label>
				</div>
			</div>
			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label">Password</label>
				<div class="col-sm-10">
					<label id="password" class="control-label"></label>						
				</div>
			</div>
			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label">주소1</label>
				<div class="col-sm-10">
					<label id="addr1" class="control-label"></label>						
				</div>
			</div>
			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label">상세주소</label>
				<div class="col-sm-10">
					<label id="addr2" class="control-label"></label>						
				</div>
			</div>
			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label">우편번호</label>
				<div class="col-sm-10">
					<label id="zipcode" class="control-label"></label>						
				</div>
			</div>
			<div class="form-group">
				<label for="pass" class="col-sm-2 control-label">등록일자</label>
				<div class="col-sm-10">
					<!-- yyyy mm dd  -->
					<!-- 타입이 String이라서 파싱해서 Date 타입으로 바꾸고 다시 formatted String으로 바꿔줌  -->
					<label id="reg_dt" class="control-label"></label>						
				</div>
			</div>
			
			
			
			

			<div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<a id="updatelink" href="${cp }/member/updateView?userId=${memberVo.userId}"><button type="button" class="btn btn-default">사용자 수정</button></a>
				</div>
			</div>
		</form>
