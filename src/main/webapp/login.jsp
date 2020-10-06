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
    <link href="<%=request.getContextPath() %>/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="<%=request.getContextPath() %>/css/signin.css" rel="stylesheet">

	<script>
		window.onload = function(){
			input = prompt("쿠키 이름을 입력하세요");
			var result1 = getCookieValue(input);

			var result2 = getCookieValue("userId");
			var result3 = getCookieValue("NOEXISTS_COOKIE");
		
			console.log(result1);
			console.log(result2);
			console.log(result3);
		}
	
	
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
	</script>
  </head>
  
  
  

  <body>

    <div class="container">

      <form class="form-signin">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <input type="email" id="inputEmail" class="form-control" placeholder="Email address" required autofocus>
        <label for="inputPassword" class="sr-only">Password</label>
        <input type="password" id="inputPassword" class="form-control" placeholder="Password" required>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      </form>

    </div> <!-- /container -->


  </body>
</html>
    