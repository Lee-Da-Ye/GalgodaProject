<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.customerService.model.vo.Inq" %>
<%@ page import="com.galgoda.hotel.model.vo.Hotel" %>
<%@ page import="java.util.List" %>
<%@ page import="com.galgoda.common.model.vo.PageInfo" %>
<%
	List<Inq> list1 = (List<Inq>)request.getAttribute("list1");
	List<Hotel> list2 = (List<Hotel>)request.getAttribute("list2");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.sideMenubar_head {
		width: 80%;
		margin-left: 10px;
		margin-right: 50px;
		margin-top: 10px;
		border-bottom: 1px solid gray;
	}
</style>
</head>
<body>
	<div class="wrap">
        
        <%@ include file="/views/common/header.jsp" %>

        <!-- section start -->
        <section class="main_content">

			<% if(loginCustomer != null){ %>
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터</h3>
                    </li>

                    <li >
                        <a class="nav-link" href="<%= contextPath %>/list.no?page=1">공지사항</a>
                    </li>

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/hotel.faq">자주 묻는 질문</a>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="#aaa" data-toggle="collapse">1:1문의</a>
                    </li>
                    <li>
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/enrollForm.inq">문의하기</a>
                        </div>
                    </li>
                    <li style="background-color: rgb(191, 180, 176);">
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/list.inq">문의내역</a>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="page_content">
                <h2 class="contentName">1:1 문의내역</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                <div style="margin-top: 20px;">
                    <table class="table table-hover">
                        <tr align="center" class="table-active">
                            <th style="width: 20%;">구분</th>
                            <th style="width: 10%;">문의유형</th>
                            <th style="width: 35%;">제목</th>
                            <th style="width: 20%;">작성일</th>
                            <th>상태</th>
                        </tr>
                        <% for(Inq i : list1){ %>
                        <tr align="center">
                            <td><%= i.getCategory() %></td>
                            <td><%= i.getInqType() %></td>
                            <td>
                            	<a href="<%= contextPath %>/detail.inq?no=<%= i.getInqNo()%>"><%= i.getInqTitle() %></a>
                           	</td>
                            <td><%= i.getRegistDate() %></td>
                            <% if(i.getStauts().equalsIgnoreCase("w")){ %>
                           	<td>답변 대기</td>
                            <% }else if(i.getStauts().equalsIgnoreCase("y")){ %>
                           	<td style="opacity: 0.5;">답변 완료</td>
                        	<% } %>
                        </tr>
                        <% } %>
                    </table>
	                <ul class="pagination" style="margin-top: 50px; width: 95%; justify-content: center;">
	                    <% if(pi.getCurrentPage() == 1){ %>
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">&lt;</a>
                    	</li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.inq?page=<%= pi.getCurrentPage() - 1 %>">&lt;</a>
                    	</li>
	                 	<% } %>
	                 	
	                 	<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>   
	                    	<% if(p == pi.getCurrentPage()){ %>
		                    <li class="page-item active">
		                    	<a class="page-link" href="#"><%= p %></a>
	                    	</li>
		                    <% }else { %>
		                    <li class="page-item">
		                    	<a class="page-link" href="<%= contextPath %>/list.inq?page=<%= p %>"><%= p %></a>
	                    	</li>
	                 		<% } %>
	                 	<% } %>
	                    
	                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">&gt;</a>
                    	</li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.inq?page=<%= pi.getCurrentPage() + 1 %>">&gt;</a>
                    	</li>
	                	<% } %>
	                </ul>
                </div>
            </div>
            
			<% }else if(loginHotel != null){ %>
			<div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                    <li> 
                    	<div id="demo" class="collapse " style="margin-left: 30px;">
                    		<a href="<%= contextPath %>/hotelinsertForm.ho">호텔등록</a>
                   		</div>
                   	</li> 
                    <li> 
                    	<div id="demo" class="collapse " style="margin-left: 30px;">
                    		<a href="<%= contextPath %>/hotelupdateForm.ho">호텔 정보 수정</a>
                    	</div>
                   	</li>  
                    <li> 
                    	<div id="demo" class="collapse " style="margin-left: 30px;">
                    		<a href="<%= contextPath%>/roominsertForm.ho">객실등록</a>
                    	</div> 
                    </li>  
                    <li> 
                    	<div id="demo"  class="collapse " style="margin-left: 30px;">
                    		<a href="<%= contextPath %>/roomUpdateForm.ho">객실수정</a>
                   		</div> 
                 	</li>  
                    <li> 
                    	<div id="demo" class="collapse " style="margin-left: 30px;">
                    		<a href="<%= contextPath %>/revList.ho?page=1">리뷰 관리</a>
                   		</div> 
                   	</li>   
                    <li>
                        <a class="nav-link"  href="<%= contextPath %>/resList.ho?page=1">예약관리</a>
                    </li>
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath %>/personalInfo.ho">담당자 정보 수정</a>
                    </li>
                    <li>
                    	<a class="nav-link" style="color: white; background-color: rgb(115, 90, 75);" href="#" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li> 
                    	<div id="demo4" class="collapse show" style="margin-left: 30px;">
                    		<a href="<%= contextPath %>/list.no?page=1">공지사항</a>
                  		</div> 
                  	</li>   
                    <li style="background-color: #BFB4B0;"> 
                    	<div id="demo4" class="collapse show" style="margin-left: 30px;">
                    		<a href="<%= contextPath %>/list.inq?page=1">문의사항</a>
                    	</div> 
                    </li>   
                </ul>
            </div>	
            
			<div class="page_content">
                <h2 class="contentName">1:1 문의내역</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                <div style="margin-top: 20px;">
                    <table class="table table-hover">
                        <tr align="center" class="table-active">
                        	<th style="width: 15%;">작성자</th>
                            <th style="width: 10%;">문의유형</th>
                            <th style="width: 45%;">제목</th>
                            <th style="width: 20%;">작성일</th>
                            <th>상태</th>
                        </tr>
                        <% for(Inq i : list1){ %>
                        	<% if(loginHotel.getHotelName().equals(i.getCategory())){ %>
	                        <tr align="center">
	                            <td><%= i.getInqWriter() %></td>
	                            <td><%= i.getInqType() %></td>
	                            <td>
	                            	<a href="<%= contextPath %>/detail.inq?no=<%= i.getInqNo()%>"><%= i.getInqTitle() %></a>
                            	</td>
	                            <td><%= i.getRegistDate() %></td>
	                            <% if(i.getStauts().equalsIgnoreCase("w")){ %>
                            	<td>답변 대기</td>
	                            <% }else if(i.getStauts().equalsIgnoreCase("y")){ %>
                            	<td style="opacity: 0.5;">답변 완료</td>
	                        	<% } %>
	                        </tr>
                        	<% } %>
                        <% } %>
                    </table>
                    <ul class="pagination" style="margin-top: 50px; width: 95%; justify-content: center;">
	                    
	                    <% if(pi.getCurrentPage() == 1){ %>
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">&lt;</a>
                    	</li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.inq?page=<%= pi.getCurrentPage() - 1 %>">&lt;</a>
                    	</li>
	                 	<% } %>
	                 	
	                 	<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>   
	                    	<% if(p == pi.getCurrentPage()){ %>
		                    <li class="page-item active">
		                    	<a class="page-link" href="#"><%= p %></a>
                    		</li>
		                    <% }else { %>
		                    <li class="page-item">
		                    	<a class="page-link" href="<%= contextPath %>/list.inq?page=<%= p %>"><%= p %></a>
                    		</li>
	                 		<% } %>
	                 	<% } %>
	                    
	                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">&gt;</a>
                    	</li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.inq?page=<%= pi.getCurrentPage() + 1 %>">&gt;</a>
                    	</li>
	                	<% } %>
	                </ul>
                </div>
            </div>
            <% } %>
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>