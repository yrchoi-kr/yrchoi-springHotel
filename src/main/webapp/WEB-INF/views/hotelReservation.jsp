<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true"%>

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
<!-- Tempusdominus Bootstrap 4 부트스트랩4 -->
<link rel="stylesheet" href="/yrchoiHotel/resources/admin/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
<!-- Theme style AdminLTE 테마스타일 -->
<link rel="stylesheet" href="/yrchoiHotel/resources/admin/dist/css/adminlte.min.css">
<!-- HotelReservation CSS 임포트 -->
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
            <button onclick="window.location.href='room'" class="btn btn-secondary btn-lg">
                객실관리
            </button>
            <button onclick="window.location.href='hotelReservation'" class="btn btn-primary btn-lg" name="user_id" value="{user_id:yr}">
                예약관리
            </button>
            <button onclick="window.location.href='logout'" class="btn btn-warning btn-lg" style="float:right;">
                로그아웃
            </button>
        </div>
	</header>
	<p style="color:white;">환영합니다 ${loginid}</p>
    <!-- //헤더상단메뉴영역영역 -->
    <!-- 메인콘텐츠영역 -->
    <div id="container">
        <!-- 갤러리최근게시물영역 -->
        <div style="float: left; width: 30%;padding-left:2%;margin-top: 5%;">
            <div>
                <h2 style="border: 1px solid; width: 370px;color: white;text-align: center;;border-radius:10px;">검색</h2>
            </div>
            <div class="about_box" style="border: 1px solid;color: white;border-radius:10px; width: 370px;" >
                <div>
                숙박기간 
                <input type = date style= "color:black;width:37%;"id =checkinSearch name =resDate> ~ <input type = date id= checkoutSearch style= "color:black;width:37%;" name =resDate>
                </div>
                <div style="margin-top: 5%;float: left;width: 190px; " >
                객실분류 
            	<select size=1 class="form-control" id=roomTypeS2 style="width:99%;margin-left:5%">
            		<option value="">전체</option>         
					<c:forEach items="${Rtype}" var="type">
					 	<option value="${type.typeCode}">
					 		${type.name} 
					 	</option>
                 	</c:forEach>
                </select>         
                </div>
               <div>
               <button class="btn btn-secondary" style="color:white; width:120px; height:40px;margin-top: 30px;margin-left: 22px;"  id=btnSearch>검색</button>
               </div>
            </div>
            <h2 style="border: 1px solid; width: 71%;color: white;text-align: center;;border-radius:10px;">예약가능 객실</h2>
            <div class="about_box" style="border: 1px solid; width: 71%;color: white;text-align: center;border-radius:10px;">
                <select class="form-control" id ="leftR" size="10" >
					<!--Ajax로 내용 채움-->
                </select>
            </div>
        </div>
        <div class="reservationMid" style=" float: left; width: 32%;padding-left:8%;margin-top: 5%;">
            <h2 style="border: 1px solid; width: 360px;color: white;text-align: center;;border-radius:10px;">예약 관리</h2>
            <div>
	            <table style="border-collapse: separate;border-spacing: 0 2px; width: 360px;" >
	                <tr>
	                    <div class="form-group">
	                        <td style="color: white;border-radius: 5px;text-align: center;">객실이름</td>
	                        <td>
	                            <div class="col-sm-12">
	                                <input type="text" class="form-control" id=roomName placeholder="객실이름">
	                            </div>
	                        </td>
	                    </div>
	                </tr>
	                <tr>
	                <tr style="margin-top: 30px;" id=roomTypeSTable >
	                    <td style="color: white;border-radius: 5px;text-align: center;">객실분류</td>
	                    <td>
 							<select size=4 class="form-control" id=roomTypeS style="width:90%;margin-left:5%">         
								<c:forEach items="${Rtype}" var="type">
									 <option value="${type.typeCode}">
									 	${type.name} 
									 </option>
	                    		</c:forEach>
                            </select>
	                    </td>
	                </tr>
	                <tr>
	                    <td style="color: white;border-radius: 5px;text-align: center;">예약인원</td>
	                    <td>                              
	                        <div class="col-sm-12">
	                            <input type="number" class="form-control" id=roomPeople placeholder="예약인원" required>
	                        </div>
	                    </td>
	                </tr>
	                <tr id=roomCepaTable>
	                    <td style="color: white;border-radius: 5px;text-align: center;">최대인원</td>
	                    <td>                              
	                        <div class="col-sm-12">
	                            <input type="number" class="form-control" id=roomCepa placeholder="최대인원">
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <td style="color: white;border-radius: 5px;text-align: center;">예약기간</td>
	                    <td>
	                        <div class="col-sm-12">
	                            <input type = date style= "color:black;width:48%;font-size:13px;" id=checkin name =resDate required><text style="color: white;">~</text><input type = date style= "color:black;width:48%;font-size:13px;" id=checkout name =resDate required>
	                        </div>
	                    </td>
	                </tr>
	                <tr id=totalPriceTable>
	                    <td style="color: white;border-radius: 5px;text-align: center;">총 숙박비</td>
	                    <td>
	                        <div class="col-sm-12">
	                            <input type="money" class="form-control" id=totalPrice val="" placeholder="총 숙박비" title="클릭시 숙박비 계산">
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <td style="color: white;border-radius: 5px;text-align: center;">예약자명</td>
	                    <td>
	                        <div class="col-sm-12">
	                            <input type="text" class="form-control" id=booker placeholder="예약자명" required>
	                        </div>
	                    </td>
	                </tr>
	                <tr>
	                    <td style="color: white;border-radius: 5px;text-align: center;">예약자<br>모바일</td>
	                    <td>
	                        <div class="col-sm-12">
	                            <input type="text" class="form-control" id=mobile placeholder="예약자 모바일" required>
	                            <input type="hidden" id=bookcode class="form-control" val="">
	                            <input type="hidden" id=roomcode class="form-control" val="">
	                        </div>
	                    </td>
	                </tr>
	            </table>
            </div>
            <div style="margin-left:90px;margin-top: 3%;">
                <button class="btn btn-primary" type="submit" name =createRoom style="width:55px;" id=btnInsert onclick="">등록</button>
                <button class="btn btn-danger" type="submit" name =deleteRoom  style="width:55px;" id=btnDelete onclick="">삭제</button>
                <button class="btn btn-warning" type="reset" name =clearForm  style="width:60px;" id=btnClear onclick="">Clear</button>
            </div>
        </div>
        <div style=" float: right;padding-left:7%;width: 37%;margin-top: 5%;">
            <h2 style="border: 1px solid; width: 370px;color: white;text-align: center;;border-radius:10px;" title="객실이름/예약인원/예약기간/예약자명/예약자연락처/예약코드">예약된 객실(전체)</h2>
            <div class="about_box" style="border: 1px solid; width: 370px;color: white;text-align: center;border-radius:10px;word-wrap: break-word;">
                <select class="form-control" id =bookedRoom size="10" style=""  title="객실이름/예약인원/예약기간/예약자명/예약자연락처/예약코드">
					<!--Ajax로 내용 채움-->
                </select>
            </div>
        </div>
        <div style=" float: right;padding-left:7%;width: 37%;">
            <h2 style="border: 1px solid; width: 370px;color: white;text-align: center;;border-radius:10px;" title="객실이름/예약인원/예약기간/예약자명/예약자연락처/예약코드">예약된 객실(검색)</h2>
            <div class="about_box" style="border: 1px solid; width: 370px;color: white;text-align: center;border-radius:10px;word-wrap: break-word;">
                <select class="form-control" id =bookedRoomSearch size="10" style=""  title="객실이름/예약인원/예약기간/예약자명/예약자연락처/예약코드 ///검색 시 활성화">
					<!--Ajax로 내용 채움-->
                </select>
            </div>
        </div>
    </div>

    <!-- //메인콘텐츠영역 -->
