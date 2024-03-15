<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.notice.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 사용자_공지사항상세페이지 스타일 */
        .space {
            padding: 10px;
        }

        .page_content table {
            margin-top: 30px;
            width: 90%;
        }

        .page_content th {
            background-color: rgb(235, 231, 227);
            width: 100px;
            text-align: center;
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

                <div style="margin-bottom: 50px;">
                    <table align="center">
                        <tr>
                            <th>제목</th>
                            <td colspan="2">
                                <input type="text" name="title" style="width: 100%; text-align: center;" value="<%= n.getNoticeTitle() %>" readonly>
                            </td>
                        </tr>
                        <tr>
                            <td class="space" colspan="3"></td>
                        </tr>
                        <tr>
                            <td colspan="3" style="margin-top: 20px;">
                                <textarea name="" rows="20" style="resize: none; width: 100%;" readonly><%= n.getNoticeContent() %></textarea>
                            </td>
                        </tr>
                        <tr>
                            <th>작성일</th> 
                            <td style="border: 1px solid gray; width: 100px; text-align: center;"><%= n.getRegistDate() %></td>
                            <td></td>
                        </tr>
                        <tr>
                            <td colspan="3" class="space"></td>
                        </tr>
                    </table>
                </div>

            </div>
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>