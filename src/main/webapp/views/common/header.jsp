<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>    
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
<!-- ---------------- -->

<!--  공통스타일 적용 위한 연결 -->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/common.css">
<!-- 메인페이지 스타일위한 연결 -->
<link rel="stylesheet" href="<%=contextPath%>/resources/css/mainpage.css">


</head>
<body>
	<!-- header start-->
        <header class="header">
            <a href="" class="header_logo center">
                    <img src="<%=contextPath%>/resources/images/mainLogo.png" height="100%" alt="메인로고이미지">
            </a>
            <nav class="header_nav">
                <div class="left_nav" >
                <a href="" style="margin-left: 15px;"><i class="bi bi-search"></i>호텔검색</a>
                </div>
                <div class="center_nav"></div>
                 <!-- case1. 로그인 전 -->
                <div class="right_nav">
                <a href="">로그인</a>
                <a href="">회원가입</a>
                </div>
                 <!-- case2. 로그인 후 
                 <div class="right_nav">
                    <b>홍길동님 반갑습니다 </b>
                    <a href=""></a>
                    
                </div>
                -->
            </nav>
        </header>
        <!-- header end-->
</body>
</html>