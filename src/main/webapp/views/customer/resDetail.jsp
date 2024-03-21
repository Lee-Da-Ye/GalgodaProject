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
<title>Reservation Detail</title>
<style>
		/* 마이페이지_상세조회 페이지 */
        
        table{
            border-spacing: 10px;
            border-collapse: separate;
        }
        table th{
            width: 100px;
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
            border: 1px solid lightgray;
            border-radius: 5px;
            padding-left: 5px;
        }
        #rev_button{
            background-color: rgb(235, 231, 227) !important;
            color: black;
            border: none;
        }
       
</style>
</head>
<body>
	<div class="wrap">
	
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" href="<%=contextPath%>/resManagement.cu" style="background-color: #634c46; color: white;">예약관리</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/wishlist.cu" data-target="#demo2">위시리스트</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/personalInfo.cu" data-target="#demo3">개인정보 수정</a>
                    </li>
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                
                <div class="mypage" style="display: flex; flex-direction: column;">
            
                    <div class="res_header">
                        <h2>예약관리 - <span style="font-size: smaller;">상세조회</h2>
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
   					<input type="hidden" name="resNo" value="<%=selectedReservation.getResNo()%>">	
                    <div style="width: 80%;">
                        <table style="border-spacing: 10px; border-collapse: separate;">
                            <tr>
                                <th>호텔명</th>
                                <td><%=selectedReservation.getHotelName()%></td>
                            </tr>
                            <tr>
                                <th>예약일</th>
                                <td><%=selectedReservation.getDateIn()%> - <%=selectedReservation.getDateOut()%></td>
                            </tr>
                            <tr>
                                <th>예약인원</th>
                                <td>총 <%=selectedReservation.getResPeople()%>명</td>
                            </tr>
                            <tr>
                                <th>객실타입</th>
                                <td><%=selectedReservation.getRoName()%></td>
                            </tr>
                            <tr>
                                <th>추가옵션</th>
                                <td><%=selectedReservation.getOpName() %></td>
                            </tr>
    
                        </table>
                
                    </div>
    
                    <br>
    
                    <div>
                        <h4>예약자 정보</h4> 
                    </div>
    
                    <div style="width: 80%;">
                        <table style="border-spacing: 10px; border-collapse: separate;">
                            <tr>
                                <th>예약자</th>
                                <td><%=selectedReservation.getResName()%></td>
                            </tr>
                            <tr>
                                <th>연락처</th>
                                <td><%=selectedReservation.getResPhone()%></td>
                            </tr>
                            <tr>
                                <th>이메일</th>
                                <td><%=selectedReservation.getResEmail()%></td>
                            </tr>
                            <tr>
                                <th>결제금액</th>
                                <td><%=selectedReservation.getPay()%>원</td>
                            </tr>
                            <tr>
                                <th>결제수단</th>
                                <td><%=selectedReservation.getPayMethod()%></td>
                            </tr>
    
                        </table>
                
                    </div>
                    <br>
                   
                    
                    <div style="display: flex; justify-content: flex-end; margin-top: 10px;">
                        <div>
                            <a href="" class="btn" id="rev_button" data-toggle="modal" data-target="#myModal1" style="margin-right: 10px;">예약변경</a>
                        </div>
                        <div>
                            <a href="" class="btn" id="rev_button" data-toggle="modal" data-target="#myModal2" style="margin-right: 210px;">예약취소</a>
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
                            예약 변경 페이지로 이동하시겠습니까?
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                            <a href="<%=contextPath%>/resUpdateForm.cu?id=<%=selectedReservation.getResNo()%>" class="btn btn-danger">확인</a>
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
                            </div>
                    
                            <!-- Modal footer -->
                            <div class="modal-footer">
                            <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                            <a href="<%=contextPath%>/resCancel.cu" class="btn btn-danger">확인</a>
                            </div>
                    
                        </div>
                        </div>
                    </div>
                                     
                </div>

                <br>
            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>