<%@page import="kr.or.ddit.member.model.MemberVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script>
	//해당 html이 로딩이 완료 되었을 때 실행되는 이벤트 핸들러 함수
	$(document).ready(function() {
		//ajax call을 통해 1페이지에 해당하는 사용자 정보를 json으로 받는다.
		//javascript 객체를 인자로 함수 호출
		//memberListAjax(1);
		memberListAjaxHTML(1);
		
		//이벤트를 이벤트 대상의 부모에 걸고 실행 대상을 이벤트 대상으로 설정. 
		$('#memberList').on('click', 'tr', function() {
			//data-userId
			var userid = $(this).data("userid");
			console.log(userid);
			console.log("tbody tr click!!");
			console.log("userId : " + userid);
			//memberAjaxHTML(userid);
			document.location = "/member/memberAjaxPage?userId=" + userid;
		});

	});


	function memberListAjax(p){
		$.ajax({url : "/member/listAjax",
			data : {page : p, pageSize : 5},
			//data : "page=1&pageSize=5",
			//data : JSON.stringify({page : 1, pageSize : 5}),
			//Controller에서 @RequestBody JSON <--> JAVA OBJECT
			method : 'get',
			success : function(data){
				var i = 0;

				//memberList tbody영역에 들어갈 html 문자열 생성
				var html = "";
				for(var i = 0; i < data.memberList.length; i++){
					var member = data.memberList[i];
					html += "<tr data-userid='"+member.userId+"' >";
					html += "	<td>"+member.userId+ "</td>";
					html += "	<td>"+member.userNm+ "</td>";
					html += "	<td>"+member.alias+ "</td>";
					html += "	<td>"+member.fmt_reg_dt+"</td>";
					html += "</tr>";							
				}

				$("#memberList").html(html);

				//success callback 함수 내에서 이벤트 작성
				/* $('#memberList tr').on('click', function() {
					//data-userId
					var userid = $(this).data("userid");
					console.log(userid);
					console.log("tbody tr click!!");
					console.log("userId : " + userid);
		
					document.location = "/member/memberView?userId=" + userid;
				}); */

				//페이지 내비게이션 html 문자열 동적으로 생성하기
				var j = 1;

				var pageHtml = "";
				for(var j=1; j < data.totalPage; j++){
					if(j == data.pageVo.page){
						pageHtml += "<li class=\"active\"><span>"+j+"</span></li>";
					}
					else{
						// <a href = "javascript:memberListAjax(1);"/>
						pageHtml += "<li><a href=\"javascript:memberListAjax("+j+");\">"+j+"</a></li>";
					}
				}

				$('ul.pagination').html(pageHtml);
			}

		});
	}


	function memberListAjaxHTML(p){
		console.log("ajax activate!");
		$.ajax({url : "/member/listAjaxHTML",
			data : {page : p, pageSize : 5},
			//data : "page=1&pageSize=5",
			//data : JSON.stringify({page : 1, pageSize : 5}),
			//Controller에서 @RequestBody JSON <--> JAVA OBJECT
			method : 'get',
			success : function(data){
				
				var html = data.split("$$$SEPARATOR$$$");
	
				$("#memberList").html(html[0]);
				$('ul.pagination').html(html[1]);
			}

		});
	}


	
</script>


<div class="row">
	tiles : memberListAjax.jsp

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
					
				</tbody>
			</table>
		</div>
		<%-- memberList.size() : ${memberList.size() }<br> pages : ${totalPage }<br>
		currPage : ${pageNo }<br> pageSize : ${pageSize} --%> 
		<a class="btn btn-default pull-right" href="${cp }/member/registView">사용자등록</a>

		<div class="text-center">
			<ul class="pagination">
				
			</ul>
		</div>
	</div>
</div>

