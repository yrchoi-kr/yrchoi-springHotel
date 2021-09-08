<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<script>
//로그인 실패 전용 메세지
if("${param.msg}" == "fail") {
	alert("로그인 실패입니다. 다시 입력해 주세요!");
}
</script>
<!-- 게시판용 CSS 임포트 -->
<link rel="stylesheet" href="/resources/css/board.css">

    <!-- //메인상단위치표시영역 -->
	
    <!-- 메인본문영역 -->
    <div class="bodytext_area box_inner">
        <!-- 폼영역 -->
        <form name="login_form" action="/yrchoiHotel/check_user" class="appForm" method="post">
            <fieldset>
                <legend>로그인폼</legend>
                <p class="info_pilsoo pilsoo_item">필수입력</p>
                <ul class="app_list">
                    <li class="clear">
                        <label for="id_lbl" class="tit_lbl pilsoo_item">아이디</label>
                        <div class="app_content"><input autofocus type="text" name="user_id" class="w100p" id="id_lbl" placeholder="아이디를 입력해주세요" required/></div>
                    </li>
                    <li class="clear">
                        <label for="password_lbl" class="tit_lbl pilsoo_item">암호</label>
                        <div class="app_content"><input type="password" name="user_pw" class="w100p" id="password_lbl" placeholder="암호를 입력해주세요" required/></div>
                    </li>

                </ul>
                <p class="btn_line">
                <button type="submit" class="btn_baseColor" id=formLogin>로그인</button>
                <button type="button" class="btn_baseColor" onclick="window.location.href='/yrchoiHotel'">돌아가기</button>
                <button onclick="window.location.href='newbie'" class="btn btn-primary btn-lg" margin-left:5px;">회원가입</button>
                </p>	
            </fieldset>
        </form>
        <!-- //폼영역 -->
    </div>
    <!-- //메인본문영역 -->
</div>
<!-- //메인콘텐츠영역 -->

<%@ include file="./include/footer.jsp" %>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.2.js" charset="utf-8"></script>
<script>
$(document).on('submit','#formLogin',function(){
	let pstr = $.trim($('input[name=user_id]').val());
	$('input[name=userid]').val(pstr);
	pstr=$.trim($('input[name=passcode]').val());
	$('input[name=userid]').val(pstr);
	if($('input[name=user_id]').val()==''){
		alert('로그인 아이디를 입력하시오.');
		return false;
	}
	if($('input[name=passcode]').val()==''){
		alert('비밀번호를 입력하시오.');
		return false;
	}
});
</script>