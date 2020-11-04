<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- cp가 설정이 안되어있어도 el에 의하여 자동으로 null처리 되나,
     현재 프로젝트의 context-root 설정이 /(root)로 되어있기 때문에 경로상 오류가 발생하지 않음.  -->
     
<link href="${cp}/css/bootstrap.css" rel="stylesheet"><!-- Bootstrap core CSS -->
<link href="${cp }/css/dashboard.css" rel="stylesheet">
<link href="${cp }/css/blog.css?v=2" rel="stylesheet">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="${cp}/js/bootstrap.js"></script><!-- Custom styles for this template -->