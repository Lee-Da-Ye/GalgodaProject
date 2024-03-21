<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String userId = (String)request.getAttribute("userId");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find UserId Result</title>
<style>
		.mypage_header {
            margin: 0 auto;
            width: 600px;
        }

        /* 아이디 찾기 결과 창 스타일 */
        #id_found{
            width: 500px;
            height: 200px;
            background-color: rgb(247, 244, 244);
            margin-top: 50px;
            color: rgb(99, 76, 70);
            text-align: center;
            margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬 */
        }
        #find_pwd{
            color: rgb(99, 76, 70);
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

            <div class="page_content text-center"> 


                <div class="mypage_header text-left">
                    <h3>아이디 찾기</h3>
                    <div style="margin-top: 10px; margin-bottom: 20px; border: 2px solid lightgray;"></div>
                </div>
        
                <br>

                <div id="id_found" class="text-center">
                    <div class="row justify-content-left align-items-center" style="padding-top: 80px;">
                        <div class="col-md-3" style="padding-left: 40px;">
                            <label for="inputName" class="col-form-label">아이디</label>
                        </div>
                        <div class="col-md-6">
                            <input type="text" class="form-control" id="inputName" value="<%=userId %>">
                        </div>
                    </div>
                    <div class="row mt-1" style="padding-left: 90px;">
                        <div class="col-md-6">
                            <a href="<%=contextPath %>/findUserPwd.co" id="find_pwd" class="d-block">비밀번호 찾기</a>
                        </div>
                    </div>
                </div>
                
                <div class="text-center mt-3">
                    <a href="<%=contextPath %>/loginMain.co" class="btn btn-primary" style="width: 500px; background-color: rgb(191, 180, 176); border: none; display: block; margin: 0 auto;">로그인 화면으로 이동</a>
                </div>
                
                
            
            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div> 
</body>
</html>