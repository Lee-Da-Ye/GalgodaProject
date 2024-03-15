<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String contextPath = request.getContextPath(); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- 부트스트랩 기능을 위한 CDN 방식 연결 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- ---------------------------------- -->
<!-- 프로필 아이콘 이미지 관련-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.1/font/bootstrap-icons.css" rel="stylesheet">

<!-- 로그인 폼 아이콘 이미지 관련-->

<!--Bootsrap 4 CDN-->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
   
   <!--Fontawesome CDN-->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<link rel="stylesheet" href="<%=contextPath %>/resources/css/common.css">
</head>
<body>
	<!-- header start-->
        <header class="header">
            <a href="" class="header_logo center">
                    <img src="<%=contextPath%>/resources/images/mainLogo.png"  alt="메인로고이미지">
            </a>
            <nav class="header_nav">
                <div class="left_nav" >
                
                </div>
                <div class="center_nav"></div>
                 <!-- case1. 로그인 전
                <div class="right_nav">
                <a href="">로그인</a>
                <a href="">회원가입</a>
                </div>
                 -->
                 <!-- case2. 로그인 후 -->
                 <div class="right_nav">
                    <b>관리자님</b>
                    <a href="">
                        <i class="bi bi-person-circle"></i>
                    </a>
                </div>
                
            </nav>
        </header>
        <!-- header end-->
	
	
</body>
</html>