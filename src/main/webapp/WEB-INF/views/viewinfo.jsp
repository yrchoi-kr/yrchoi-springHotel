<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<p>로그인 id는 ${user_id}<p>
	<p>패스워드는 ${user_pw}<p>
	<button onclick="window.location.href='/yrchoiHotel'" class="btn btn-primary btn-lg">홈으로</button>
</body>
</html>