<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>객실관리</title>
<!-- 제이쿼리 코어 임포트(아래) -->
<script src='http://code.jquery.com/jquery-3.5.0.js'></script>
<!-- 화면 초기화 시키는 reset style import :크로스브라우징 처리하기위해서-->
<!-- 크롬, IE, 엣지, Safari, firefox의 h1, p, ul, div 태그의 크기가 조금씩 다름 -->
<!-- 작업한 결과가 모든 브라우저(크로싱 브라우저)에 똑같이 보이게 하기 위한 절차가 reset.css(아래 작업내용) -->
<link rel="stylesheet" href="/yrchoiHotel/resources/css/hotel.css">
<!-- 부트스트랩CSS코어 임포트 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부트스트랩JS코어 임포트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<body class=hbody>
    <!-- 헤더에서푸터까지 -->
	<!-- 헤더상단메뉴영역영역 -->
	<header id="header">
		<div class="header_area box_inner clear" style="padding:10px;">
            <button onclick="window.location.href='room'" class="btn btn-primary btn-lg">
                객실관리
            </button>
            <button type="submit" method="post" onclick="window.location.href='hotelReservation'" class="btn btn-secondary btn-lg">
                예약관리
            </button>
              <button id="booking" onclick="window.location.href='logout'" class="btn btn-warning btn-lg" style="float:right; margin-left:5px;">
                로그아웃
            </button>
        </div>

	</header>
	<p style="color:white;">환영합니다 ${loginid}</p>
	<!-- //헤더상단메뉴영역영역 -->
	<!-- 메인콘텐츠영역 -->
	<div id="container">
		<!-- 갤러리최근게시물영역 -->
        <div style="float: left; width: 33%;border-left: 10px;margin-top: 150px;">
            <h2 id =roomlist style="background-color:#2e806da1;text-align: center;width: 60%;;border-radius:10px;">객실목록</h2>
            <div class="about_box" style="width: 60%;background-color: white;text-align: center;border-radius:10px;">
                <select class="form-control" id ="leftR" size="5" >
          			<c:forEach items="${list}" var="room" varStatus="status">
	                    <option id=leftRoom${status.count} value="${room.roomcode}">
	                        ${room.roomname} ${room.typename} ${room.howmany}명 ${room.howmuch}
	                    </option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div style="float: left; width: 50%;margin-left: 6%;margin-top: 250px;">
                <table style="border-collapse: separate;border-spacing: 0 2px;">
                    <tr>
                        <div class="form-group">
                            <td style="background-color: white;border-radius: 5px;text-align: center;"><b>객실이름</b></td>
                            <td>
                                <div class="col-sm-12">
                                    <input type="text" id=roomName class="form-control" placeholder="객실이름">
                                </div>
                            </td>
                           
                        </div> 
                    </tr>
                    <tr>
                    <tr style="margin-top: 30px;">
                        <td style="background-color: white;border-radius: 5px;text-align: center;"><b>객실분류</b></td>
                        <td>
                            <select size=4 class="form-control" id=roomTypeS style="width:86%;margin-left:7%">
                           
							<c:forEach items="${Rtype}" var="type">
							 <option value="${type.typeCode}">
							 	${type.name} 
							 </option>
                    		</c:forEach>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: white;border-radius: 5px;text-align: center;"><b>숙박가능인원</b></td>
                        <td>                              
                            <div class="col-sm-12">
                                <input type="text" id=roomCepa class="form-control" placeholder="숙박가능인원">
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td style="background-color: white;border-radius: 5px;text-align: center;"><b>1박요금</b></td>
                        <td>
                            <div class="col-sm-12">
                                <input type="money" id=roomPrice class="form-control" placeholder="1박요금">
                            </div>
                        </td>
                    </tr>
                </table>
                <div style="margin: left 2%;margin-top: 3%;">
                <button class="btn btn-primary" type="submit" name =createRoom style="width:10%;" onclick="">등록</button>
                <button class="btn btn-danger" type="submit" name =deleteRoom style="width:10%;" onclick="">삭제</button>
                <button class="btn btn-warning" type="reset" name =clearForm style="width:10%;" id =btnClear onclick="">Clear</button>
                </div>
        </div>
	</div>
	<!-- //메인콘텐츠영역 -->
    <footer>

    </footer>

<!-- //헤더에서푸터까지 -->


</body>
<script src='http://code.jquery.com/jquery-3.5.0.js'></script>
<script>

/* $('.leftR option').each(function (index,item){
	console.log(item);
}) */

$(document)
	.ready(function(){
		$.post("http://localhost:8080/yrchoiHotel/getRoomList",{},function(result){
			console.log(result);
		},'json');
	})
	.on('click','#leftR option',function(){
		var textR = $(this).text();
		textR = $.trim(textR);
		console.log(textR);
		textR = textR.split(" ");
		console.log(textR[1]);
	    $('#roomName').val(textR[0]); 
	    /* $('#roomTypeS option:contains("'+textR[1]+'")').attr("selected", true); */
	    console.log(textR[1]);
	    console.log('#roomTypeS option:contains("'+textR[1]+'")');
  	    if(textR[1] == "Suite"){
	    	 $("#roomTypeS").val("1").prop("selected", true);
	    }
	    if(textR[1] == "Family"){
	    	 $("#roomTypeS").val("2").prop("selected", true);
	    }
	    if(textR[1] == "Double"){
	    	 $("#roomTypeS").val("3").prop("selected", true);
	    }
	    if(textR[1] == "Single"){
	    	 $("#roomTypeS").val("4").prop("selected", true);
	    }  
		$('#roomCepa').val(textR[3]);
		$('#roomPrice').val(textR[4]);
	    return false; //stop bubbling
	})
	.on('click','#btnClear',function(){
		$("#roomName,#roomTypeS,#roomCepa,#roomPrice").val("");
	})

</script>
</html>
