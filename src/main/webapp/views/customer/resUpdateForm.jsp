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
		        minDate: new Date(),
		        onSelect: function(selectedDate) {
		            var nextDay = new Date(selectedDate.getTime() + 24 * 60 * 60 * 1000);
		            $("#checkOutDate").datepicker("option", "minDate", nextDay);
		        }
		    });
		
		    // 체크아웃 날짜 선택기
		    const pickerCheckOut = new Pikaday({
		        field: document.getElementById('checkOutDate'),
		        format: 'YYYY년 MM월 DD일', // 표시 형식 변경
		        minDate: new Date(),
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






		
		// form 제출 함수
		function submitForm() {
		    var form = document.getElementById('updateForm');
		    form.submit();
		}
    	 
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
                        <a class="nav-link" style="color: black;" href="" data-toggle="collapse" data-target="#demo">예약관리</a>
                    </li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">상세 조회</a>
                        </div>
                    <li id="reservation_btn" style="color : white;">
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">예약 변경/취소</a>
                        </div>
                    </li>
                    
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">리뷰 관리</a>
                        </div>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo2">위시리스트</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">개인정보 수정</a>
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
                                        <select name="resPeople" class="form-control">
                                            <option value="1" selected>1명</option>
                                            <option value="2">2명</option>
                                            <option value="3">3명</option>
                                            <option value="4">4명</option>
                                    </select>
                                    </td>
                                </tr>
                                <tr>
                                    <th>객실타입</th>
                                    <td colspan="3">
                                        <select name="roomType" class="form-control">
                                                <option value="1">스탠다드더블</option>
                                                <option value="2">디럭스트윈</option>
                                                <option value="3">슈페리어킹</option>
                                                <option value="4">스위트룸</option>
                                                <option value="5">스탠다드싱글</option>
                                        </select>
                                    </td>
                                </tr>
                                
                               	<script>
	                               	$(function(){
	                               	    // 현재 선택된 객실 유형을 가져오는 서버 측 코드
	                               	    let selectedRoomType = '<%= selectedReservation.getRoNo() %>';
	
	                               	    // 셀렉트 요소의 값을 선택된 객실 유형으로 설정
	                               	    $('select[name="roomType"]').val(selectedRoomType);
	                               	});
	                               	
	                               	$(function(){
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
                                    <td><input type="text" name="resName" class="form-control" required value="<%=selectedReservation.getResName()%>"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td><input type="text" name="resPhone" class="form-control" required value="<%=selectedReservation.getResPhone()%>"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" name="resEmail" class="form-control" required value="<%=selectedReservation.getResEmail()%>"></td>
                                </tr>
                                <tr>
                                    <th>결제금액</th>
                                    <td><input type="text" name="resPay" class="form-control" required value="<%=selectedReservation.getPay()%>"></td>
                                </tr>
                                <tr>
                                    <th>결제수단</th>
                                    <td><input type="text" name="resPayMethod" class="form-control" required value="<%=selectedReservation.getPayMethod()%>"></td>
                                </tr>
        
                            </table>

                            
                        </div>
                        
                        <div style="display: flex; justify-content: flex-end; margin-top: 10px;">
                            <div>
                                <a href="" class="btn rev_button" data-toggle="modal" data-target="#myModal1" style="margin-right: 10px;">예약변경</a>
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
                                예약을 변경하시겠습니까?
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