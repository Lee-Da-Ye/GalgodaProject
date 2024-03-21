<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	HotelUser hu = (HotelUser)request.getAttribute("hu");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelUser Personal Info Form</title>
<style>
	/* 개인정보 수정 페이지 */

        
        table{
            border-spacing: 10px;
            border-collapse: separate;
        }
        table th{
            width: 100px;
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
        .modify_form{
            width: 80%;
        }

        /* 갈색 버튼 모음 */
        .brown_button{
            background-color: rgb(99, 76, 70);
            border: none;
            color: white;
        }

        /* 사이드메뉴바 선택시 색상 적용 */
        .modify_btn{
            background-color: rgb(99, 76, 70);
            color: white;
        }
        
</style>
<script>
	//비밀번호 모달이 열릴 때 호출되는 함수
	function openPasswordModal() {
	    // 모달이 열릴 때마다 입력 필드 초기화
	    document.getElementById("originPassword").value = "";
	    document.getElementById("newPassword").value = "";
	    document.getElementById("confirmPassword").value = "";
	}
	
	// 비밀번호 변경 함수
	function changePassword() {
	    // 기존 비밀번호, 새로운 비밀번호, 비밀번호 확인 값 가져오기
	    var originPasswordInput = document.getElementById("originPassword");
	    var originPassword = originPasswordInput.value;
	    var newPassword = document.getElementById("newPassword").value; // 수정된 부분
	    var confirmPassword = document.getElementById("confirmPassword").value;
	
	    // 이미 화면에 표시된 기존 비밀번호 가져오기
	    var originPasswordOnPage = "<%= hu.getMemPwd() %>";
	    
	 	// 비밀번호 유효성 체크
	    var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*#?&])[A-Za-z\d@$!%*#?&]{8,}$/;
	    if (!newPassword.match(passwordPattern)) {
	        alert("비밀번호는 8자 이상, 영문, 숫자, 특수문자를 포함해야 합니다.");
	        return;
	    }
	
	    // 입력한 기존 비밀번호가 이미 화면에 표시된 기존 비밀번호와 일치하는지 확인
	    if (originPassword !== originPasswordOnPage) {
	        alert("기존 비밀번호가 올바르지 않습니다.");
	        return; // 변경 중지
	    }
	
	    // 기존 비밀번호와 새로운 비밀번호가 같은지 확인
	    if (originPassword === newPassword) {
	        alert("기존 비밀번호와 새로운 비밀번호는 같을 수 없습니다.");
	        return; // 변경 중지
	    }
	
	    // 새로운 비밀번호와 비밀번호 확인 값이 일치하는지 확인
	    if (newPassword !== confirmPassword) {
	        alert("새로운 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
	        return; // 변경 중지
	    }
	
	    // 변경된 비밀번호를 숨겨진 필드에 저장
	    document.getElementById("updatedPwd").value = newPassword;
	
	    // 변경된 비밀번호만 서버로 전송하므로 폼 서브밋 필요 없음
	    
		// 비밀번호 변경 완료 알람 표시
	    alert("비밀번호가 변경되었습니다. 정보수정 버튼을 눌러야 최종 반영됩니다.");
	}
	
		// 비밀번호 변경 여부에 따라 hidden 필드 값 설정
	function setUpdatedPassword() {
	    // 비밀번호 변경 여부 확인
	    var originPasswordInput = document.getElementById("originPassword");
	    var originPassword = originPasswordInput.value;
	    var newPassword = document.getElementById("newPassword").value;
	
	    // 변경된 경우 hidden 필드에 변경된 비밀번호 설정
	    if (newPassword !== "") {
	        document.getElementById("updatedPwd").value = newPassword;
	    } else {
	        // 변경되지 않은 경우 기존 비밀번호를 hidden 필드에 설정
	        document.getElementById("updatedPwd").value = originPassword;
	    }
	}
	
	
	
	function submitForm() {
	    // 비밀번호 입력값 가져오기
	    var newPassword = document.getElementById("newPassword").value;
	
	    // 변경된 비밀번호가 비어 있는지 확인
	    if (newPassword === "") {
	        // 새로운 비밀번호가 비어 있는 경우, 기존 비밀번호로 설정
	        document.getElementById("updatedPwd").value = "<%= hu.getMemPwd() %>";
	    } else {
	        // 변경된 비밀번호가 비어 있지 않으면 hidden 필드에 변경된 비밀번호 설정
	        document.getElementById("updatedPwd").value = newPassword;
	    }
	
	    // 폼 제출
	    document.getElementById("myForm").submit();
	}
	
	// 이메일 중복 확인 함수
    function emailCheck() {
    	// 이메일 입력값 가져오기
        var email = document.getElementById("email").value;
        var originalEmail = document.getElementById("originalEmail").value;

        // 입력값이 비어 있는지 확인
        if (email === "") {
            alert("이메일을 입력해주세요.");
            return; // 함수 종료
        }

        
     	// 새로운 이메일과 기존 이메일이 다른 경우에만 중복 확인 실행
        if (email !== originalEmail) {
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
	                    document.getElementById("updateInfoButton").disabled = true; // 중복된 경우 정보 수정 버튼 비활성화
	                } else {
	                    alert("사용 가능한 이메일입니다.");
	                    document.getElementById("updateInfoButton").disabled = false; // 사용 가능한 경우 정보 수정 버튼 활성화
	                }
	            },
	            error: function(xhr, status, error) {
	                console.error("Error:", error);
	            }
	        });
        } else{
        	 alert("기존 이메일에서 변경이 없습니다.");
        	 document.getElementById("updateInfoButton").disabled = false; // 사용 가능한 경우 정보 수정 버튼 활성화
        }
    }
	
	
