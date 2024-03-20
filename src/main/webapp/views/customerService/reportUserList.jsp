<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.hotel.model.vo.Report" %>
<%@ page import="java.util.List" %>
<%
	List<Report> list = (List<Report>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
</head>
<body>
	<div class="wrap">
        
        <%@ include file="/views/common/header.jsp" %>

        <!-- section start -->
        <section class="main_content">

            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터 관리</h3>
                    </li>

                    <li>
                        <a class="nav-link" href="#">공지사항 관리</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#">문의사항 관리</a>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="#" data-toggle="collapse" data-target="#aaa">신고 관리</a>
                    </li>
                    <li style="background-color: rgb(191, 180, 176);">
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="">신고 계정 관리</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="">신고 리뷰 관리</a>
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
                    <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
                </ul>
            </div>


        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>