<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!-- AdminLTE for demo purposes 오른쪽메뉴-로그아웃사용 코어: 사용안함. -->
<!-- <script src="/resources/admin/dist/js/demo.js"></script> -->
</body>
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
<script src='http://code.jquery.com/jquery-3.5.0.js'></script>
<script>
// 회원가입 전용 유효성 검사 부분
$(document)
.on('submit','#btn_insert',function() {
	if($('input[name=user_name]').val()==''){
		alert ('이름을 입력하시오.');
		return false;
	}
	if($('input[name=user_id]').val()==''){
		alert('로그인 아이디를 입력하시오');
		return false;
	}
	if($('input[name=user_pw]').val()==''){
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