<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.customerService.model.vo.Notice" %>
<%@ page import="java.util.List" %>
<%@ page import="com.galgoda.common.model.vo.PageInfo" %>
<%
	List<Notice> list = (List<Notice>)request.getAttribute("li");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 공지사항목록페이지 스타일 */
	.center_table {
		width: 80%;
		margin: auto;
		margin-top: 50px;
		text-align: center;
		font-size: 18px;
	}
	
	table th {
		background-color: rgb(235, 231, 227);
	}
	
	table a {
		color: black;
		text-decoration: none;
	}
	
	table a:hover {
		color: black;
		text-decoration: none;
	}
	
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
			<%
			if (loginCustomer == null && loginHotel == null && loginAdmin == null) {
			%>
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터</h3>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="<%= contextPath %>/list.no?page=1">공지사항</a>
                    </li>

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/hotel.faq">자주 묻는 질문</a>
                    </li>
                </ul>
            </div>
            
            <div class="page_content">
                <h2 class="contentName">공지사항</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>

                <table class="table-bordered center_table" style="width: 95%;">
                    <thead class="thead-light">
                        <tr>
                            <th style="width: 10%;">글 번호</th>
                            <th style="width: 70%;">제목</th>
                            <th style="width: 20%;">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% for(Notice n : list){ %>
                        <tr>
                            <td><%= n.getNoticeNo() %></td>
                            <td>
                            	<a href="<%= contextPath %>/detail.no?no=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a>
                           	</td>
                            <td><%= n.getRegistDate() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <ul class="pagination" style="margin-top: 50px; width: 95%; justify-content: center;">
                    
                    <% if(pi.getCurrentPage() == 1){ %>
                    <li class="page-item disabled">
                    	<a class="page-link" href="#">&lt;</a>
                   	</li>
                    <% }else { %>
                    <li class="page-item">
                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= pi.getCurrentPage() - 1 %>">&lt;</a>
                   	</li>
                 	<% } %>
                 	<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>   
                    	<% if(p == pi.getCurrentPage()){ %>
	                    <li class="page-item active">
	                    	<a class="page-link" href="#"><%= p %></a>
                    	</li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= p %>"><%= p %></a>
                    	</li>
                 		<% } %>
                 	<% } %>
                    
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    <li class="page-item disabled">
                    	<a class="page-link" href="#">&gt;</a>
                   	</li>
                    <% }else { %>
                    <li class="page-item">
                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= pi.getCurrentPage() + 1 %>">&gt;</a>
                   	</li>
                	<% } %>
                </ul>
            </div>
            
            <%} else if(loginCustomer != null){ %>
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터</h3>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="<%= contextPath %>/list.no?page=1">공지사항</a>
                    </li>

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/hotel.faq">자주 묻는 질문</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#aaa" data-toggle="collapse">1:1문의</a>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/enrollForm.inq">문의하기</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/list.inq?page=1">문의내역</a>
                        </div>
                    </li>

                </ul>
            </div>
            
            <div class="page_content">
                <h2 class="contentName">공지사항</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>

                <table class="table-bordered center_table" style="width: 95%;">
                    <thead class="thead-light">
                        <tr>
                            <th style="width: 10%;">글 번호</th>
                            <th style="width: 70%;">제목</th>
                            <th style="width: 20%;">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% for(Notice n : list){ %>
                        <tr>
                            <td><%= n.getNoticeNo() %></td>
                            <td>
                            	<a href="<%= contextPath %>/detail.no?no=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a>
                           	</td>
                            <td><%= n.getRegistDate() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <ul class="pagination" style="margin-top: 50px; width: 95%; justify-content: center;">
                    
                    <% if(pi.getCurrentPage() == 1){ %>
                    <li class="page-item disabled">
                    	<a class="page-link" href="#">&lt;</a>
                    </li>
                    <% }else { %>
                    <li class="page-item">
                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= pi.getCurrentPage() - 1 %>">&lt;</a>
                   	</li>
                 	<% } %>
                 	<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>   
                    	<% if(p == pi.getCurrentPage()){ %>
	                    <li class="page-item active">
	                    	<a class="page-link" href="#"><%= p %></a>
                    	</li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= p %>"><%= p %></a>
                    	</li>
                 		<% } %>
                 	<% } %>
                    
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    <li class="page-item disabled">
                    	<a class="page-link" href="#">&gt;</a>
                   	</li>
                    <% }else { %>
                    <li class="page-item">
                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= pi.getCurrentPage() + 1 %>">&gt;</a>
                    </li>
                	<% } %>
                </ul>
            </div>
            
			<% } else if(loginHotel != null) { %>
			<div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link "  href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
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
                         <a class="nav-link" style="color: white; background-color: rgb(115, 90, 75);" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li style="background-color: #BFB4B0;"> 
                    	<div id="demo4" class="collapse show" style="margin-left: 30px;">
                    		<a href="<%= contextPath %>/list.no?page=1">공지사항</a>
                    	</div> 
                    </li>   
                    <li> 
                    	<div id="demo4" class="collapse show" style="margin-left: 30px;">
                    		<a href="<%= contextPath %>/list.inq?page=1">문의사항</a>
                    	</div> 
                    </li>   
                </ul>
            </div>
            
            <div class="page_content">
                <h2 class="contentName">공지사항</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                <table class="table-bordered center_table" style="width: 95%;">
                    <thead class="thead-light">
                        <tr>
                            <th style="width: 10%;">글 번호</th>
                            <th style="width: 70%;">제목</th>
                            <th style="width: 20%;">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% for(Notice n : list){ %>
                        <tr>
                            <td><%= n.getNoticeNo() %></td>
                            <td>
                           		<a href="<%= contextPath %>/detail.no?no=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a>
                           	</td>
                            <td><%= n.getRegistDate() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <div align="right" style="width: 97%; margin-top: 10px;">
                    <a href="<%= contextPath %>/enrollForm.no" class="btn" style="background-color: rgb(115, 90, 75); color: white;">글쓰기</a>
                </div>
                
                <ul class="pagination" style="margin-top: 50px; width: 95%; justify-content: center;">
                    <% if(pi.getCurrentPage() == 1){ %>
                    <li class="page-item disabled">
                   		<a class="page-link" href="#">&lt;</a>
                   	</li>
                    <% }else { %>
                    <li class="page-item">
                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= pi.getCurrentPage() - 1 %>">&lt;</a>
                    </li>
                 	<% } %>
                 	<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>   
                    	<% if(p == pi.getCurrentPage()){ %>
	                    <li class="page-item active">
	                    	<a class="page-link" href="#"><%= p %></a>
	                    </li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= p %>"><%= p %></a>
	                    </li>
                 		<% } %>
                 	<% } %>
                    
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    <li class="page-item disabled">
                    	<a class="page-link" href="#">&gt;</a>
                    </li>
                    <% }else { %>
                    <li class="page-item">
                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= pi.getCurrentPage() + 1 %>">&gt;</a>
                    </li>
                	<% } %>
                </ul>
            </div>
            <% } %>
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
	
</body>
</html>