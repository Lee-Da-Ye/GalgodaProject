<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.galgoda.hotel.model.vo.Hotel"%>
<%@page import="com.galgoda.customer.model.vo.Reservation"%>
<%
	Hotel h = (Hotel)request.getAttribute("hotel");
	Reservation r = (Reservation)request.getAttribute("r");
	long numberOfNights = (long)request.getAttribute("numberOfNights");
	
	long totalPrice = (r.getRoPrice())*numberOfNights*(r.getRoomCount());
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Hotel Detail Form</title>
<style>
	
		.page_content {

            width: 100%; 
            padding-left: 30px;
            padding-right: 30px;
            /* border: 1px solid red; */
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            margin-top : -100px;
        }
		.mypage_header {
            margin: 0 auto;
            width: 600px;
        }
        
        /* 내 예약 정보 칸 스타일 */
        .rev_info{
            border: 1px solid lightgray;
            width : 55%;
            height: 82%;
            display: flex;
            flex-direction: column;

        }
        .rev_content{
        	padding-left : 100px;
        	
        }

        .rev_info_title{
            background-color: rgb(235, 231, 227);
            height: 10%;
            width: 100%;
            text-align: left;
            line-height: 50px;
            margin-bottom: 10px;
            
        }
        .checkinout_info{
            display: flex;
            flex-direction: column;
        }
        .payment_info{
            display: flex;
            flex-direction: row;
        }
        .checkinout_info{
            display: flex;
            justify-content: space-evenly;
        }
        .check_info {
            display: flex;
            align-items: center;
            justify-content: center;
            
        }

        .horizontal_line {
            height: 2px;
            width: 200px; 
            background-color: lightgray;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .payment_info{
            display: flex;
            justify-content: space-between;
        }


        /* 결제수단/정보 칸  스타일 */
        .pay_info{
            border: 1px solid lightgray;
            width : 40%;
            height: 80%;
            margin-left: 20px;
        }
        .pay_info_title{
            background-color: rgb(235, 231, 227);
            height: 10%;
            text-align: center;
            line-height: 50px;
            margin-bottom: 10px;
            
        }
        .form-group {
        display: flex;
        justify-content: space-between; /* 자식 요소들을 양 끝에 정렬 */
        flex-wrap: wrap; /* 요소들이 한 줄에 모두 표시되도록 설정 */
        }

        .input-group {
            width: 48%; /* 부모 요소의 절반 너비를 가지도록 설정 */
            box-sizing: border-box; /* 너비가 컨텐츠 박스 기준으로 설정되도록 함 */
            margin-bottom: 10px; /* 입력 요소 사이의 간격 조절 */
        }

        .input-group label {
            display: block; /* 라벨을 블록 요소로 변경하여 위에서 아래로 표시되도록 함 */
        }
        #next_btn{
            background-color: rgb(99, 76, 70);
            color: white;
            margin-top: 10px;
            
            
        }

</style>
<script>

	//휴대폰 번호 입력 시 자동 - 넣기
	const hypenTel = (target) => {
	target.value = target.value
	  .replace(/[^0-9]/g, '')
	  .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}

</script>
</head>
<body>
	<div class="wrap">
	
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar" style="display: none;">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="" data-toggle="collapse" data-target="#demo">메뉴1</a>
                    </li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">하위메뉴</a>
                        </div>
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo2">메뉴2</a>
                    </li>
                        <div id="demo2" class="collapse" style="margin-left: 30px;">
                            <a href="">하위메뉴</a>
                        </div>
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">메뉴3</a>
                    </li>
                        <div id="demo3" class="collapse" style="margin-left: 30px;">
                            <a href="">하위메뉴</a>
                        </div>
                    
                </ul>
            </div>

            <div class="page_content"> 

                <div class="rev_info">
                    <div class="rev_info_title" ><b style="margin-left: 15px">예약하기</b></div>
                   
                    
                    <div style="width: 570px; padding: 10px; display: flex; flex-direction: column;">
                        
                       <div class="rev_content"> 
                        
                        <div style="text-align: left">
                            <h5>호텔정보</h5>
                            <br>
                            <b><%=h.getHotelName() %></b>
                            <small><%=h.getHotelAddress() %>&nbsp;<%=h.getHotelDetailAdd() %> </small><br><br>
                            
                        </div>
                        <div style="width: 570px; padding-bottom: 10px; display: flex; flex-direction: row;">
                            
                            <div><img src="<%=contextPath %>/<%=h.getImgPath() %>" style="width: 200px; height: 200px; padding-right: 10px;"></div>
                            <div style="width: 570px; padding: 10px; display: flex; flex-direction: column;">
                                <div class="roomInfo" style="padding: 10px">
                                    <%=numberOfNights %>박 <br>
                                    <%=r.getRoName() %>&nbsp;-&nbsp;객실&nbsp;<%=r.getRoomCount() %>개
                                </div>
                             <div class="checkinout_info" style="padding: 10px;">
                                 <div class="check_in">
                                     체크인 <br>
                                     <%=r.getDateIn() %> 15:00
                                 </div>
                                 <div class="horizontal_line"></div>
                                 
                                 <div class="check_out">
                                     체크아웃 <br>
                                     <%=r.getDateOut() %> 11:00
                                 </div>
                             </div>
                            </div>
                            
                        </div>
                       

                        <br>

                        <div class="revInfo">
                            <div class="total_payment1">
                            	<h5>예약자 정보</h5>
                            </div>
                        </div>
                        <br>
                        <form action="" id="order-form" style="font-size: 16px;">
                            <fieldset>
                                <legend style="font-size: 16px;"><b>고객정보</b></legend>
                    
                                <label for="userName" style="font-size: 16px;">이름 : </label>
                                <input type="text" class="form-control" id="userName" name="userName">

                                <label for="email">E-mail : </label>
                                <input type="email" class="form-control" id="email" name="email">
                    
                                <label for="phone">전화번호 : </label>
                                <input type="text" oninput="hypenTel(this)" class="form-control" id="phone" name="phone">
                    
                                <label for="number">투숙객 수 : </label>
                                <input type="number" min="1" class="form-control" id="num" name="num">
                                <br>
                            </fieldset>
                    
                            
                            
                            <fieldset>
                                <legend style="font-size: 16px;"><b>추가옵션</b></legend>
                                <input type="checkbox" name="option" id="breakfast" value="조식">
                                <label for="breakfast">조식</label>
                    			&nbsp;
                                <input type="checkbox" name="option" id="add_bed" value="베드추가">
                                <label for="add_bed">베드추가</label>
                    			&nbsp;
                                <input type="checkbox" name="option" id="rate_checkin" value="레이트체크인">
                                <label for="rate_checkin">레이트체크인</label>
                    			&nbsp;
                    			<br>
                                <input type="checkbox" name="option" id="spa" value="스파패키지">
                                <label for="spa">스파패키지</label>
								&nbsp;
                                <input type="checkbox" name="option" id="freecancel" value="무료취소">
                                <label for="spa">무료취소</label>
                            </fieldset>
                        <br><br>

                        <div class="payment_info">
                            <div class="total_payment1"><b>결제예정금액</b></div>
                            <input type="hidden" name="pay_method" value="카카오페이">
                            <div class="total_payment2"><%=totalPrice %>원</div>
                        </div>
                        
                        <button type="button" id="next_btn" class="btn form-control">결제하기</button>
                        <br><br><br><br><br><br><br><br><br><br><br>
                        
                        </form>
                        
                        
                       </div>
                       
                       
                    </div>
                </div>

			
                
                
            
            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>