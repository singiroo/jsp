<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
label{
	display : inline-block;
	width : 70px;

}

fieldset{
	width : 400px;
}
input[type=submit]{
	float : right;
	width : 80px;
}

</style>


</head>
<body>
<fieldset>
<legend>두 숫자 곱하기</legend>
<p> 곱할 두 숫자를 입력하세요 </p>
<form action="${pageContext.request.contextPath }/mulCalculation" method="post">

<label>숫자 1 : </label> <input type="text" name="param1"/><br>
<label>숫자 2 : </label> <input type="text" name="param2"/><br>

<input type="submit" value="전송"/>

</form>
</fieldset>
</body>
</html>