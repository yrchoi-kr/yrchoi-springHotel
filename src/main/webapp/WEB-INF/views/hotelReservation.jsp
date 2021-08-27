<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>예약관리</title>
<!-- 제이쿼리 코어 임포트(아래) -->
<script src='http://code.jquery.com/jquery-3.5.0.js'></script>
<!-- 화면 초기화 시키는 reset style import :크로스브라우징 처리하기위해서-->
<!-- 크롬, IE, 엣지, Safari, firefox의 h1, p, ul, div 태그의 크기가 조금씩 다름 -->
<!-- 작업한 결과가 모든 브라우저(크로싱 브라우저)에 똑같이 보이게 하기 위한 절차가 reset.css(아래 작업내용) -->
<link rel="stylesheet" href="/yrchoiHotel/resources/css/hotelReservation.css">
<!-- 부트스트랩CSS코어 임포트 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부트스트랩JS코어 임포트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body class=abody>
    
    <!-- 헤더상단메뉴영역영역 -->
	<header id="header">
		<div class="header_area box_inner clear" style="padding:10px;">
            <button onclick="window.location.href='/yrchoiHotel'" class="btn btn-primary btn-lg">
                객실관리
            </button>
            <button onclick="window.location.href='hotelReservation'" class="btn btn-secondary btn-lg">
                예약관리
            </button>
            <button onclick="window.location.href='login'" class="btn btn-warning btn-lg" style="float:right;">
                로그아웃
            </button>
        </div>
	</header>
    <!-- //헤더상단메뉴영역영역 -->
    <!-- 메인콘텐츠영역 -->
    <div id="container">
        <!-- 갤러리최근게시물영역 -->
        <div style="float: left; width: 33%;padding-left:5%;margin-top: 5%;">
            <div>
                <h2 style="border: 1px solid; width: 71%;color: white;text-align: center;;border-radius:10px;">검색</h2>
            </div>
            <div class="about_box" style="border: 1px solid;color: white;border-radius:10px;" >
                <div>
                숙박기간 
                <input type = date style= "color:black;width:35%;"name =resDate> ~ <input type = date style= "color:black;width:35%;" name =resDate>
                </div>
                <div style="margin-top: 5%;">
                객실분류 
                <input type = text name =roomType style="color:black;height:40px;">
                </div>
            </div>
            <h2 style="border: 1px solid; width: 71%;color: white;text-align: center;;border-radius:10px;">예약가능 객실</h2>
            <div class="about_box" style="border: 1px solid; width: 71%;color: white;text-align: center;border-radius:10px;">
                <table>
                    <tr>
                        <p class="txt">한라산</p>
                    </tr>
                    <tr>
                        <p class="txt">백두산</p>
                    </tr>
                    <tr>                        
                        <p class="txt">장발산</p>                 
                    </tr>
                </table>
            </div>
        </div>
        <div class="reservationMid" style=" float: left; width: 33%;padding-left:5%;margin-top: 5%;">
            <h2 style="border: 1px solid; width: 60%;color: white;text-align: center;;border-radius:10px;">예약 관리</h2>
            <table style="border-collapse: separate;border-spacing: 0 2px;">
                <tr>
                    <div class="form-group">
                        <td style="color: white;border-radius: 5px;text-align: center;">객실이름</td>
                        <td>
                            <div class="col-sm-12">
                                <input type="text" class="form-control" placeholder="객실이름">
                            </div>
                        </td>
                       
                    </div> 
                </tr>
                <tr>
                <tr style="margin-top: 30px;">
                    <td style="color: white;border-radius: 5px;text-align: center;">객실분류</td>
                    <td>
                        <select class="form-control" style="width:86%;margin-left:7%">
                        <option>Suite Room</option>
                        <option>Family Room</option>
                        <option>Double Room</option>
                        <option>Single Room</option>
                        <option>Domitory</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td style="color: white;border-radius: 5px;text-align: center;">숙박가능인원</td>
                    <td>                              
                        <div class="col-sm-12">
                            <input type="number" class="form-control" placeholder="숙박가능인원">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="color: white;border-radius: 5px;text-align: center;">1박요금</td>
                    <td>
                        <div class="col-sm-12">
                            <input type="money" class="form-control" placeholder="1박요금">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="color: white;border-radius: 5px;text-align: center;">총 숙박비</td>
                    <td>
                        <div class="col-sm-12">
                            <input type="money" class="form-control" placeholder="총 숙박비">
                        </div>
                    </td>
                </tr>
                <tr>
                    <td style="color: white;border-radius: 5px;text-align: center;">예약자 모바일</td>
                    <td>
                        <div class="col-sm-12">
                            <input type="money" class="form-control" placeholder="예약자 모바일">
                        </div>
                    </td>
                </tr>
            </table>
            <div style="margin-left:10%;margin-top: 3%;">
                <button class="btn btn-primary" type="submit" name =createRoom style="width:15%;" onclick="">등록</button>
                <button class="btn btn-danger" type="submit" name =deleteRoom  style="width:15%;" onclick="">삭제</button>
                <button class="btn btn-warning" type="reset" name =clearForm  style="width:15%;" onclick="">Clear</button>
            </div>
        </div>
        <div style=" float: left; width: 33%;padding-left:5%;margin-top: 5%;">
            <h2 style="border: 1px solid; width: 60%;color: white;text-align: center;;border-radius:10px;">예약된 객실</h2>
            <div class="about_box" style="border: 1px solid; width: 60%;color: white;text-align: center;border-radius:10px;">
                <table>
                    <tr>
                        <p class="txt">한라산</p>
                    </tr>
                    <tr>
                        <p class="txt">백두산</p>
                    </tr>
                    <tr>                        
                        <p class="txt">장발산</p>                 
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <!-- //메인콘텐츠영역 -->
</body>
</html>