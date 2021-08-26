<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./include/header.jsp" %>
<!-- 게시판용 CSS 임포트 -->
<link rel="stylesheet" href="/resources/home/css/board.css">
<!-- html5가 아닌 JS로 유효성 검사 코어 2개 임포트 -->
<script src="/resources/home/js/jquery.validate.js"></script>
<script src="/resources/home/js/additional-methods.js"></script>
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
			<fieldset>
				<legend>입력하신 정보</legend>
				<ul class="app_list">
					<li class="clear">
						<label for="user_id_lbl" class="tit_lbl pilsoo_item">사용자ID</label>
						<div class="app_content"><p>${user_id}<p></div>
					</li>
					<li class="clear">
						<label for="password_lbl" class="tit_lbl pilsoo_item">암호</label>
						<div class="app_content">
							<p>${user_pw}<p>
						</div>
					</li>
					<li class="clear">
						<label for="user_name_lbl" class="tit_lbl pilsoo_item">사용자이름</label>
						<div class="app_content"><p>${user_name}<p></div>
					</li>
					<li class="clear">
						<label for="email_lbl" class="tit_lbl pilsoo_item">이메일</label>
						<div class="app_content"><p>${user_email}<p></div>
					</li>
				</ul>
				<p class="btn_line">
				<button  onclick="window.location.href='/yrchoiHotel'" class="btn_baseColor" id="btn_insert">돌아가기</button>
				</p>	
			</fieldset>
		<!-- //폼영역 -->
	</div>
	<!-- //메인본문영역 -->
</div>
<!-- //메인콘텐츠영역 -->

<%@ include file="./include/footer.jsp" %>
