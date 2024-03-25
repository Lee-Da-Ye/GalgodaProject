<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.hotel.model.vo.Report" %>
<%@ page import="java.util.List" %>
<%@ page import="com.galgoda.common.model.vo.PageInfo" %>
<%
	List<Report> list = (List<Report>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
        
        <%@ include file="/views/common/adminHeader.jsp" %>

        <!-- section start -->
        <section class="main_content">

            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터 관리</h3>
                    </li>

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/list.no?page=1">공지사항 관리</a>
                    </li>

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/list.inq?page=1">문의사항 관리</a>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" data-toggle="collapse" data-target="#aaa">신고 관리</a>
                    </li>
                    <li style="background-color: rgb(191, 180, 176);">
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/userList.rep?page=1">신고 계정 관리</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/reviewList.rep?page=1">신고 리뷰 관리</a>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="page_content">
                <h2 class="contentName">신고 계정 관리</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                <div style="margin: auto; margin-top: 20px; width: 85%;">
                    <table class="table table-hover">
                        <tr align="center" class="table-active">
                            <th>번호</th>
                            <th style="width: 30%;">아이디</th>
                            <th>사유</th>
                            <th style="width: 20%;">신고일</th>
                            <th>처리상태</th>
                        </tr>
                        <% for(Report r : list){ %>
                        <tr align="center">
                            <td><%= r.getRepNo() %></td>
                            <td><a href="<%= contextPath %>/userDetail.rep?no=<%= r.getRepNo() %>"><%= r.getUserId() %></a></td>
                            <td><%= r.getRepReason() %></td>
                            <td><%= r.getRepDate() %></td>
                            <% if(r.getStatus().equals("Y")){ %>
                            <td style="opacity: 0.5">처리완료</td>
                            <% }else{ %>
                            <td>처리대기</td>
                            <% } %>
                        </tr>
                        <% } %>
                    </table>
                </div>
                <ul class="pagination" style="margin-top: 50px; width: 95%; justify-content: center;">
                    <% if(pi.getCurrentPage() == 1){ %>
                    <li class="page-item disabled">
                    	<a class="page-link" href="#">&lt;</a>
                    </li>
                    <% }else { %>
                    <li class="page-item">
                    	<a class="page-link" href="<%= contextPath %>/userList.rep?page=<%= pi.getCurrentPage() - 1 %>">&lt;</a>
                    </li>
                 	<% } %>
                 	<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>   
                    	<% if(p == pi.getCurrentPage()){ %>
	                    <li class="page-item active">
	                    	<a class="page-link" href="#"><%= p %></a>
	                    </li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/userList.rep?page=<%= p %>"><%= p %></a>
	                    </li>
                 		<% } %>
                 	<% } %>
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    <li class="page-item disabled">
                    	<a class="page-link" href="#">&gt;</a>
                    </li>
                    <% }else { %>
                    <li class="page-item">
                    	<a class="page-link" href="<%= contextPath %>/userList.rep?page=<%= pi.getCurrentPage() + 1 %>">&gt;</a>
                    </li>
                	<% } %>
                </ul>
            </div>
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>