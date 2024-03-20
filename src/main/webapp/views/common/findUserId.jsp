<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Find UserId Page</title>
<style>
		
		.mypage_header {
		        margin: 0 auto;
		        width: 600px;
        }
        
		/* 인증번호 받기 box 스타일 */
       #identification_box{
            border: 0.5px solid gray;
            color: black;
            background-color: rgb(224, 224, 224);
        }
        
        /* 아이디 찾기 넘어가는 버튼 스타일 */
        #identification_enter{
            border: none;
            background-color: rgb(235, 231, 227);
            color: rgb(64, 64, 64);
        }

        #identification_main {
	        text-align: center;
	        width: 50%;
	        margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬 */
	        width: 50%; /* 원하는 폭으로 설정 */
	        margin-bottom: 30px;
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
                    <h3>아이디 찾기</h3>
                    <div style="margin-top: 10px; margin-bottom: 20px; border: 2px solid lightgray;"></div>
                </div>
        
                <div id="identification_main" class="card-body">
                    <!-- 휴대폰 번호로 아이디 찾기 폼 -->
                    <form action="<%=contextPath %>/findUserIdConfirm.co" method="POST">
                                        
                        <!-- 이름 입력 -->
                        <div class="form-row align-items-center mb-3">
                            <div class="col-md-3">
                                <label for="inputName" class="col-form-label">이름</label>
                            </div>
                            <div class="col">
                                <input type="text" class="form-control" name="userName" id="inputName" placeholder="이름을 입력하세요">
                            </div>
                        </div>
                    
                        <!-- 휴대폰 번호 입력 -->
                        <div class="form-row align-items-center mb-3">
                            <div class="col-md-3">
                                <label for="inputPhoneNumber" class="col-form-label">휴대폰 번호</label>
                            </div>
                            <div class="col">
                                <div class="input-group">
                                    <input type="tel" class="form-control" name="phone" id="inputPhoneNumber" placeholder="휴대폰 번호를 입력하세요 ('-' 포함)">
                                    <div class="input-group-append">
                                        <button type="button" id="identification_box" class="btn btn-outline-primary" onclick="sendVerificationCode();">인증번호 받기</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    
                        <!-- 인증번호 입력 -->
                        <div class="form-row align-items-center mb-3">
                            <div class="col-md-3">
                                <label for="inputVerificationCode" class="col-form-label">인증번호</label>
                            </div>
                            <div class="col">
	                            <div class="input-group">
	                                <input type="text" class="form-control" id="inputVerificationCode" placeholder="인증번호를 입력하세요">
	                                <div class="input-group-append">
	                                        <button type="button" id="identification_box" class="btn btn-outline-primary" onclick="confirmVerificationCode();">인증번호 확인</button>
	                                </div>
	                             </div>
                            </div>
                        </div>
                    
                        <!-- 아이디 찾기 버튼 -->
                        <button type="submit" id="identification_enter" class="btn btn-primary btn-block">휴대폰 번호로 아이디 찾기</button>
                    </form>
                
                    <br><br>
                
                      
                </div>
                
            
            </div>

		<script>
			
			var verificationCode = ""; // 전역 변수 선언
	
			function sendVerificationCode() {
			    var phoneNumber = document.getElementById("inputPhoneNumber").value;
			    var xhr = new XMLHttpRequest();
			    xhr.open("GET", "<%=contextPath%>/authentiSms.co?phone=" + phoneNumber, true); // 서블릿 URL에 따라 수정
			    xhr.onreadystatechange = function () {
			        if (xhr.readyState === XMLHttpRequest.DONE) {
			            if (xhr.status === 200) {
			                var response = JSON.parse(xhr.responseText); // 서버 응답을 JSON으로 파싱
			                if (response.message === "인증번호가 전송되었습니다.") {
			                    verificationCode = response.verificationCode; // 전역 변수에 저장
			                    alert("인증번호 전송에 성공했습니다.");
			                } else {
			                    alert("인증번호 전송에 실패했습니다.");
			                }
			            } else {
			                alert("서버 오류로 인증번호를 발송할 수 없습니다.");
			            }
			        }
			    };
			    xhr.send();
			}
	
	
	
			function confirmVerificationCode() {
			    var inputCode = document.getElementById("inputVerificationCode").value;
	
			    // 사용자가 입력한 코드와 전역 변수의 코드를 비교
			    if (inputCode === verificationCode) {
			        // 코드가 일치하는 경우
			        alert("인증이 완료되었습니다.");
			    } else {
			        // 코드가 일치하지 않는 경우
			        alert("인증번호가 올바르지 않습니다.");
			    }
			}
	
		</script>

        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>   
</body>
</html>