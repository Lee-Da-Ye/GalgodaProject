<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LoginMain</title>

    
    <!-- 로그인 폼 아이콘 이미지 관련-->
 
    <!--Bootsrap 4 CDN-->
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
    
    <!--Fontawesome CDN-->
	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">

<style>

		/* 로그인 박스에 적용하는 스타일 */
		.mypage_header {
            margin: 0 auto;
            width: 600px;
	     }
        .login_btn{
            width: 350px;
            height: 35px;
            border-radius: 5px;
            border: none;
            background-color: rgb(191, 180, 176);
            color: white;
        }
        .card_footer{
            text-decoration: none;
            text-align: center;
            padding-bottom: 15px;
        }
        .card_footer a{
            color: rgb(99, 76, 70);
        }
        .loginuser_btn{
            padding-bottom: 20px;
        }
        
    </style>

    <!-- 고객, 호텔, 관리자 버튼 각각 클릭 시 활성화 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    <script>
        $(document).ready(function() {
            $(".customer_btn, .hotel_btn, .admin_btn").click(function() {
                // 클릭된 버튼에만 'active' 클래스를 추가하고 다른 버튼에서는 'active' 클래스를 제거
                $(this).addClass("active").siblings().removeClass("active");
            });
        });

        function setUserType(userType) {
        document.getElementById("userType").value = userType; // 클릭한 버튼에 대한 유저 타입 값을 설정합니다.
        }
        
        function submitLoginForm() {
            var userType = document.getElementById("userType").value;
            if (userType === "") {
                alert("로그인 유형을 선택하세요.");
                return false; // 폼 제출을 막음
            } else {
                // 폼 제출
                document.getElementById("loginForm").submit();
            }
        }
    </script>


</head>
<body>
	<div class="wrap">
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar" style="display: none;">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">메뉴명</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="" data-toggle="collapse" data-target="#demo">메뉴1</a>
                    </li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">하위메뉴</a>
                        </div>
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo2">메뉴2</a>
                    </li>
                        <div id="demo2" class="collapse" style="margin-left: 30px;">
                            <a href="">하위메뉴</a>
                        </div>
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">메뉴3</a>
                    </li>
                        <div id="demo3" class="collapse" style="margin-left: 30px;">
                            <a href="">하위메뉴</a>
                        </div>
                    
                </ul>
            </div>

            <div class="page_content"> 


                <div class="mypage_header">
                    <h3>로그인</h3>
                    <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>
                    <h4 style="margin-top: 10px; text-align: center; ">GALGODA에 오신 것을 환영합니다!</h4>
                </div>
        
                <br>

                
                    <div class="container">
                        <div class="d-flex justify-content-center h-100">
                            <div class="card">
                                
                                <div class="card-body">
                                    <form action="<%=contextPath %>/login.co" method="post">
                                    	<input type="hidden" id="userType" name="userType"> <!-- 숨겨진 입력 필드로 유저 타입을 저장 -->
                                        <div class="d-flex loginuser_btn">
                                            <button type="button" class="btn btn-outline-primary flex-fill mr-1 customer_btn" onclick="setUserType('customer')">고객</button>
                                            <button type="button" class="btn btn-outline-primary flex-fill mr-1 hotel_btn" onclick="setUserType('hotel')">호텔</button>
                                            <button type="button" class="btn btn-outline-primary flex-fill admin_btn" onclick="setUserType('admin')">관리자</button>
                                        </div>

                                        <br>

                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-user"></i></span>
                                            </div>
                                            <input type="text" class="form-control" placeholder="아이디" style="width: 300px;" name="userId" required>
                                            
                                        </div>
                                        <div class="input-group form-group">
                                            <div class="input-group-prepend">
                                                <span class="input-group-text"><i class="fas fa-key"></i></span>
                                            </div>
                                            <input type="password" class="form-control" placeholder="비밀번호" style="width: 300px;" name="userPwd" required>
                                        </div>
                                        
                                        <div class="form-group">
                                            <input type="submit" value="로그인" class="login_btn" onclick="return submitLoginForm();">
                                        </div>
                                    </form>
                                </div>

                                <div class="card_footer">
                                    <a href="<%=contextPath%>/findUserId.co">아이디 찾기</a>
                                    <span> | </span>
                                    <a href="">비밀번호 찾기</a>
                                    <span> | </span>
                                    <a href="<%=contextPath%>/views/common/authenti.jsp">회원가입</a>
                                </div>
                                
                            </div>
                        </div>
                    </div>

                
            
            </div>


        </section>
        
         <%@ include file="/views/common/footer.jsp" %>
    </div>   
</body>
</html>