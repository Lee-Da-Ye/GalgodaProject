<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.galgoda.customer.model.vo.Wishlist" %>
<%
	List<Wishlist> wishlist = (List<Wishlist>)request.getAttribute("wishlist");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Wishlist</title>
<!--  wishlist 스타일 연결  -->
<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/wishlist.css">


<script>
        $(document).ready(function(){
            $('.checkbox').change(function(){
                var id = $(this).attr('id');
                var heartSvg = $('#heart-svg' + id.substring(id.length - 1));
                if($(this).is(':checked')){
                    heartSvg.find('#heart').css('fill', '#E2264D');
                    // 다른 하트 관련 동작 추가
                } else {
                    heartSvg.find('#heart').css('fill', '#AAB8C2');
                    // 다른 하트 관련 동작 추가
                }
            });
        });
    </script>

</head>
<body>
	<div class="wrap">
       
       <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">메뉴명</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="" data-toggle="collapse" data-target="#demo">예약관리</a>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">상세 조회</a>
                        </div>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">예약 변경/취소</a>
                        </div>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">리뷰 관리</a>
                        </div>
                    </li>
                    <li class="sideMenubar_wishlist">
                        <a class="nav-link" style="background-color: rgb(99, 76, 70); color: white;" href="#" data-toggle="collapse" data-target="#demo2">위시리스트</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">개인정보 수정</a>
                    </li>
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                
                <div class="mypage">
            
                    <div class="res_header">
                        <h2>위시리스트</h2>
                        <div style="border: 2px solid lightgray;"></div>
                    </div>

                    <br>

                    <div class="board_list">
							
						<% for(Wishlist w : wishlist) {%>
                        <!-- 한 게시글 -->
                        <div class="thumbnail">
                            <img class="thumbnail_img" src="<%=request.getContextPath()%>/<%=w.getImgPath()%>">
                            <div class="thumbnail_title"><%=w.getHotelName()%></div>
                            <div class="heartbox"> 
                                <input type="checkbox" class="checkbox" id="checkbox1" />
                                <label for="checkbox1"> 
                                    <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
                                        <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
                                            <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z" id="heart" fill="#AAB8C2" />
                                            <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5" />
                                            <g id="heartgroup7" opacity="0" transform="translate(7 6)">
                                                <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
                                                <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
                                            </g>
                                            <g id="heartgroup6" opacity="0" transform="translate(0 28)">
                                                <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
                                                <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
                                            </g>
                                            <g id="heartgroup3" opacity="0" transform="translate(52 28)">
                                                <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
                                                <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
                                            </g>
                                            <g id="heartgroup2" opacity="0" transform="translate(44 6)">
                                                <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
                                                <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
                                            </g>
                                            <g id="heartgroup5" opacity="0" transform="translate(14 50)">
                                                <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
                                                <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
                                            </g>
                                            <g id="heartgroup4" opacity="0" transform="translate(35 50)">
                                                <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
                                                <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
                                            </g>
                                            <g id="heartgroup1" opacity="0" transform="translate(24)">
                                                <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
                                                <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
                                            </g>
                                        </g>
                                    </svg> 
                                </label>
                            
                            </div>
                            
                            <div class="reservation_button" style="text-align: center;">
                                <button class="btn">예약하기</button>
                            </div>
                            
                        </div>

                        <% } %>
                        
                </div>

            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>