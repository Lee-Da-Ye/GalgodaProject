<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Main</title>
<style>

/* 회원가입 구분 원 */
        .signup_page{
            display: flex;
            flex-direction: row;
            justify-content: center;
        }

        .signup_circle{
            width: 230px;
            height: 230px;
            border-radius: 50px;
            border: none;
            background-color: rgb(235, 231, 227);
            margin: 20px;
            font-size: 30px;
        }

</style>
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
                    <h3>회원가입</h3>
                    <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>
                </div>
        
                <br>

                <div class="signup_page">
                    
                    <button class="signup_circle">일반 <br> 회원</button>
                    <button class="signup_circle">호텔 <br> 회원</button>
                    
                </div>
            
            </div>


        </section>

       <%@ include file="/views/common/footer.jsp" %>
    </div>   
</body>
</html>