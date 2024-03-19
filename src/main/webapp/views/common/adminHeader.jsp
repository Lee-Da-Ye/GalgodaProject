<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.member.model.vo.Customer" %>
<%@ page import="com.galgoda.member.model.vo.HotelUser" %>
<%@ page import="com.galgoda.member.model.vo.Admin" %>

<% 
	String contextPath = request.getContextPath(); 

	Customer loginCustomer = (Customer)session.getAttribute("loginCustomer");
	HotelUser loginHotel = (HotelUser)session.getAttribute("loginHotel");
	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
	// 로그인 전 : null
	// 로그인 성공 후 : 로그인한 고객/호텔/관리자 데이터가 담겨있음
	
	String alertMsg = (String)session.getAttribute("alertMsg");
	// 서비스 요청 전 : null
	// 서비스 요청 성공 후 : alert 띄워주고자 하는 알람 문구

%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Galgoda</title>

<!-- 부트스트랩 기능을 위한 CDN 방식 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- 아이콘사용을위한 연결 -->    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!--  공통스타일 적용 위한 연결 -->
	<link rel="stylesheet" href="<%=contextPath%>/resources/css/common.css"> 
<!-- 메인페이지 스타일위한 연결 -->
	<link rel="stylesheet" href="<%=contextPath%>/resources/css/mainpage.css">
<!-- 프로필 아이콘 이미지 관련-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">
	<style>
		.left_nav{
		    display: flex; 
		    align-items: center;
		}
		.left_nav>a{
		    margin-right: 100px;
		}	
	</style>
</head>
<body>

	<% if (alertMsg != null) { %>
    <script>
        alert('<%= alertMsg %>');
    </script>
    <% 
        session.removeAttribute("alertMsg"); // 세션 속성 제거
	    %>
	<% } %>


	
	<!-- header start-->
        <header class="header">
            <a href="" class="header_logo center">
                    <img src="<%=contextPath%>/resources/images/mainLogo.png" height="100%" alt="메인로고이미지">
            </a>
            <nav class="header_nav">
                <div class="left_nav" >
                    <a href="<%=contextPath %>/hotelList.su?page=1" style="margin-left: 15px;">호텔 관리</a>
                    <a href="<%=contextPath %>/userList.su" style="margin-left: 15px;">사용자 관리</a>
                    <a href="" style="margin-left: 15px;">고객센터 관리</a>
                    <a href="<%=contextPath %>/termsList.su" style="margin-left: 15px;">홈페이지 관리</a>
                </div>
                <div class="center_nav"></div>
                
                <% if(loginCustomer == null && loginHotel == null && loginAdmin == null) { %>
                 <!-- case1. 로그인 전 -->
                <div class="right_nav">
	                <a href="<%=contextPath%>/loginMain.co">로그인</a>
	                <a href="<%=contextPath%>/signupMain.co">회원가입</a>
                </div>
                <% } else {%>
                 <!-- case2. 로그인 후 -->
                 <div class="right_nav">
		        <% if(loginCustomer != null) { %>
		            <!-- 고객으로 로그인한 경우 -->
		            <b><%= loginCustomer.getUserName() %> 님</b>
		            <a href="<%=contextPath%>/mypage.cu">
		            <i class="bi bi-person-circle"></i>
		       	 	</a>
		        <% } else if(loginHotel != null) { %>
		            <!-- 호텔으로 로그인한 경우 -->
		            <b><%= loginHotel.getHotelName() %> 님</b>
		            <a href="<%=contextPath%>/mypage.ho">
		            <i class="bi bi-person-circle"></i>
		       	 	</a>
		        <% } else if(loginAdmin != null) { %>
		            <!-- 관리자로 로그인한 경우 -->
		            <b><%= loginAdmin.getAdminName() %> 님</b>
		            <a href="<%=contextPath%>/mypage.su">
		            <i class="bi bi-person-circle"></i>
		       	 	</a>
		        <% } %>
		        
		        <a href="<%= contextPath %>/logout.co">로그아웃</a>
		    	</div>	
                <% } %>
                
            </nav>
        </header>
        <!-- header end-->
</body>
</html>