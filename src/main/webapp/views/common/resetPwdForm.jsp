<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Pwd Form</title>
<style>
		.mypage_header {
		        margin: 0 auto;
		        width: 600px;
        }

        /* 아이디 찾기 결과 창 스타일 */
        .pwd_reset {
        width: 500px;
        height: auto; /* 높이를 자동으로 조정하여 내용에 맞게 확장되도록 설정 */
        background-color: rgb(247, 244, 244);
        margin-top: 40px;
        color: rgb(99, 76, 70);
        box-sizing: border-box;
        padding: 20px; /* 위, 아래 20px의 패딩을 추가하여 내용과의 간격을 설정 */
        }

        .find_pwd{
            color: rgb(99, 76, 70);
        }
        #pwd_reset_btn{
            background-color: rgb(191, 180, 176);
            border: none;
        }

        .pwd_reset{
            text-align: center;
            width: 40%;
            margin: 0 auto; /* 좌우 마진을 자동으로 설정하여 가운데 정렬 */
            width: 50%; /* 원하는 폭으로 설정 */
            margin-bottom: 30px;  
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
        
        
        function validatePassword(password) {
            // 비밀번호 규칙: 8자 이상, 영문, 숫자, 특수문자를 포함해야 함
            var passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/;
            return passwordRegex.test(password);
        }
        
        
        function submitResetPwdForm() {
        	
        	event.preventDefault(); // 폼의 제출을 막음
        	
            var userType = document.getElementById("userType").value;
            if (userType === "") {
                alert("로그인 유형을 선택하세요.");
                return false; // 폼 제출을 막음
            }

            // 필수 입력란을 확인하여 비어 있는지 검사
            var userId = document.getElementById("userId").value;
            var newPassword = document.getElementById("newPassword").value;
            var confirmPassword = document.getElementById("confirmPassword").value;

            if (userId === "" || newPassword === "" || confirmPassword === "") {
                alert("모든 필수 입력란을 작성하세요.");
                return false; // 폼 제출을 막음
            }

            // 새로운 비밀번호와 확인 비밀번호가 일치하는지 검사
            if (newPassword !== confirmPassword) {
                alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
                return false; // 폼 제출을 막음
            }
            
            // 새로운 비밀번호의 유효성을 체크
            if (!validatePassword(newPassword)) {
                alert("비밀번호는 8자 이상의 영문, 숫자, 특수문자를 포함해야 합니다.");
                return false; // 폼 제출을 막음
            }

            // 모든 조건을 만족하면 폼 제출
            document.getElementById("myForm").submit();
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
                    <h3>비밀번호 재설정</h3>
                    <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                    <br>
                    <h6>인증이 완료되었습니다.<br> GALGODA 비밀번호 재설정이 필요합니다.</h6>
                </div>
            
                <div class="pwd_reset text-center">
                    <form id="myForm" action="<%=contextPath %>/resetUserPwd.co" method="POST">
                    	<input type="hidden" id="userType" name="userType"> <!-- 숨겨진 입력 필드로 유저 타입을 저장 -->
                                        <div class="d-flex loginuser_btn">
                                            <button type="button" class="btn btn-outline-primary flex-fill mr-1 customer_btn" onclick="setUserType('customer')">고객</button>
                                            <button type="button" class="btn btn-outline-primary flex-fill mr-1 hotel_btn" onclick="setUserType('hotel')">호텔</button>
                                            <button type="button" class="btn btn-outline-primary flex-fill admin_btn" onclick="setUserType('admin')">관리자</button>
                                        </div>
                    	<br>
                    
                        <div class="form-row align-items-center mb-3">
                            <div class="col-md-3 text-md-left">
                                <label for="inputUsername" class="col-form-label" style="white-space: nowrap;">아이디</label>
                            </div>
                            <div class="col-md-7 offset-md-1">
                                <input type="text" class="form-control" name="userId" id="userId" placeholder="아이디를 입력하세요" required>
                            </div>
                        </div>
                        
                        <div class="form-row align-items-center mb-3">
                            <div class="col-md-3 text-md-left mt-md-0 mt-3">
                                <label for="inputNewPassword" class="col-form-label" style="white-space: nowrap;">새 비밀번호</label>
                            </div>
                            <div class="col-md-7 offset-md-1">
                                <input type="password" class="form-control" name="newPassword" id="newPassword" placeholder="새 비밀번호를 입력하세요" required>
                            </div>
                        </div>
                        
                        <div class="form-row align-items-center mb-3">
                            <div class="col-md-3 text-md-left mt-md-0 mt-3">
                                <label for="inputVerificationCode" class="col-form-label">새 비밀번호 확인</label>
                            </div>
                            <div class="col-md-7 offset-md-1">
	                            <div class="input-group">
	                                <input type="password" class="form-control" id="confirmPassword" placeholder="새 비밀번호를 입력하세요" required>
	                                <div class="input-group-append">
	                                        <button type="button" id="identification_box" class="btn btn-outline-primary" onclick="confirmNewPassword();">일치 확인</button>
	                                </div>
	                             </div>
                            </div>
                            <div class="pwd_info" style="padding-left: 210px;">
                                <p style="font-size: 14px;">8자~20자, 영문, 숫자, 특수문자</p>
                        	</div>
                        </div>
                        
                        
                        <br>
                        
						                        
						<script>
							//신규 비밀번호 입력 시 일치 확인
							function confirmNewPassword() {
							    var newPassword = document.getElementById("newPassword").value; 
							    var confirmPassword = document.getElementById("confirmPassword").value;
							
							    // 새로운 비밀번호와 비밀번호 확인 값이 일치하는지 확인
							    if (newPassword !== confirmPassword) {
							        alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
							        return; // 변경 중지
							    }
								
								// 비밀번호 변경 완료 알람 표시
							    alert("비밀번호가 일치합니다.");
							}
						</script>
                        
                        <div class="text-center mt-3">
                            <button type="submit" id="pwd_reset_btn" class="btn btn-primary btn-block" onclick="submitResetPwdForm();">비밀번호 재설정</button>
                        </div>
                    </form>
                </div>
                
            
            </div>


        </section>

       <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>