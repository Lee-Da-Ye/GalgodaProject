<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.customerService.model.vo.Inq" %>
<%
	Inq inq = (Inq)request.getAttribute("inq");
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
                    <li> <div id="demo4" class="collapse show" style="margin-left: 30px;"><a href="list.inq">문의사항</a></div> </li>   
                </ul>
            </div>
			<% } %>
            <div class="page_content">
                <h2 class="contentName">1:1 문의내역</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                <div style="margin-top: 20px;">
                    <table class="table">
                        <tr>
                            <th style="width: 100px;">구분</th>
                            <td><%= inq.getCategory() %></td>
                            <th style="width: 100px;">문의유형</th>
                            <td><%= inq.getInqType() %></td>
                        </tr>
                        
                        <tr>
                            <th>제목</th>
                            <td colspan="3">
                               	<%= inq.getInqTitle() %>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <textarea style="width: 100%; height: 300px; resize: none;" readonly><%= inq.getInqContent() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <h3 style="color: rgb(115, 90, 75);">답변</h3>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4">
                            	<% if(inq.getAnsContent() != null){ %>
                                <textarea style="width: 100%; height: 500px; resize: none;" readonly><%= inq.getAnsContent() %></textarea>
                                <% }else{ %>
                                <textarea style="width: 100%; height: 500px; resize: none;" readonly></textarea>
                            	<% } %>
                            </td>
                        </tr>
                        <% if(loginCustomer != null && loginCustomer.getUserName().equals(inq.getInqWriter())){ %>
                        <tr>
                            <td colspan="4" align="right">
                                <button type="button" class="btn" style="background-color: rgb(235, 231, 227); margin-left: 90%; margin-bottom: 20px;" onclick="deleteInq();">삭제</button>
                            </td>
                        </tr>
                        <% } %>
                         <% if(loginHotel != null && inq.getAnsContent() == null){ %>
                         <tr>
	                         <td colspan="4" align="right">
	                             <a href="<%= contextPath %>/answer.inq?no=<%= inq.getInqNo() %>" class="btn" style="background-color: rgb(235, 231, 227);">답변하기</a>
	                         </td>
                         </tr>
                         <% } %>
                        <% if(loginHotel != null && inq.getAnsContent() != null){ %>
                        <tr>
                            <td colspan="4" align="right">
                                <a href="<%= contextPath %>/updateForm.inq?no=<%= inq.getInqNo() %>" class="btn" style="background-color: rgb(115, 90, 75); color: white;">수정</a>
                            </td>
                        </tr>
                        <% } %>
                    </table>
                    
                </div>
            </div>

            <script>
                function deleteInq(){
                    if(confirm("해당 문의를 삭제하시겠습니까?")){
                        alert("문의가 삭제되었습니다.");
                    }
                }
            </script>
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>