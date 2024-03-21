<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel SignUp</title>
<style>
 		/* 회원가입 정보 입력 창 관련 스타일 */

        
        table{
            border-spacing: 10px;
            border-collapse: separate;
            
        }
        table th{
            width: 300px;
            height: 40px;
            background-color: rgb(235, 231, 227);
            border-radius: 5px;
            text-align: center;
            border: 1px solid lightgray;
            color: rgb(94, 94, 94);
            
        }

        table td{
            width:1000px;
            height: 30px;
            border-radius: 5px;
            padding-left: 5px;
        }
        #signup_form{
            width: 70%;
            display: flex;
            justify-content: center;
            margin: auto;
            margin-top: -10px;
        }
        #signup_form > div {
            width: 70%;
        }
        #signup_btn{
            background-color: rgb(191, 180, 176);
            color: white;
        }
        #usernameValidationMessage, #userPwdValidationMessage{
           	display: block;
		    margin-top: 5px; /* 입력 칸과의 간격을 조절합니다. */
		    color: red;
		    position: relative;
		    left: 0; /* 왼쪽 여백을 0으로 설정하여 텍스트를 왼쪽 끝에 배치합니다. */
		    width: fit-content; /* 텍스트 너비에 맞게 요소의 너비를 조정합니다. */
        }
       
</style>

