<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.member.model.vo.Customer" %>
<%
	Customer ct = (Customer)request.getAttribute("ct");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Update Personal Info</title>
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
        
       
</style>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function findZipCode() {
    	new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
    
 	// 비밀번호 모달이 열릴 때 호출되는 함수
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
        var originPasswordOnPage = "<%= ct.getUserPwd() %>";
        
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
            document.getElementById("updatedPwd").value = "<%= ct.getUserPwd() %>";
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
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath %>/resManagement.cu" >예약관리</a>
                    </li>
                        
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath %>/wishlist.cu">위시리스트</a>
                    </li>
                    
             		<li>
                        <a class="nav-link" style="color: black;" href="" data-target="#demo2">리뷰관리</a>
                    </li>
                    
                    
                    <li>
                        <a class="nav-link" style="color: white; background-color: rgb(99, 76, 70)" href="<%=contextPath %>/personalInfo.cu" >개인정보 수정</a>
                    </li>
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                
                <div class="mypage">
            
                    <div class="res_header">
                        <h2>개인정보 수정</h2>
                        <div style="border: 2px solid lightgray;"></div>
                    </div>
    
                    <br>

                    <div class="right_nav">
                        
                        <span id="boot-icon" class="bi bi-person-circle" style="font-size: 26px; margin-left: 10px;"> <%=ct.getUserName() %>님 (<%=ct.getUserId() %>)</span>
                        
                    </div>
    
                    <form action="<%=contextPath%>/updatePersonalInfoConfirm.cu" method="post" id="myForm" class="modify_form">
                        <div style="display: flex;">
                            <table style="border-spacing: 10px; border-collapse: separate;">
                                <tr>
                                    <th>이름</th>
                                    <td><input type="text" class="form-control" name="userName" required value="<%=ct.getUserName()%>"></td>
                                </tr>
                                <tr>
                                    <th>아이디</th>
                                    <td>
                                        <input type="text" class="form-control" required name="userId" value="<%=ct.getUserId()%>" readonly>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td>
                                        <!-- 기존 비밀번호 필드 -->
									    <input type="password" name="originPassword" class="form-control" value="<%=ct.getUserPwd()%>" readonly>
									    
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
                                        <input type="text" class="form-control" name="phone" required value="<%=ct.getPhone()%>">
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                            <div style="display: flex;">
                                                <input type="email" id="email" name="email" class="form-control" required style="flex: 1;" value="<%=ct.getEmail()%>">
                                                <input type="hidden" id="originalEmail" value="<%=ct.getEmail()%>"> <!-- 기존 이메일을 저장하는 hidden input -->
                                                <button type="button" id="doubleCheckEmail" class="btn btn-outline-primary btn-sm" style="background-color: rgb(99,76,70); color: white; border: none;" onclick="emailCheck();">중복확인</button>
                                            </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                        <div style="display: flex;">
                                        	<input type="text" class="form-control" id="sample6_postcode" name="zipcode" required placeholder="우편번호" value="<%=ct.getZipcode()%>" style="width:150px;">
                                            <input type="text" class="form-control" id="sample6_address" name="address" required value="<%=ct.getAddress()%>" style="flex: 1;">
                                            <button type="button" id="findZipCodeButton" class="btn btn-outline-primary btn-sm" style="background-color: rgb(99,76,70); color: white; border: none;" onclick="findZipCode();">우편번호 찾기</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="border: none; background-color: white;"></th>
                                    <td>
                                    	<div style="display: flex;">
                                    		<input type="text" class="form-control" id="sample6_extraAddress" name="addressDetail" required value="<%=ct.getAddressDetail()%>" style="flex: 1;">
                                    		<input type="text" class="form-control" id="sample6_detailAddress" name="etc" value="<%=ct.getEtc()%>" placeholder="세부주소" style="flex: 1;">
                                    </td>
                                </tr>
                                
        
                            </table>
                    
                        </div>
                        
                        <div style="display: flex; justify-content: flex-end;">
                            <button type="submit" id="updateInfoButton" class="btn btn-secondary" data-toggle="modal" data-target="#myModal1" style="margin-right: 10px; background-color: rgb(235,231,227); color: black; border: none;" disabled>정보수정</button>
                            <button type="button" class="btn btn-secondary" data-toggle="modal" data-target="#myModal2" style="margin-right: 10px; background-color: rgb(99,76,70); color: white; border: none;">회원탈퇴</button>
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
	                                <a href="<%=contextPath%>/resign.cu" class="btn btn-danger">확인</a>
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
                                    <div class="modal-footer" style="text-align: right;">
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