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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script>
$(document).ready(function(){
    // 페이지가 로드될 때 모든 하트를 선택된 상태로 변경
    $('svg[id^="heart-svg"]').each(function(){
        $(this).find('#heart').css('fill', '#E2264D');
    });

    
    $('svg[id^="heart-svg"]').click(function(){
        var index = $(this).attr('id').slice($(this).attr('id').lastIndexOf('_') + 1); 
        console.log(index)
        var checkbox = $('#checkbox' + index); // 해당 하트와 연결된 체크박스를 선택
		
        // 체크박스의 상태를 항상 해제하고, 하트 아이콘의 색상도 함께 변경
        checkbox.prop('checked', false);
        $(this).find('#heart').attr('fill', '#AAB8C2'); // 하트 아이콘의 색상을 변경

        // 해당 하트와 연결된 체크박스의 data-wishlist-id 속성 값을 가져와서 콘솔에 출력
        var wishlistId = checkbox.val();// 해당 체크박스의 data-wishlist-id 속성 값을 가져옴
        console.log("wishlistId:", wishlistId);

        // 위의 wishlistId가 null 또는 undefined인지 확인하는 코드 추가
        if (wishlistId == null || wishlistId === undefined) {
            console.error("Error: WishlistId is null or undefined");
            return; // wishlistId가 null 또는 undefined이면 더 이상 진행하지 않음
        }

        // 하트 해제 시 위시리스트에서 삭제 요청 보내기
        $.ajax({
            type: "POST",
            url: "<%=request.getContextPath()%>/deleteWishlist.cu",
            data: { wishlistId: wishlistId },
            success: function(response) {
                if (response.result > 0) {
                    alert("위시리스트에서 삭제되었습니다.");
                    window.location.href = "<%=request.getContextPath()%>/wishlist.cu";
                } else {
                    alert("위시리스트 삭제에 실패했습니다.");
                    window.location.href = "<%=request.getContextPath()%>/wishlist.cu";
                }
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
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
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/resManagement.cu?page=1" data-target="#demo">예약관리</a>
                    </li>
                    
                    <li class="sideMenubar_wishlist">
                        <a href="<%=contextPath%>/wishlist.cu" class="nav-link" style="background-color: rgb(99, 76, 70); color: white;" data-target="#demo2">위시리스트</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="" data-target="#demo2">리뷰관리</a>
                    </li>
                    
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/personalInfo.cu" data-target="#demo3">개인정보 수정</a>
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
                    
                    <% if(wishlist.isEmpty()) {%>
                    
                    	<div>
                    		<h4>위시리스트에 담긴 내역이 없습니다.</h4>
                    	</div>
                    	
                    <% } else { %>
							
						<% for(int index = 0; index < wishlist.size(); index++) { %>
                        <!-- 한 게시글 -->
                        <div class="thumbnail">
                            <img class="thumbnail_img" src="<%=request.getContextPath()%>/<%=wishlist.get(index).getImgPath()%>">
                            <div class="thumbnail_title"><%=wishlist.get(index).getHotelName()%></div>
                            <div class="heartbox"> 
                                <input type="checkbox" class="checkbox" id="checkbox<%= index %>" value="<%=wishlist.get(index).getWishNo()%>">
                                <label for="checkbox<%= index %>"> 
                                    <svg id="heart-svg_<%= index %>" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
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
                            	<input type="hidden" name="hotelNo" value="<%=wishlist.get(index).getHotelName() %>">
                                <a href="<%=request.getContextPath() %>/resDetail.res?searchType=hotelName&hotelName=<%=wishlist.get(index).getHotelName() %>&checkInDate=&checkOutDate=&peopleCount=1&roomCount=1&selectHotelNo=<%=wishlist.get(index).getHotelNO() %>" class="btn" >예약하기</a>
                            </div>
                            
                        </div>

                        <% } %>
                        
                     <% } %>
                </div>

            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>