<script>

	//초기 상태 설정: 중복 확인 및 비밀번호 일치, 인증코드 일치 여부를 저장하는 변수들
	var isEmailValid = false;
	var isUserIdValid = false;
	var isPasswordMatch = false;
	var isVerificationCodeMatch = false;
    
    
    function checkPassword() {
        var password1 = document.getElementById("password1").value;
        var password2 = document.getElementById("password2").value;

        if (password1 === password2) {
            // 비밀번호가 일치할 때의 처리
            alert("비밀번호가 일치합니다.");
            isPasswordMatch = true;
        } else {
            // 비밀번호가 일치하지 않을 때의 처리
            alert("비밀번호가 일치하지 않습니다.");
            isPasswordMatch = false;
        }
        checkSignUpButtonState(); // 회원가입 버튼 상태 업데이트
    }
    
    function emailCheck() {
        // 이메일 입력값 가져오기
        var email = document.getElementById("email").value;

        // 입력값이 비어 있는지 확인
        if (email === "") {
            alert("이메일을 입력해주세요.");
            return; // 함수 종료
        }

        // 서버로 이메일 중복 확인 요청을 보냄
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/emailDoubleCheck.co",
            data: { email: email },
            dataType: "json",
            success: function(response) {
                // 서버에서 받은 응답 처리
                if (response.isEmailDuplicate) {
                    alert("중복된 이메일입니다.");
                    isEmailValid = false; // 이메일이 중복됨을 저장
                } else {
                    alert("사용 가능한 이메일입니다.");
                    isEmailValid = true; // 이메일이 중복되지 않음을 저장
                }
                checkSignUpButtonState(); // 회원가입 버튼 상태 업데이트
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }
    
    function userIdCheck() {
        // userID 입력값 가져오기
        var userId = document.getElementById("userId").value;

        // 입력값이 비어 있는지 확인
        if (userId === "") {
            alert("아이디를 입력해주세요.");
            return; // 함수 종료
        }

        // 서버로 아이디 중복 확인 요청을 보냄
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/userIdDoubleCheck.co",
            data: { userId: userId },
            dataType: "json",
            success: function(response) {
                // 서버에서 받은 응답 처리
                if (response.isUserIdDuplicate) {
                    alert("중복된 아이디입니다.");
                    isUserIdValid = false; // 아이디가 중복됨을 저장
                } else {
                    alert("사용 가능한 아이디입니다.");
                    isUserIdValid = true; // 아이디가 중복되지 않음을 저장
                }
                checkSignUpButtonState(); // 회원가입 버튼 상태 업데이트
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    }
    
    // 인증코드 일치하는지 확인하는 요청
    function verificationCodeCheck() {
    	// hotelName 입력값 가져오기
    	 var hotelName = document.getElementById("hotelName").value;
    	// hotel 인증코드값 가져오기
        var verificationCode = document.getElementById("verificationCode").value;

        // 입력값이 비어 있는지 확인
        if (verificationCode === "") {
            alert("인증코드를 입력해주세요.");
            return; // 함수 종료
        }

        // 서버로 아이디 중복 확인 요청을 보냄
        $.ajax({
            type: "GET",
            url: "<%=request.getContextPath()%>/hotelCodeCheck.co",
            data: { verificationCode: verificationCode, hotelName: hotelName },
            dataType: "json",
            success: function(response) {
                // 서버에서 받은 응답 처리
                if (response.isCodeAccord) {
                    alert("인증코드가 일치합니다.");
                    isVerificationCodeMatch = true;
                } else {
                    alert("인증코드가 불일치합니다.");
                    isVerificationCodeMatch = false;
                }
                checkSignUpButtonState(); // 회원가입 버튼 상태 업데이트
            },
            error: function(xhr, status, error) {
                console.error("Error:", error);
            }
        });
    	
    	
    }
    
    
    
    
 	// 아이디 유효성 체크
    function validateUsername() {
        var username = document.getElementById("userId").value;
        var isValid = /^HOTELUSER\d+$/.test(username); // HOTELUSER로 시작하고 숫자가 하나 이상인지 검사하는 정규표현식

        if (isValid) {
            document.getElementById("usernameValidationMessage").innerText = ""; // 유효한 경우 알림 메시지를 지움
        } else {
            document.getElementById("usernameValidationMessage").innerText = "아이디 생성 규칙 위반"; // 유효하지 않은 경우 알림 메시지를 표시합니다.
        }
    }
    
    // 비밀번호 유효성 체크
    function validatePassword() {
	    var password = document.getElementById("password1").value;
	    var isValid = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,20}$/.test(password); // 정규표현식을 사용하여 유효성을 체크
	
	    if (isValid) {
	        document.getElementById("userPwdValidationMessage").innerText = ""; // 유효한 경우 알림 메시지를 지움
	    } else {
	        document.getElementById("userPwdValidationMessage").innerText = "비밀번호 생성 규칙 위반"; // 유효하지 않은 경우 알림 메시지를 표시합니다.
	    }
	}
    
 	// 휴대폰 번호 입력 시 자동 - 넣기
	 const hypenTel = (target) => {
	 target.value = target.value
	   .replace(/[^0-9]/g, '')
	   .replace(/^(\d{2,3})(\d{3,4})(\d{4})$/, `$1-$2-$3`);
	}
	 
	// 회원가입 버튼 상태 업데이트 함수
	    function checkSignUpButtonState() {
	        // 모든 조건이 충족되었을 때 버튼을 활성화
	        if (isEmailValid && isUserIdValid && isPasswordMatch && isVerificationCodeMatch) {
	            document.getElementById("signup_btn").disabled = false;
	        } else {
	            document.getElementById("signup_btn").disabled = true;
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
                    <h3>회원가입</h3>
                    <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>
                </div>

                <div id="signup_form">

                    <div>

                        <h5>기본정보 입력</h5>
                    
                        <form action="<%=contextPath%>/signupHotelConfirm.co" method="post">
                            
                                <table style="border-spacing: 10px;border-collapse: separate;">
                                    <tr>
                                        <th>호텔명 *</th>
                                        <td><input type="text" id="hotelName" name="hotelName" class="form-control" placeholder="공백 없이 입력" required></td>
                                    </tr>
                                    <tr>
                                        <th>인증코드 *</th>
                                        <td>
                                            <div style="display: flex;">
                                                <input type="text" id="verificationCode" name="verificationCode" class="form-control" required style="flex: 1;">
                                                <button type="button" id="codeAccord" class="btn btn-outline-primary btn-sm" style="background-color: rgb(99,76,70); color: white; border: none;" onclick="verificationCodeCheck();">인증확인</button>
                                            </div>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                        <th>담당자명 *</th>
                                        <td><input type="text" name="userName" class="form-control" required></td>
                                    </tr>
                                    <tr>
                                        <th>이메일 *</th>
                                        <td>
                                            <div style="display: flex;">
                                                <input type="email" id="email" name="email" class="form-control" required style="flex: 1;">
                                                <button type="button" id="doubleCheckEmail" class="btn btn-outline-primary btn-sm" style="background-color: rgb(99,76,70); color: white; border: none;" onclick="emailCheck();">중복확인</button>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>연락처 *</th>
                                        <td><input type="text" oninput="hypenTel(this)" maxlength="13" name="phone" class="form-control" required></td>
                                    </tr>
                                    
                                    
            
                                </table>

								<br>
								
                                <h5>웹사이트 정보 입력</h5>

                                <table style="border-spacing: 10px;border-collapse: separate;">
                                    <tr>
                                        <th>아이디 *</th>
                                        <td>
                                            <div style="display: flex;">
                                                <input type="text" id="userId" name="userId" class="form-control" required style="flex: 1;" placeholder="HOTELUSER + 숫자" oninput="validateUsername();">
                                                <button type="button" id="doubleCheckId" class="btn btn-outline-primary btn-sm" style="background-color: rgb(99,76,70); color: white; border: none;" onclick="userIdCheck();">중복확인</button>
                                           		<span id="usernameValidationMessage" style="color: red;"></span> <!-- 유효성 검사 결과를 표시할 영역입니다. -->
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>비밀번호 *</th>
                                        <td><input type="password" id="password1" name="userPwd" class="form-control" required placeholder="8~20자 이내 영문/숫자 조합(특수문자 가능)" oninput="validatePassword();"></td>
                                    </tr>
                                    <tr>
                                        <th>비밀번호 확인 *</th>
                                        <td>
                                        	<div style="display: flex;">
	                                       		<input type="password" id="password2" class="form-control" style="flex: 1;" required>
	                                       		<button type="button" id="doubleCheckPwd" class="btn btn-outline-primary btn-sm" style="background-color: rgb(99,76,70); color: white; border: none;" onclick="checkPassword();">일치확인</button>
                                        		<span id="userPwdValidationMessage" style="color: red;"></span> <!-- 유효성 검사 결과를 표시할 영역입니다. -->
                                        </td>
                                    </tr>
                                
                                </table>

                                <br>

                                <button type="submit" class="btn" id="signup_btn" style="width: 100%;" disabled>회원가입 완료</button>
                    
                        </form>
                
                        <br>
                    </div>
                </div>
            
            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>