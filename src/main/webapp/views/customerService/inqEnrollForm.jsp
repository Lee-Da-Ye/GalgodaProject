<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.hotel.model.vo.Hotel" %>
<%@ page import="java.util.List" %>
<%
	List<Hotel> list = (List<Hotel>)request.getAttribute("list");
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
                        <h3 class="sideMenubar_head">고객센터</h3>
                    </li>

                    <li >
                        <a class="nav-link" href="<%= contextPath %>/list.no?page=1">공지사항</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#">자주 묻는 질문</a>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="#aaa" data-toggle="collapse">1:1문의</a>
                    </li>
                    <li style="background-color: rgb(191, 180, 176);">
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="">문의하기</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapse show" id="aaa" style="margin-left: 30px;">
                            <a href="">문의내역</a>
                        </div>
                    </li>

                </ul>
            </div>

            <div class="page_content">
                <h2 class="contentName">1:1 문의하기</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>

                <div style="margin: 30px;">
                    <form action="<%= contextPath %>/insert.inq" method="post">
                        <div>
                        <h5>* 기본정보</h5>
                            <table class="table" style="width: 80%;">
                                <tr>
                                    <td>이름</td>
                                    <td><input type="text" name="userName" style="width: 300px;"></td>
                                </tr>
                                <tr>
                                    <td>연락처</td>
                                    <td><input type="text" name="phone" style="width: 300px;"></td>
                                </tr>
                                <tr>
                                    <td>이메일</td>
                                    <td><input type="email" name="email" style="width: 300px;"></td>
                                </tr>
                            </table>
                        </div>
                        <div style="border: 1px solid lightgray;"></div>
                        <br>
                        <h5>* 구분</h5>
                        <select name="category" style="width: 300px;">
                        	<% for(Hotel h : list){ %>
                            <option value="<%= h.getHotelName() %>"><%= h.getHotelName() %></option>
                           	<% } %>
                        </select>
                        <br><br>
                        <h5>* 문의 유형</h5>
                        <label>
                            <input type="radio" name="type" value="불편사항">
                            불편사항
                        </label>
                        <label>
                            <input type="radio" name="type" value="예약문의">
                            예약문의
                        </label>
                        <label>
                            <input type="radio" name="type" value="취소/변경">
                            취소/변경
                        </label>
                        <label>
                            <input type="radio" name="type" value="건의사항">
                            건의사항
                        </label>
                        <label>
                            <input type="radio" name="type" value="기타">
                            기타
                        </label>
                        <br>
                        <h5>* 제목</h5>
                        <input type="text" name="title" style="width: 700px;">
                        <br><br>
                        <h5>* 내용</h5>
                        <textarea name="content" style="width: 700px; height: 500px; resize: none;"></textarea>
                        <br>
                        <h5>첨부파일</h5>
                        <div style="width: 700px; border: 1px solid gray;">
                            <input type="file" name="upload1">
                        </div>
                        <div style="width: 700px; border: 1px solid gray;">
                            <input type="file" name="upload2">
                        </div>
                        <div style="width: 700px; border: 1px solid gray;">
                            <input type="file" name="upload3">
                        </div>
                        <div style="margin-left: 30%; margin-top: 30px;">
                        <button type="submit" class="btn" style="background-color: rgb(115, 90, 75); color: white;">등록</button>
                        <button type="button" class="btn" style="background-color: rgb(235,231,227);">취소</button>
                        </div>
                    </form>
                </div>
            </div>


        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>