</script>
</head>
<body>
	<div class="wrap">
	
        <%@ include file="/views/common/header.jsp" %>
        
        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">호텔 등록</a>
                        </div>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">호텔 정보 수정</a>
                        </div>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">객실 등록</a>
                        </div>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">객실 수정</a>
                        </div>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">리뷰 관리</a>
                        </div>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo2">예약 관리</a>
                    </li>
                    
                    <li class="modify_btn">
                        <a class="nav-link" href="#" data-toggle="collapse" data-target="#demo3">담당자 정보 수정</a>
                    </li>

                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">고객센터</a>
                    </li>
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                
                <div class="mypage" style="width: 80%; min-height: 80%;">
            
                    <div class="res_header">
                        <h2>담당자 정보 수정</h2>
                        <div style="border: 2px solid lightgray;"></div>
                    </div>
    
                    <br>

                    <div class="right_nav">
                        
                        <span id="boot-icon" class="bi bi-person-circle" style="font-size: 20px;"> <%=hu.getHotelName() %></span>
                        
                    </div>
    
                    <form id="myForm" action="<%=contextPath%>/hotelPersonalInfoUpdate.ho" method="POST">
                        <div style="display: flex;">
                            <table style="border-spacing: 10px; border-collapse: separate;">
                                <tr>
                                    <th>담당자명</th>
                                    <td><input type="text" name="userName" class="form-control" required value="<%=hu.getMemName()%>"></td>
                                </tr>
                                <tr>
                                    <th>아이디</th>
                                    <td>
                                        <input type="text" name="userId" class="form-control" required value="<%=hu.getMemId()%>" readonly>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td>
                                        <!-- 기존 비밀번호 필드 -->
									    <input type="password" name="originPassword" class="form-control" value="<%=hu.getMemPwd()%>" readonly>
									    
									    <!-- 변경된 비밀번호 필드 -->
									    <input type="password" id="updatedPwd" name="updatedPwd" hidden>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="border: none; background-color: white;"></th>
                                    <td style="border: none;">
                                        <button type="button" class="btn btn-outline-primary btn-sm" data-toggle="modal" data-target="#changePasswordModal" style="background-color: rgb(99,76,70); color: white; border: none;" onclick="openPasswordModal();">비밀번호 변경</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>
                                        <input type="text" name="phone" class="form-control" required value="<%=hu.getMemPhone()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                            <div style="display: flex;">
                                                <input type="email" id="email" name="email" class="form-control" required style="flex: 1;" value="<%=hu.getMemEmail()%>">
                                                <input type="hidden" id="originalEmail" value="<%=hu.getMemEmail()%>"> <!-- 기존 이메일을 저장하는 hidden input -->
                                                <button type="button" id="doubleCheckEmail" class="btn btn-outline-primary btn-sm" style="background-color: rgb(99,76,70); color: white; border: none;" onclick="emailCheck();">중복확인</button>
                                            </div>
                                    </td>
                                </tr>
                                
        
                            </table>
                    
                        </div>
                        
                        <br>
                        
                        <div style="display: flex; justify-content: flex-end;">
                            <button type="button" id="updateInfoButton" class="btn btn-secondary" data-toggle="modal" data-target="#myModal1" style="margin-right: 5px; background-color: rgb(235, 231, 227); border: none; color: black;" disabled>정보수정</button>
                            <button type="button" class="btn btn-secondary brown_button" data-toggle="modal" data-target="#myModal2">회원탈퇴</button>
                        </div>

                        <!-- 정보변경 Modal -->
                        <div class="modal" id="myModal1">
                            <div class="modal-dialog">
                            <div class="modal-content">
                        
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4 class="modal-title">정보 수정</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                        
                                <!-- Modal body -->
                                <div class="modal-body">
                                정보를 변경하시겠습니까?
                                </div>
                        
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="submitForm();">확인</button>
                                </div>
                        
                            </div>
                            </div>
                        </div>

                        <!-- 회원탈퇴 Modal -->
                        <div class="modal" id="myModal2">
                            <div class="modal-dialog">
                            <div class="modal-content">
                        
                                <!-- Modal Header -->
                                <div class="modal-header">
                                <h4 class="modal-title">회원 탈퇴</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                        
                                <!-- Modal body -->
                                <div class="modal-body">
                                회원 탈퇴 화면으로 이동하시겠습니까?
                                </div>
                                                        
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
                                <a href="<%=contextPath%>/resign.hu" class="btn btn-danger">확인</a>
                                </div>
                        
                            </div>
                            </div>
                        </div>

                        <!-- 비밀번호 변경 모달 창 -->
                        <div class="modal" id="changePasswordModal" tabindex="-1" role="dialog">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content" style="background-color: #f0f0f0;">
                                    <div class="modal-header">
                                        <h5 class="modal-title">비밀번호 변경</h5>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <!-- 비밀번호 변경 테이블 -->
                                        <table class="table" style="vertical-align: middle;">
                                            <tbody>
                                                <tr>
                                                    <td style="width: 40%;">기존 비밀번호</td>
                                                    <td style="width: 60%;"><input type="password" id="originPassword" class="form-control" required></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 40%;">
                                                    새로운 비밀번호
                                                    <p style="white-space: nowrap;">8자 이상/영문,숫자,특수문자 포함</p>
                                                    </td>
                                                    <td style="width: 60%;"><input type="password" id="newPassword" class="form-control" required></td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 40%;">비밀번호 확인</td>
                                                    <td style="width: 60%;"><input type="password" id="confirmPassword" class="form-control" required></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">변경 취소</button>
                                        <button type="submit" class="btn btn-primary" onclick="changePassword();" data-dismiss="modal">변경 확인</button>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        
                        

                    </form>

                                     
                </div>

                <br>
            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>