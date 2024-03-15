<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.notice.model.vo.Notice" %>
<%@ page import="java.util.List" %>
<%
	List<Notice> list = (List<Notice>)request.getAttribute("li");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 사용자_공지사항목록페이지 스타일 */
        .center_table {
            width: 80%;
            margin: auto;
            margin-top: 50px;
            text-align: center;
            font-size: 18px;
        }
        table th{
            background-color: rgb(235, 231, 227);
        }
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

            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터</h3>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="#" data-toggle="collapse" data-target="#demo">공지사항</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#" data-toggle="collapse" data-target="#demo2">자주 묻는 질문</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#aaa" data-toggle="collapse">1:1문의</a>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="">문의하기</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="">문의내역</a>
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
                            <td><a href="<%= contextPath %>/detail.no?no=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a></td>
                            <td><%= n.getRegistDate() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
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