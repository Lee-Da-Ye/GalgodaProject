<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.customer.model.vo.Reservation" %>
<%@ page import="java.util.List" %>
<%
	
    Reservation selectedReservation = (Reservation)request.getAttribute("selectedReservation");
	List<Reservation> reservations = (List<Reservation>)request.getAttribute("reservations");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Update Form</title>

<!-- jQuery -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<!-- Pikaday -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/pikaday/css/pikaday.css">
<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>


<style>
		/* 예약 관리 페이지 */

        
        table{
            border-spacing: 10px;
            border-collapse: separate;
        }
        table th{
            width: 200px;
            height: 40px;
            background-color: rgb(235, 231, 227);
            border-radius: 5px;
            text-align: center;
            border: 1px solid lightgray;
            color: rgb(94, 94, 94);
        }

        table td{
            width:1000px;
            height: 30px;
            border-radius: 5px;
            padding-left: 5px;
        }
        .rev_button{
            background-color: rgb(235, 231, 227) !important;
            border: none;
            color: black;
        }
        #reservation_btn{
            background-color: rgb(99, 76, 70);
            color: white;
        }
      
        /* date picker 관련 스타일 */
        
        .date{
            border:none;
            width: 100%;      
        }
</style>
<script>
		
		$(document).ready(function() {
		    // 체크인 날짜 선택기
		    const pickerCheckIn = new Pikaday({
		        field: document.getElementById('checkInDate'),
		        format: 'YYYY년 MM월 DD일', // 표시 형식 변경
		        onSelect: function(selectedDate) {
		            var nextDay = new Date(selectedDate.getTime() + 24 * 60 * 60 * 1000);
		            $("#checkOutDate").datepicker("option", "minDate", nextDay);
		        }
		    });
		
		    // 체크아웃 날짜 선택기
		    const pickerCheckOut = new Pikaday({
		        field: document.getElementById('checkOutDate'),
		        format: 'YYYY년 MM월 DD일', // 표시 형식 변경
		    });
		
		    // 체크인, 체크아웃 날짜가 변경되면 포맷을 수정합니다.
		    $('#checkInDate, #checkOutDate').on('change', function() {
		        var value = $(this).val();
		        var formattedDate = moment(value, 'YYYY년 MM월 DD일').format('YYYY년 MM월 DD일');
		        $(this).val(formattedDate);
		    });
		
		    // 체크인 날짜가 변경될 때마다 체크아웃 날짜의 최소 선택일을 체크인 날짜 다음 날로 설정합니다.
		    $('#checkInDate').on('change', function() {
		        var checkInDate = moment($(this).val(), 'YYYY년 MM월 DD일');
		        pickerCheckOut.setMinDate(checkInDate.toDate());
		    });
		});

		
		$(document).ready(function() {
		    // 예약 인원이 3명이면 스위트룸만 선택 가능하도록 설정
		    $('#resPeople').change(function() {
		        var capacity = parseInt($(this).val());
		        if (capacity === 3) {
		            $("select[name='roomType'] option").each(function() {
		                if (parseInt($(this).val())%5 !== 0) { // 스위트룸이 아닌 경우 비활성화
		                    $(this).prop("disabled", true);
		                } else { // 스위트룸인 경우 활성화
		                    $(this).prop("disabled", false);
		                }
		            });
		        } else {
		            // 예약 인원이 3명이 아니면 모든 옵션 활성화
		            $("select[name='roomType'] option").prop("disabled", false);
		        }
		    });
		});
		
		// 예약인원, 룸 타입 선택에 따른 결제금액 업데이트
	   	$(document).ready(function() {
		   	 $('#checkInDate, #checkOutDate, #roomType').on('change', function() {
		         // 선택된 체크인 날짜와 체크아웃 날짜 가져오기
		         var checkInDate = moment($('#checkInDate').val(), 'YYYY년 MM월 DD일');
		         var checkOutDate = moment($('#checkOutDate').val(), 'YYYY년 MM월 DD일');
		         
		         // 숙박 일수 계산
		         var numberOfNights = getNumberOfNights(checkInDate, checkOutDate);
		         
		         // 선택된 룸 타입 가져오기
		         var roomType = parseInt($('select[name="roomType"]').val());
		         console.log(roomType);
		         // 가격 계산 : (숙박일수 * 객실 가격)
		         var roomPrice = calculateRoomPrice(roomType);
		         var totalPrice = numberOfNights * roomPrice;
		         
		         // 결제금액 변경 시 변경금액 결제하기 버튼 활성화 하기
		         // 이전 결제금액 가져오기
		         var previousAmount = parseFloat($('input[name="resPay"]').attr('data-previous-amount'));
		         
		         // 화면에 결제금액 업데이트
		         $('input[name="resPay"]').val(totalPrice);
		         
		         /*
		         // 결제금액이 변경되었는지 확인하고 변경이 있을 경우 버튼을 활성화
		         	if (previousAmount !== totalPrice) {
		             $('#paymentButton').prop('disabled', false);
		         } else {
		             $('#paymentButton').prop('disabled', true);
		         }
		         */
		         
		         //변경된 결제금액을 데이터 속성에 업데이트
		         $('input[name="resPay"]').attr('data-previous-amount', totalPrice);
		   		
		         
	     	});
		    
		    // 객실 가격 계산 함수
		    function calculateRoomPrice(roomType) {
		        // 각각의 객실 타입에 따른 가격을 반환하는 로직 작성
		        switch (roomType % 5) {
		        	case 1: // 스탠다드 싱글
		        		return 80000;
		            case 2: // 스탠다드 더블
		                return 100000; 
		            case 3: // 디럭스 트윈
		                return 150000; 
		            case 4: // 슈페리어 킹
		                return 120000; 
		            case 0: // 스위트룸
		                return 200000;
		            default:
		                return 0;
		        }
		    }
		});

		
		
	 	// 숙박 일수 계산 함수
	    function getNumberOfNights(checkInDate, checkOutDate) {
	        return checkOutDate.diff(checkInDate, 'days');
	    }
		
	 	// 폼 제출 시 선택된 객실 번호를 숨겨진 입력 필드에 저장하는 함수
	    function updateSelectedRoom() {
	        var selectedRoom = document.getElementById("roomType").value;
	        document.getElementById("selectedRoom").value = selectedRoom;
	    }
	    
	    // 폼 제출 시 호출되는 함수
	    function submitForm() {
	        updateSelectedRoom(); // 선택된 객실 번호 업데이트
	        var form = document.getElementById('updateForm');
	        form.submit(); 
	    }
		
		// 휴대폰 번호 입력 시 자동 - 넣기
		 const hypenTel = (target) => {
		 target.value = target.value
		   .replace(/[^0-9]/g, '')
		   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
		}
		 
		// 변경된 금액 결제하기 기능으로 넘어가기 버튼
		function payChangeAmount() {
			window.location.href = "<%=request.getContextPath()%>/resPayChangeAmount.cu?id=<%=selectedReservation.getResNo()%>";
		}
		
		
		// 예약 정보가 변경이 되어야 예약변경 버튼 활성화
		$(document).ready(function() {
		    // 예약 정보 변경을 감지할 변수
		    var reservationChanged = false;

		    // 예약 정보 변경 시 변수를 true로 설정
		    $('#checkInDate, #checkOutDate, #resPeople, #roomType, input[name="option"], #resName, #resPhone, #resEmail, #resPay, #resPayMethod').on('change', function() {
		        reservationChanged = true;
		        activateReservationButton();
		    });

		    // 예약 변경 버튼 활성화 함수
		    function activateReservationButton() {
		        if (reservationChanged) {
		            $('#reservation_btn').prop('disabled', false);
		        } else {
		            $('#reservation_btn').prop('disabled', true);
		        }
		    }

		    // 페이지 로드 시 호출하여 초기 상태 설정
		    activateReservationButton();
		});
		 
			
