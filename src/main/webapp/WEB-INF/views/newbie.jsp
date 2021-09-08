<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>AdminLTE 3 | 로그인 & 회원가입 </title>
  <!-- Google Font: Source Sans Pro 구글웹폰트 -->
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
</head>
<body class="hold-transition sidebar-mini layout-fixed">
<!-- 여기까지 header.jsp영역 -->
<style>
.radio_area {
	box-sizing: border-box;
	padding: 10px;
}
.gender {
	padding: 4px 10px;
	font-size: 14px;
}
</style>
	<!-- 메인본문영역 -->
	<div class="bodytext_area box_inner">
		<!-- 폼영역 -->
		<form name="join_form" action="/yrchoiHotel/signin" method="post" class="appForm">
			<fieldset>
				<legend>회원가입폼</legend>
				<p class="info_pilsoo pilsoo_item">
				필수입력
				</p>
				<ul class="app_list">
					<li class="clear">
						<label for="user_id_lbl" class="tit_lbl pilsoo_item">사용자ID</label>
						<div class="app_content"><input type="text" name="user_id" class="w100p" id="user_id_lbl" placeholder="사용자ID를 입력해주세요" required/></div>
					</li>
					<li class="clear">
						<label for="password_lbl" class="tit_lbl pilsoo_item">암호</label>
						<div class="app_content">
							<input type="password" name="user_pw" class="w100p" id="password_lbl" placeholder="비밀번호를 입력해주세요" required/>
						</div>
					</li>
					<li class="clear">
						<label for="password_chk_lbl" class="tit_lbl pilsoo_item">암호확인</label>
						<div class="app_content"><input type="password" name="password_chk" class="w100p" id="password_chk_lbl" placeholder="비밀번로를 다시 입력해주세요" required/></div>
					</li>
					<li class="clear">
						<label for="user_name_lbl" class="tit_lbl pilsoo_item">사용자이름</label>
						<div class="app_content"><input type="text" name="user_name" class="w100p" id="user_name_lbl" placeholder="사용자이름을 입력해주세요" required/></div>
					</li>

				</ul>
				<p class="btn_line">
				<button type="submit"  class="btn_baseColor" id="btn_insert" >Submit</button>
				<button onclick="window.location.href='/yrchoiHotel'" class="btn btn-secondary btn-lg">돌아가기</button>
				</p>	
			</fieldset>
			
		</form>
		<!-- //폼영역 -->
	</div>
	<!-- //메인본문영역 -->
</div>
<!-- //메인콘텐츠영역 -->


<!-- AdminLTE for demo purposes 오른쪽메뉴-로그아웃사용 코어: 사용안함. -->
<!-- <script src="/resources/admin/dist/js/demo.js"></script> -->
</body>
<script src='http://code.jquery.com/jquery-3.5.0.js'></script>
<script>
// 회원가입 전용 유효성 검사 부분
$(document)
.on('click','#btn_insert',function(){
	if($('#user_name_lbl').val()==''){
		alert ('이름을 입력하시오.');
		return false;
	}
	if($('#user_id_lbl').val()==''){
		alert('로그인 아이디를 입력하시오');
		return false;
	}
	if($('#password_lbl').val()==''){
		alert('비번을 입력하시오');
		return false;
	}
	var pw1 = $('#password_lbl').val();
	var pw2 = $('#password_chk_lbl').val();
	if(pw1 != pw2){
		alert("패스워드 확인 바랍니다.");
		return false;
	}
});
</script>
</html>
<style>

/*css 재정의 (override)*/
.sidebar-dark-primary .nav-sidebar>.nav-item>.nav-link.active, .sidebar-light-primary .nav-sidebar>.nav-item>.nav-link.active
{
background-color:#fff;
color:#000;
}
[class*=sidebar-dark-] .nav-treeview>.nav-item>.nav-link.active, [class*=sidebar-dark-] .nav-treeview>.nav-item>.nav-link.active:focus, [class*=sidebar-dark-] .nav-treeview>.nav-item>.nav-link.active:hover 
{
background-color:fff;
color:#000;
}

</style>

