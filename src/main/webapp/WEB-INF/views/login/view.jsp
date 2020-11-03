<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    <title>Signin Template for Bootstrap</title>

    <!-- Bootstrap core CSS -->
    <link href="${pageContext.request.contextPath }/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="${pageContext.request.contextPath }/css/signin.css" rel="stylesheet">

    <script type="text/javascript" src="${pageContext.request.contextPath }/js/js.cookie-2.2.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
	$(function(){
		//remember me cookie 확인
		if(Cookies.get("REMEMBERME")=="Y"){
			$('#inputEmail').val(Cookies.get("userId"));
			$('#REMEMBERME').prop('checked',true);

		}
		//remember me check 여부에 의한 쿠키 생성/제거
		$('#submit2').on('click', function(){
			console.log('clicked!');
			var id = "";
			if($('#REMEMBERME').prop('checked')){
				id = $('#inputEmail').val();
				Cookies.set("REMEMBERME", "Y");
				Cookies.set("userId", id);
			}else{
				Cookies.remove("REMEMBERME");
				Cookies.remove("userId");
			}
			console.log(id);
			$('form').submit();
		})
	})
		
		
		
	
		function getCookieValue(cookieName){
			var cookies = document.cookie.split("; ");
			var result = "";
			for(var i=0;i<cookies.length;i++){
	
				var cookie = cookies[i].split("=");
	
				if(cookieName == cookie[0]){
					result = cookie[1];	
				}
			}
			return result
		}

		function setCookie(cookieName, cookieValue, expires){
			//"USERNM=brown; path=/; expires = Wed, 07 Oct 2020 00:30:30 GMT;"
			
			var today = new Date();
			//현재날짜에서 미래로 + expires 만큼 한 날짜 구하기
			today.setDate(today.getDate() + expires);

			//날짜 포맷을 GMT로 변환하여 쿠키 문자열 완성
			document.cookie = cookieName + "=" + cookieValue + "; path=/; expires=" + today.toGMTString()+";";
			console.log(document.cookie);
		}
		// 해당 쿠키의 expires 속성의 값을 과거날짜로 변경
		function deleteCookie(cookieName){
			setCookie(cookieName, "", -1);
		}
		
		
	</script>
  </head>
  
  
  

  <body>

    <div class="container">

      <form class="form-signin" action="${pageContext.request.contextPath }/login/process" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" name="userId" id="inputEmail" value="brown" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" name="pass" id="inputPassword" value="brownPass" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" id="REMEMBERME" value="remember-me"> Remember me
          </label>
        </div>
<!--         <button id="submit" class="btn btn-lg btn-primary btn-block" type="button">Sign in</button> -->
        <input id="submit2" class="btn btn-lg btn-primary btn-block" type="button" value="sign in">Sign in
      </form>
      
<!-- form 태그 안에서 식별자로 submit을 쓰는 경우 submit()메서드가 동작 안함. 
	 form 내부 요소이므로 submit 요소도 전송되는데 이 때 document.form.submit.submit()시 이름 충돌이 일어나 submit()이 실행되지 않음.
	 form 태그 외부에서는 식별자가 submit이어도 전송대상이 아니므로 submit()메서드가 정상 작동.  -->
	 
    </div> <!-- /container -->


  </body>
</html>
    