</script>


</head>
<body>
	<div class="wrap">
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">메뉴명</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" href="<%=contextPath%>/resManagement.cu?page=1" style="background-color: #634c46; color: white;">예약관리</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/wishlist.cu" data-target="#demo2">위시리스트</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/reviewlist.cu" data-target="#demo2">리뷰관리</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/personalInfo.cu" data-target="#demo3">개인정보 수정</a>
                    </li>
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                
                <div class="mypage">
            
                    <div class="res_header">
                        <h2>예약 변경 및 취소</h2>
                        <div style="border: 2px solid lightgray;"></div>
                    </div>

                    <br>

                    <div>
                        <h4><%=selectedReservation.getHotelName()%></h4>
                    </div>
    
                    <br>
    
                    <div>
                        <h4>호텔 정보</h4>
                    </div>
    
                    <form id="updateForm" action="<%=contextPath%>/resUpdate.cu" method="get">
                    	<input type="hidden" name="resNo" value="<%=selectedReservation.getResNo()%>">				
                        <div>
                            <table style="width: 80%; border-spacing: 10px; border-collapse: separate;">
                                <tr>
                                    <th style="width: 10%;">호텔명</th>
                                    <td colspan="3"><input type="text" class="form-control" required value="<%=selectedReservation.getHotelName()%>" readonly></td>
                                </tr>
                                <tr>
                                    <th>체크인</th>
                                    <td>
                                        <input type="text" id="checkInDate" name="checkInDate" class="form-control" required value="<%=selectedReservation.getDateIn()%>">
                                        <script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
                                        
                                    </td>
                                    <th>체크아웃</th>
                                    <td>
                                        <input type="text" id="checkOutDate" name="checkOutDate" class="form-control" required value="<%=selectedReservation.getDateOut()%>">
                                    	<script src="https://cdn.jsdelivr.net/npm/pikaday/pikaday.js"></script>
                                    </td>
                                </tr>
                                
                                
                                <tr>
                                    <th>예약인원</th>
                                    <td colspan="3">
                                        <select id="resPeople" name="resPeople" class="form-control">
                                            <option value="1">1명</option>
                                            <option value="2">2명</option>
                                            <option value="3">3명</option>
                                    </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>객실타입</th>
                                    <td colspan="3">
                                   		<input type="hidden" id="selectedRoom" name="selectedRoom" value="">
                                        <select name="roomType" id="roomType" class="form-control">
                                         	<% 
											    // 선택한 호텔 번호
											    int selectedHotelNo = selectedReservation.getHotelNo();
											    
											    // 해당 호텔의 객실 번호 생성
											    for (int i = 1; i <= 50; i++) { 
											        int roNo = i;
											        String roName = ""; // 객실 이름 초기화
											        
											        // 선택한 호텔에 해당하는 객실만 표시
											        if ((roNo - 1) / 5 + 1 == selectedHotelNo) {
											            switch (roNo % 5) {
											                case 1:
											                    roName = "스탠다드싱글";
											                    break;
											                case 2:
											                    roName = "스탠다드더블";
											                    break;
											                case 3:
											                    roName = "슈페리어킹";
											                    break;
											                case 4:
											                    roName = "디럭스트윈";
											                    break;
											                case 0:
											                    roName = "스위트룸";
											                    break;
											                default:
											                    roName = "기타"; 
											                    break;
											            }
											        
											            // 객실 번호 옵션으로 생성
												%>
											            <option value="<%= roNo %>"><%= roName %></option>
												<%
											        }
											    }
												%>
                                        </select>
                                    </td>
                                </tr>
                                
                               	<script>
	                               	$(document).ready(function() {
	                               	    // 현재 선택된 객실 유형을 가져오는 서버 측 코드
	                               	    let selectedRoomType = '<%= selectedReservation.getRoNo() %>';
	
	                               	    // 셀렉트 요소의 값을 선택된 객실 유형으로 설정
	                               	    $('select[name="roomType"]').val(selectedRoomType);
	
	                               	    // 현재 선택된 예약 인원을 가져오는 서버 측 코드
	                               	    let selectedResPeople = '<%= selectedReservation.getResPeople() %>';
	
	                               	    // 셀렉트 요소의 값을 선택된 예약 인원으로 설정
	                               	    $('select[name="resPeople"]').val(selectedResPeople);
	                               	});

                               	</script>
                                
                                
                                <tr>
								    <th>추가옵션</th>
								    <td colspan="3">
								        <input type="checkbox" id="option1" name="option" value="조식">
								        <label for="option1">조식</label><br>
								        <input type="checkbox" id="option2" name="option" value="레이트체크인">
								        <label for="option2">레이트체크인</label><br>
								        <input type="checkbox" id="option3" name="option" value="베드추가">
								        <label for="option3">베드추가</label><br>
								        <input type="checkbox" id="option4" name="option" value="스파패키지">
								        <label for="option4">스파패키지</label><br>
								        <input type="checkbox" id="option5" name="option" value="무료취소">
								        <label for="option5">무료취소</label><br>
								    </td>
								</tr>
								
								
                            </table>
                            
                            <script>
                            
                         // 폼 제출 시 선택된 객실 번호를 숨겨진 입력 필드에 저장하는 함수
                            function updateSelectedRoom() {
                                var selectedRoom = document.getElementById("roomType").value;
                                document.getElementById("selectedRoom").value = selectedRoom;
                            }
                            
                            	$(function(){
                            		// 현재 예약 정보의 추가옵션들 
                            		let option = '<%= selectedReservation.getOpName() == null ? "" : selectedReservation.getOpName() %>';
                            		
                            		// 순차적으로 checkbox 요소들에 접근하면서
                            		// interest 변수에 담긴 문자열값 내에 해당 체크박스의 value 값이 포함되어 있을 경우
									// 해당 체크박스 요소에 checked 속성 부여하도록
                            		$(":checkbox").each(function(idx, el){
                            			if(option.indexOf(el.value) != -1) {
                            				$(this).attr("checked", true);
                            			}
                            		})
                            	})
                            </script>


                    
                        </div>
                        
        
                        <br>
        
                        <div>
                            <h4>예약자 정보</h4>
                        </div>
        
                        <div>
                            <table style="width: 80%; border-spacing: 10px; border-collapse: separate;">
                                <tr>
                                    <th style="width: 10%;">예약자</th>
                                    <td><input type="text" id="resName" name="resName" class="form-control" required value="<%=selectedReservation.getResName()%>"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td><input type="text" id="resPhone" name="resPhone" oninput="hypenTel(this)" maxlength="13" class="form-control" required value="<%=selectedReservation.getResPhone()%>"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" id="resEmail" name="resEmail" class="form-control" required value="<%=selectedReservation.getResEmail()%>"></td>
                                </tr>
                                <tr>
                                    <th>결제금액(원)</th>
                                    <td>
                                    	<input type="text" id="resPay" name="resPay" oninput="activatePaymentButton(this)" class="form-control" required value="<%=selectedReservation.getPay() %>" data-previous-amount="<%=selectedReservation.getPay()%>" readonly>
                                    </td>
                                </tr>
                                <tr>
                                    <th>결제수단</th>
                                    <td><input type="text" id="resPayMethod" name="resPayMethod" class="form-control" required value="<%=selectedReservation.getPayMethod()%>" readonly></td>
                                </tr>
        
                            </table>

                            
                        </div>
                        
                        <div style="display: flex; justify-content: flex-end; margin-top: 10px;">
                        	
                            <div>
                                <button type="button" class="btn" id="reservation_btn" data-toggle="modal" data-target="#myModal1" style="margin-right: 10px;">예약변경</button>
                            </div>
                            <div>
                                <button type="button" id="paymentButton" class="btn rev_button" onclick="payChangeAmount();" style="margin-right: 10px;" >예약변경 후 결제하기</button>
                            </div>
                            <div>
                                <a href="" class="btn rev_button" data-toggle="modal" data-target="#myModal2" style="margin-right: 210px;">예약취소</a>
                            </div>
                        </div>

                        <!-- 예약변경 Modal -->
                        <div class="modal" id="myModal1">
                            <div class="modal-dialog">
                            <div class="modal-content">
                        
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4 class="modal-title">예약 변경</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                        
                                <!-- Modal body -->
                                <div class="modal-body">
                                예약을 변경을 요청하시겠습니까?
                                </div>
                        
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-danger" onclick="submitForm();">확인</button>
                                </div>
                        
                            </div>
                            </div>
                        </div>

                        <!-- 예약취소 Modal -->
                        <div class="modal" id="myModal2">
                            <div class="modal-dialog">
                            <div class="modal-content">
                        
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4 class="modal-title">예약 취소</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                        
                                <!-- Modal body -->
                                <div class="modal-body">
                                예약을 취소하시겠습니까?
                                <br>
                                예약 취소 및 환불 규정에 관한 사항을 확인하였음
                                </div>
                        
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                <a href="<%=contextPath%>/resCancel.cu?id=<%=selectedReservation.getResNo()%>" class="btn btn-danger">확인</a>
                                </div>
                        
                            </div>
                            </div>
                        </div>

                    </form>
                    <br><br>
                  

                </div>

            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>


</html>