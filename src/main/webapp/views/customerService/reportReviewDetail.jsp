<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.hotel.model.vo.Report" %>
<%
	Report r = (Report)request.getAttribute("r");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 관리자_신고리뷰상세페이지 스타일 */
    .page_content th{
        background-color: lightgray;
        width: 20%;
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
                        <a class="nav-link" href="#">공지사항 관리</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#">문의사항 관리</a>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="#" data-toggle="collapse" data-target="#aaa">신고 관리</a>
                    </li>
                    <li>
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="">신고 계정 관리</a>
                        </div>
                    </li>
                    <li style="background-color: rgb(191, 180, 176);">
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="">신고 리뷰 관리</a>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="page_content">
                <h2 class="contentName">신고 계정 관리</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                <h4 style="margin-top: 10px;">신고리뷰상세</h4>
                <div style="width: 85%; margin: auto; margin-top: 20px;">
                    <table class="table">
                        <tr align="center">
                            <th>리뷰번호</th>
                            <td><%= r.getRevNo() %></td>
                        </tr>
                        <tr align="center">
                            <th>아이디</th>
                            <td><%= r.getUserId() %></td>
                        </tr>
                        <tr align="center">
                            <th>예약번호</th>
                            <td><%= r.getResNo() %></td>
                        </tr>
                        <tr align="center">
                            <th>작성일자</th>
                            <td><%= r.getRegistDate() %></td>
                        </tr>
                        <tr align="center">
                            <th>별점</th>
                            <td><%= r.getRevRating() %></td>
                        </tr>
                        <tr align="center">
                            <th>제목</th>
                            <td><%= r.getRevTitle() %></td>
                        </tr>
                        <tr align="center">
                            <th style="vertical-align: middle;">신고 내용</th>
                            <td style="height: 300px; vertical-align: middle;">
                                <%= r.getRevContent() %>
                            </td>
                        </tr>
                        <tr align="center">
                            <th style="vertical-align: middle;">첨부파일</th>
                            <td style="height: 300px; vertical-align: middle;">
                                <div id="demo" class="carousel slide" data-ride="carousel">

                                    <!-- Indicators -->
                                    <ul class="carousel-indicators">
                                      <li data-target="#demo" data-slide-to="0" class="active"></li>
                                      <li data-target="#demo" data-slide-to="1"></li>
                                      <li data-target="#demo" data-slide-to="2"></li>
                                    </ul>
                                  
                                    <!-- The slideshow -->
                                    <div class="carousel-inner">
                                      <div class="carousel-item active">
                                        <img src="la.jpg" alt="Los Angeles">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="chicago.jpg" alt="Chicago">
                                      </div>
                                      <div class="carousel-item">
                                        <img src="ny.jpg" alt="New York">
                                      </div>
                                    </div>
                                  
                                    <!-- Left and right controls -->
                                    <a class="carousel-control-prev" href="#demo" data-slide="prev">
                                      <span class="carousel-control-prev-icon"></span>
                                    </a>
                                    <a class="carousel-control-next" href="#demo" data-slide="next">
                                      <span class="carousel-control-next-icon"></span>
                                    </a>
                                  
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" align="center">
                                <a href="<%= contextPath %>/reviewDelete.rep?no=<%= r.getRevNo() %>" class="btn" style="background-color: rgb(115, 90, 75); color: white;" onclick="deleteRev();">리뷰 삭제</a>
                                <a href="<%= contextPath %>/cancel.rep?no=<%= r.getRepNo() %>&type=<%= r.getRepType() %>" class="btn" style="background-color: rgb(235, 231, 227);" onclick="cancelRep();">신고 취소</a>
                            </td>
                            
                        </tr>
                    </table>
                </div>
            </div>
            <script>
                // 신고리뷰삭제하는 메소드
                function deleteRev(){
                    confirm("해당 리뷰를 삭제하시겠습니까?");
                }
                // 신고 취소 하는 메소드
                function cancelRep(){
                    confirm("해당 리뷰에 대한 신고를 취소시키시겠습니까?");
                }
            </script>

        </section>
        <!-- section end -->

       	<%@ include file="/views/common/footer.jsp" %>
       
    </div>
</body>
</html>