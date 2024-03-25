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
<style type="text/css">
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

            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
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
                    	<a class="nav-link" style="color: white; background-color: rgb(115, 90, 75);" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li> 
                    	<div id="demo4" class="collapse show" style="margin-left: 30px;">
                    		<a href="<%= contextPath %>list.no?page=1">공지사항</a>
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
                    <form action="<%= contextPath %>/update.inq" method="post">
                    	<input type="hidden" name="no" value="<%= inq.getInqNo() %>">
                        <table class="table">
                            <tr>
                                <th style="width: 100px;">작성자</th>
                                <td><%= inq.getInqWriter() %></td>
                                <th style="width: 100px;">문의유형</th>
                                <td><%= inq.getInqType() %></td>
                            </tr>
                            <tr>
                                <th>제목</th>
                                <td colspan="3"><%= inq.getInqTitle() %></td>
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
                                    <textarea name="answer" style="width: 100%; height: 500px; resize: none;" required></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" align="center">
                                    <button type="submit" class="btn" style="background-color: rgb(115, 90, 75); color: white;">답변등록</button>
                                    <button type="button" class="btn" style="background-color: rgb(235, 231, 227);" onclick="history.back();">취소</button>
                                </td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>