<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Personal Info Confirm Page</title>
<style>
		/* 개인정보 수정 첫 페이지 */

        .pwd_confirm{
            width: 300px;
        }

        .pwd_confirm_button{
            padding-left: 420px;
        }
</style>
</head>
<body>

	<div class="wrap">
	
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/resManagement.cu" data-target="#demo">예약관리</a>
                    </li>
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/wishlist.cu" data-target="#demo2">위시리스트</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: white; background-color: rgb(99, 76, 70);" href="<%=contextPath%>/personalInfo.cu" data-target="#demo3">개인정보 수정</a>
                    </li>
                    
                    
                </ul>
            </div>

            <div class="page_content">
                
            
                    <div class="res_header">
                        <h2>개인정보 수정</h2>
                        <div style="border: 2px solid lightgray;"></div>
                    </div>
                    
                    <div style="display: flex; justify-content: center; padding-top: 150px;">
                        <form action="<%=contextPath%>/updatePersonalInfo.cu" method="post">
                            <div class="input-group mb-3" style="align-items: center;">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"style="background-color: rgb(235, 231, 227);">비밀번호</span>
                                </div>
                                <input type="password"  name="userPwd" class="form-control pwd_confirm" placeholder="비밀번호를 입력하시오" style="margin: 0 auto;">
                            </div>
                            <div class="pwd_confirm_button" style="display: flex; justify-content: center;">
                                <button type="submit" class="btn btn-primary" style="width: 100px; background-color: rgb(235, 231, 227); color: black; border: none; margin-right: 10px;">확인</button>
                                <a href="<%=contextPath%>/mypage.cu" class="btn btn-primary" style="width: 100px; background-color: rgb(99, 76, 70); border: none;">취소</a>
                            </div>
                        </form>
                    </div>
            </div>
            

        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>

</body>
</html>