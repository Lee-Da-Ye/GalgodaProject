<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.inq.model.vo.Inq" %>
<%@ page import="java.util.List" %>
<%
	List<Inq> list = (List<Inq>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 사용자_1대1문의내역페이지 스타일 */
        table a{
            color: black;
            text-decoration: none;
        }
        table a:hover{
            color: black;
            text-decoration: none;
        }
        .sideMenubar_head {
            width: 80%;
            margin-left: 10px;
            margin-right: 30px;
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
                        <a class="nav-link" href="#">공지사항</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#">자주 묻는 질문</a>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="#aaa" data-toggle="collapse">1:1문의</a>
                    </li>
                    <li>
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="">문의하기</a>
                        </div>
                    </li>
                    <li style="background-color: rgb(191, 180, 176);">
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="">문의내역</a>
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
                            <th style="width: 7%;">번호</th>
                            <th style="width: 15%;">구분</th>
                            <th style="width: 10%;">문의유형</th>
                            <th style="width: 35%;">제목</th>
                            <th style="width: 20%;">작성일</th>
                            <th>상태</th>
                        </tr>
                        <% for(Inq i : list){ %>
                        <tr align="center">
                            <td><%= i.getInqNo() %></td>
                            <td><%= i.getCategory() %></td>
                            <td><%= i.getInqType() %></td>
                            <td><a href="<%= contextPath %>/detail.inq?no=<%= i.getInqNo()%>"><%= i.getInqTitle() %></a></td>
                            <td><%= i.getRegistDate() %></td>
                            <% if(i.getStauts().equalsIgnoreCase("w")){ %>
                            <td>답변 대기</td>
                            <% }else if(i.getStauts().equalsIgnoreCase("y")){ %>
                            <td style="opacity: 0.5;">답변 완료</td>
                        	<% } %>
                        </tr>
                        <% } %>
                    </table>
                </div>
            </div>
			<% }else if(loginHotel != null){ %>
			<div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link "  href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">호텔등록</a></div> </li> 
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">호텔 정보 수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">객실등록</a></div> </li>  
                    <li> <div id="demo"  class="collapse " style="margin-left: 30px;"><a href="">객실수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">리뷰 관리</a></div> </li>   
                    
                    
                    <li>
                        <a class="nav-link"  href="#">예약관리</a>
                    </li>
                  
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">담당자 정보 수정</a>
                    </li>
                        
                    
                    <li>
                         <a class="nav-link" style="color: white; background-color: rgb(115, 90, 75);" href="#" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li style="background-color: #BFB4B0;"> <div id="demo4" class="collapse show" style="margin-left: 30px;"><a href="">공지사항</a></div> </li>   
                    <li> <div id="demo4" class="collapse show" style="margin-left: 30px;"><a href="">문의사항</a></div> </li>   
                </ul>
            </div>	
			<div class="page_content">
                <h2 class="contentName">1:1 문의내역</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                <div style="margin-top: 20px;">
                    <table class="table table-hover">
                        <tr align="center" class="table-active">
                            <th style="width: 7%;">번호</th>
                            <th style="width: 15%;">구분</th>
                            <th style="width: 10%;">문의유형</th>
                            <th style="width: 35%;">제목</th>
                            <th style="width: 20%;">작성일</th>
                            <th>상태</th>
                        </tr>
                        <% for(Inq i : list){ %>
                        	<% if(loginHotel.getHotelName().equals(i.getCategory())){ %>
		                        <tr align="center">
		                            <td><%= i.getInqNo() %></td>
		                            <td><%= i.getCategory() %></td>
		                            <td><%= i.getInqType() %></td>
		                            <td><a href="<%= contextPath %>/detail.inq?no=<%= i.getInqNo()%>"><%= i.getInqTitle() %></a></td>
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
                </div>
            </div>
			<% } %>
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>