</body>

<script src='http://code.jquery.com/jquery-3.5.0.js'></script>
<script>

$(document)
	.ready(function(){
		$.post("http://localhost:8080/yrchoiHotel/getRoomList",{},function(result){
			console.log(result);
			$.each(result,function(ndx,value){
				str='<option value="'+value['roomcode']+'">'+value['roomname']+' '+
				value['typename']+' '+value['howmany']+' '+value['howmuch']+'</option>';
				$('#leftR').append(str);
			})
		},'json');
	})
	.on('click','#leftR option',function(){
		var textR = $(this).text();
		textR = $.trim(textR);
		console.log(textR);
		textR = textR.split(" ");
	    $('#roomName').val(textR[0]); 
	    /* $('#roomTypeS option:contains("'+textR[1]+'")').attr("selected", true); */
	    /* console.log('#roomTypeS option:contains("'+textR[1]+'")'); */
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
		$('#roomcode').val($('#leftR option:selected').val());
	    $('#checkin').val($('#checkinSearch').val());
		$('#checkout').val($('#checkoutSearch').val());
	    return false; //stop bubbling
	})	
	.ready(function(){
		$.post("http://localhost:8080/yrchoiHotel/getBookingList",{},function(result){
			console.log(result);
			$.each(result,function(ndx,value){
				str2='<option value="'+value['roomcode']+'">'+value['roomname']+' '+
				value['person']+' '+value['checkin'].replace("2021-","")+' '+value['checkout'].replace("2021-","")+' '+value['booker']+' '+value['mobile']+' '+value['bookcode']+'</option>';
				$('#bookedRoom').append(str2);
			})
		},'json');
	})
	
	.on('click','#bookedRoom option',function(){
		var textB = $(this).text();
		textB = $.trim(textB);
		console.log(textB);
		textB = textB.split(" ");
	    $('#roomName').val(textB[0]); 
	    /* $('#roomTypeS option:contains("'+textR[1]+'")').attr("selected", true); */
/*   	    if(textB[1] == "Suite"){
	    	 $("#roomTypeS").val("1").prop("selected", true);
	    }
	    if(textB[1] == "Family"){
	    	 $("#roomTypeS").val("2").prop("selected", true);
	    }
	    if(textB[1] == "Double"){
	    	 $("#roomTypeS").val("3").prop("selected", true);
	    }
	    if(textB[1] == "Single"){
	    	 $("#roomTypeS").val("4").prop("selected", true);
	    }  */ 
	    $('#checkin').val('2021-'+textB[2]);
		$('#checkout').val('2021-'+textB[3]);
		$('#roomPeople').val(textB[1]);
		$('#booker').val(textB[4]);
		$('#mobile').val(textB[5]);
		$('#bookcode').val(textB[6]);
		$('#roomcode').val($('#bookedRoom option:selected').val());
		console.log($('#bookcode').val());
		console.log($('#roomcode').val());
		
	    return false; //stop bubbling
	})
	.on('click','#btnInsert',function(){
		let roomcode=$('#roomcode').val();
		let person=$('#roomPeople').val();
		let checkin= $('#checkin').val();
		let checkout= $('#checkout').val();
		let name=$('#booker').val();
		let mobile=$('#mobile').val();
		let bookcode=$('#bookcode').val();
		console.log(bookcode);
/* 		console.log($('#roomPeople').val());
		console.log($('#roomcode').val());
		console.log($('#checkin').val());
		console.log($('#checkout').val());
		console.log($('#booker').val());
		console.log($('#mobile').val()); */
		if(bookcode==''){
			$.post('http://localhost:8080/yrchoiHotel/addBooking',
					{roomcode:roomcode,person:person,checkin:checkin,checkout:checkout,name:name,mobile:mobile},
					function(result){
						if(result=='ok'){
							location.reload();
						}
					},'text');
		}else {
			$.post('http://localhost:8080/yrchoiHotel/updateBooking',
					{bookcode:bookcode,roomcode:roomcode,person:person,checkin:checkin,checkout:checkout,name:name,mobile:mobile},
					function(result){
						if(result=='ok'){
							location.reload();
						}
					},'text');		
		}	
	})
	.on('click','#btnClear',function(){
		$("#roomName,#roomTypeS,#roomCepa,#roomPrice,#roomPeople,#mobile,#bookcode,#roomcode,#booker,#checkin,#checkout").val("");
		$('#bookedRoom option:selected').remove();
		$('#leftR option:selected').remove();

	})
	.on('click','#btnDelete',function(){
		$.post('http://localhost:8080/yrchoiHotel/deleteBooking',{bookcode:$('#bookcode').val()},
		function(result){
			console.log(result);
			if(result=="ok"){
				$('#btnClear').trigger('click');
				$('#bookedRoom option:selected').remove();
				$('#bookedRoomSearch option:selected').remove();
			}
		},'text');
	})

	.on('focus','#totalPrice',function(){
	 	if($('#checkout').val()!=""){
			var textD = $('#leftR option:selected').text();
			textD = $.trim(textD);
			console.log(textD);
			textD = textD.split(" ");
			console.log(textD[4]);
	 		
			let start_dt=$('#checkin').val();
			let end_dt=$('#checkout').val();
/* 			console.log(end_dt);
			console.log(start_dt); */
			let start = new Date(start_dt.substr(0,4),start_dt.substr(5,2),start_dt.substr(8,2));
			let end = new Date(end_dt.substr(0,4),end_dt.substr(5,2),end_dt.substr(8,2));
/* 			console.log(start);
			console.log(end); */
			let diffTime = Math.abs(end-start);
			let diffDays = Math.ceil(diffTime/(1000*60*60*24));
/* 			console.log(diffTime);
			console.log(diffDays); */
			let price = Number(textD[4]);
/* 			console.log(price); */
			
			let total = price*diffDays; 
/* 			console.log(total); */
			$('#totalPrice').val(total);
		} 
	    return false; //stop bubbling
	})	

	.on('click','#btnSearch',function(){
		$("#leftR option").remove();
		$("#bookedRoomSearch option").remove();
		let checkin= $('#checkinSearch').val();
		let checkout= $('#checkoutSearch').val();
		$.post("http://localhost:8080/yrchoiHotel/getBookingListSearch",
		{checkin:checkin,checkout:checkout},
		function(result){
			console.log(result);
			$.each(result,function(ndx,value){
				str2='<option value="'+value['roomcode']+'">'+value['roomname']+' '+
				value['person']+' '+value['checkin'].replace("2021-","")+' '+value['checkout'].replace("2021-","")+' '+value['booker']+' '+value['mobile']+' '+value['bookcode']+'</option>';
				$('#bookedRoomSearch').append(str2);
			})
		},'json');
		let typecode = ($('#roomTypeS2 option:selected').val());
		console.log(typecode);	
		if(typecode==""){
			$.post("http://localhost:8080/yrchoiHotel/getRoomListSearchAll",
					{checkin:checkin,checkout:checkout}
					,function(result){
						console.log(result);
							$.each(result,function(ndx,value){
								str='<option value="'+value['roomcode']+'">'+value['roomname']+' '+
								value['typename']+' '+value['howmany']+' '+value['howmuch']+'</option>';
								$('#leftR').append(str);
							})						
					},'json');
		}else{
			$.post("http://localhost:8080/yrchoiHotel/getRoomListSearch",
					{checkin:checkin,checkout:checkout,typecode:typecode}
					,function(result){
						console.log(result);
							$.each(result,function(ndx,value){
								str='<option value="'+value['roomcode']+'">'+value['roomname']+' '+
								value['typename']+' '+value['howmany']+' '+value['howmuch']+'</option>';
								$('#leftR').append(str);
							})	
					},'json');		
		}
	})
	
	.on('click','#bookedRoomSearch option',function(){
		var textB = $(this).text();
		textB = $.trim(textB);
		console.log(textB);
		textB = textB.split(" ");
	    $('#roomName').val(textB[0]); 
	    /* $('#roomTypeS option:contains("'+textR[1]+'")').attr("selected", true); */
/*   	    if(textB[1] == "Suite"){
	    	 $("#roomTypeS").val("1").prop("selected", true);
	    }
	    if(textB[1] == "Family"){
	    	 $("#roomTypeS").val("2").prop("selected", true);
	    }
	    if(textB[1] == "Double"){
	    	 $("#roomTypeS").val("3").prop("selected", true);
	    }
	    if(textB[1] == "Single"){
	    	 $("#roomTypeS").val("4").prop("selected", true);
	    }  */ 
	    $('#checkin').val('2021-'+textB[2]);
		$('#checkout').val('2021-'+textB[3]);
		$('#roomPeople').val(textB[1]);
		$('#booker').val(textB[4]);
		$('#mobile').val(textB[5]);
		$('#bookcode').val(textB[6]);
		$('#roomcode').val($('#bookedRoom option:selected').val());
		console.log($('#bookcode').val());
		console.log($('#roomcode').val());
		
	    return false; //stop bubbling
	})
	
	.on('blur','#checkout',function(){
		checkin= $('#checkin').val();
		checkout= $('#checkout').val();
		if(checkin >checkout){
			alert("숙박기간을 잘못 설정하셨습니다.");
		}
	    return false; //stop bubbling
	})
	
		.on('blur','#checkoutSearch',function(){
		checkin= $('#checkinSearch').val();
		checkout= $('#checkoutSearch').val();
		if(checkin >checkout){
			alert("숙박기간을 잘못 설정하셨습니다.");
		}
	    return false; //stop bubbling
	})
	
	
</script>
</html>