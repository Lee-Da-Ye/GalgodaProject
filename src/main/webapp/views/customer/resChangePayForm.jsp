<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.customer.model.vo.Reservation" %>
<%
    Reservation selectedReservation = (Reservation)request.getAttribute("selectedReservation");
%>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Change Pay Form</title>
<style>


		/* 내 예약 정보 칸 스타일 */
        .rev_info{
            border: 1px solid lightgray;
            width : 40%;
            height: 80%;
            margin-right: 20px;
            margin-top: -50px;
            display: flex;
            flex-direction: column;
        }

        .rev_info_title{
            background-color: rgb(235, 231, 227);
            height: 10%;
            text-align: center;
            line-height: 50px;
            margin-bottom: 10px;
            
        }
        .checkinout_info{
            display: flex;
            flex-direction: row;
        }
        #payment_info{
            display: flex;
            flex-direction: row;
            margin-bottom: -60px;
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

        .vertical_line {
            height: 70px; /* 세로선의 길이 조절 */
            width: 2px; /* 세로선의 너비 조절 */
            background-color: lightgray;
            margin: 0 30px; /* 세로선의 좌우 여백 조절 */
        }
        #payment_info{
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

        #input-group {
            width: 48%; /* 부모 요소의 절반 너비를 가지도록 설정 */
            box-sizing: border-box; /* 너비가 컨텐츠 박스 기준으로 설정되도록 함 */
            margin-bottom: 10px; /* 입력 요소 사이의 간격 조절 */
        }

        #input-group label {
            display: block; /* 라벨을 블록 요소로 변경하여 위에서 아래로 표시되도록 함 */
        }
        
        #iamportPayment{
            background-color: rgb(99, 76, 70);
            color: white;
            margin-top: 120px;
        }
        
</style>

	<!-- 포트원 가상 결제하기 jQuery --> 
    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script> 
	<!-- iamport.payment.js --> 
    <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>

<script>
	$.ajax({
	    url: '<%=request.getContextPath()%>/getPaymentInfo.res', // 서버에서 결제 정보를 가져올 엔드포인트
	    type: 'GET',
	    dataType: 'json',
	    success: function(data) {
	        // 서버에서 반환된 데이터를 사용하여 결제 정보를 업데이트합니다.
	        $('input[name="buyer_email"]').val(data.email);
	        $('input[name="buyer_name"]').val(data.name);
	        $('input[name="buyer_tel"]').val(data.tel);
	        
	        // 이후 결제 금액을 계산하고 업데이트하는 로직을 추가합니다.
	        updatePaymentAmount();
	    },
	    error: function(xhr, status, error) {
	        console.error('Error:', error);
	    }
	});



	// 결제하기 api 연동
		
	$(document).ready(function(){ 
		$("#iamportPayment").click(function(){ 
	    	payment(); //버튼 클릭하면 호출 
	    }); 
	})
	
	
	//버튼 클릭하면 실행
	function payment() {
    $.ajax({
        url: "<%=request.getContextPath()%>/getPaymentInfo.res?resNo=" + <%=selectedReservation.getResNo()%>,
        type: "GET",
        dataType: "json",
        success: function(response) {
            var hotelName = response.hotelName;
            var amount = response.amount;
            var buyerEmail = response.buyerEmail;
            var buyerName = response.buyerName;
            var buyerTel = response.buyerTel;

            IMP.init('imp81400601'); // 아임포트 관리자 콘솔에서 확인한 '가맹점 식별코드' 입력
            IMP.request_pay({
                // param
                pg: "kakaopay.TC0ONETIME", // pg사명 or pg사명.CID (잘못 입력할 경우, 기본 PG사가 띄워짐)
                pay_method: "card", // 지불 방법
                merchant_uid: hotelName, // 가맹점 주문번호 (아임포트를 사용하는 가맹점에서 중복되지 않은 임의의 문자열을 입력)
                name: hotelName, // 결제창에 노출될 상품명
                amount: amount,
                buyer_email: buyerEmail,
                buyer_name: buyerName,
                buyer_tel: buyerTel
            }, function(rsp) { // callback
                if (rsp.success) {
                    alert("결제가 완료되었습니다.");
                    window.location.href = "<%=request.getContextPath()%>/resManagement.cu?page=1";
                } else {
                    alert("결제에 실패했습니다.");
                    window.location.href = "<%=request.getContextPath()%>/resManagement.cu?page=1";
                }
            }); 
        }
    });
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

            <div class="page_content" style="display: flex; flex-direction : row; justify-content: center; align-items: center; margin-top:-20px;"> 

                <div class="rev_info">
                    <div class="rev_info_title"><b>내 예약 정보</b></div>
                    <div style="padding: 10px; display: flex; flex-direction: column;">
                    
                        <div>
                            <h4><%=selectedReservation.getHotelName() %> - <%=selectedReservation.getRoName() %></h4>
                            <div><img src="<%=contextPath %>/<%=selectedReservation.getImgPath() %>" style="width: 100%; height: 200px; margin-bottom: 10px;"></div>

                        </div>
                        <div class="checkinout_info">
                            <div class="check_in">
                                체크인 <br>
                                <%=selectedReservation.getDateIn() %> <br>
                                15:00
                            </div>
                            <div class="vertical_line"></div>
                            <div class="check_out">
                                체크아웃 <br>
                                <%=selectedReservation.getDateOut() %> <br>
                                11:00
                            </div>
                        </div>

                        <br><br>
                        
                        <div id="payment_info">
                            <div class="total_payment1"><b>결제예정금액</b></div>
                            <div class="total_payment2"><%=selectedReservation.getPay() %>원</div>
                        </div>
                        
                        <div id="payment_info">
                            <div class="total_payment1"><b>총 인원 수</b></div>
                            <div class="total_payment2"><%=selectedReservation.getResPeople() %>명</div>
                        </div>
                        
                        <button type="button" id="iamportPayment" class="btn form-control">결제하기</button>
                        
                        <br><br>
                    </div>
                </div>
               
                    
            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>