<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.galgoda.customer.model.vo.Reservation" %>
<%@page import="com.galgoda.common.model.vo.PageInfo"%>
<%
	List<Reservation> reservations = (List<Reservation>)request.getAttribute("reservations");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reservation Management</title>
<style>
		/* 예약 관리 페이지 */
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
        .rev_button{
			background-color: #ebe7e3 !important;
			border: none;
			color: black;
			padding: 10px 20px;
			border-radius: 5px;
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
                    
                    <li class="reservation_btn">
                        <a class="nav-link" href="<%=contextPath%>/resManagement.cu?page=1" data-target="#demo" style="background-color: #634c46; color: white;" >예약관리</a>
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
                        <h2>예약관리</h2>
                        <div style="border: 2px solid lightgray;"></div>
                    </div>

                    <br>
                    
                    <% if(reservations.isEmpty()) {%>
                    
                    	<div>
                    		<h4>예약 내역이 없습니다.</h4>
                    	</div>
                    	
                    <% } else { %>
                    

					<% for(Reservation r : reservations) { %>
                    <div class="res_content1" style="display: flex;">
                    
                        <div>
                            <h5><%=r.getHotelName() %></h5>
                            <h6><%=r.getDateIn() %> - <%=r.getDateOut()%></h6>
                            <div class="res_content1_box" style="border: 1px solid lightgray; width: 600px; height: 200px; display: flex;">
                                <div><img src="<%= request.getContextPath()%>/<%=r.getImgPath()%>" style="width: 200px; height: 200px; padding:10px"></div>
                                <div>
                                    <br>
                                    
								     <% 
									    // ro_no에 해당하는 ro_name을 가져와 화면에 표시
									    int roNo = r.getRoNo();
									  	
									    String roName = "";
									    
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
									%>
                                    
                                    <h6><%=r.getDateIn() %> - <%=r.getDateOut()%></h6>
                                    <h6><%= roName %></h6>
                                    <h6>총 <%=r.getResPeople()%>명</h6>
                                    <h6>추가 옵션 : <%=r.getOpName()%></h6>
                                </div>
                            </div>
                        </div>
                        
                        <!-- 예약 상태가 "예약취소"일 때 버튼 비활성화 -->
			            <% if (r.getResStatus().equals("예약취소")) { %>
			                <div class="res_content1_menu" style="display: flex; flex-direction: column; padding-top: 60px; padding-left: 10px; justify-content: space-between; word-break: break-all;">
			                    <span class="btn btn-secondary"><%=r.getResStatus()%></span>
			                    <!-- 예약 상태가 "예약취소"일 때 버튼 비활성화 -->
			                    <button class="btn rev_button" disabled>상세 조회</button>
			                    <button class="btn rev_button" disabled>예약 변경/취소</button>
			                    <button class="btn rev_button" disabled>리뷰 등록/삭제</button>
			                </div>
			            <% } else { %>
			                <!-- 예약 상태가 "예약취소"가 아닐 때 버튼 활성화 -->
			                <div class="res_content1_menu" style="display: flex; flex-direction: column; padding-top: 60px; padding-left: 10px; justify-content: space-between; word-break: break-all;">
			                    <span class="btn btn-secondary"><%=r.getResStatus()%></span>
			                    <a href="<%=contextPath%>/resDetail.cu?id=<%=r.getResNo()%>" class="btn rev_button">상세 조회</a>
			                    <a href="<%=contextPath%>/resUpdateForm.cu?id=<%=r.getResNo()%>" class="btn rev_button">예약 변경/취소</a>
			                    
			                    
			                    <% if(r.getResStatus().equals("예약확정")) { %>
			                    <a href="" class="btn rev_button" >리뷰 등록/삭제</a>
			                    <% } else { %>
			                    <button class="btn rev_button" disabled>리뷰 등록/삭제</button>
			                    <% } %>
			                    
			                </div>
			            <% } %>
			            
			            
                    </div>
                    <br>
                    <% } %>
                    
                <% } %>

					<br>
					
					<% if(reservations.isEmpty()) {%>
					
					<ul class="pagination justify-content-center" style="display:none;">
	                	<%if(pi.getCurrentPage()==1){ %>
	                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    <%}else{ %>
	                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/resManagement.cu?page=<%=pi.getCurrentPage()-1%>">Previous</a></li>
	                    <%} %>
	                    <%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    	<%if(p==pi.getCurrentPage()){ %>
		                    <li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
		                    <%}else{ %>
		                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/resManagement.cu?page=<%=p%>"><%=p %></a></li>
		                    <%} %>
	                    <%} %>
						<%if(pi.getCurrentPage()==pi.getMaxPage()){ %>                    
	                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    <%}else{ %>
	                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/resManagement.cu?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
	                    <%} %>
	                </ul>
					
					
					<% } else { %>
					
					
					<ul class="pagination justify-content-center" >
	                	<%if(pi.getCurrentPage()==1){ %>
	                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
	                    <%}else{ %>
	                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/resManagement.cu?page=<%=pi.getCurrentPage()-1%>">Previous</a></li>
	                    <%} %>
	                    <%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	                    	<%if(p==pi.getCurrentPage()){ %>
		                    <li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
		                    <%}else{ %>
		                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/resManagement.cu?page=<%=p%>"><%=p %></a></li>
		                    <%} %>
	                    <%} %>
						<%if(pi.getCurrentPage()==pi.getMaxPage()){ %>                    
	                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
	                    <%}else{ %>
	                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/resManagement.cu?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
	                    <%} %>
	                </ul>
	                
	                <% } %>

                    <br><br>
                  

                </div>

            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>