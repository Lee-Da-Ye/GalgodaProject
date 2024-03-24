<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SignUp Terms Of Use</title>
</head>
<style>
	/* 회원가입 약관 페이지 관련 스타일 */
		.mypage_header {
            margin: 0 auto;
            width: 600px;
	     }
        .tos_form{
            text-align: left;
            width: 600px;
            margin: 0 auto;
            
        }
        
        .view_full {
            color: gray;
            cursor: pointer;
            margin-left: 20px;
        }

        .terms_of_use {
            overflow-y: auto;
            max-height: 150px; /* 스크롤을 표시할 최대 높이 */
            padding: 10px;
            border: 1px solid #ccc; /* 선택사항: 박스에 테두리를 추가합니다. */
            margin-top: 10px; /* 선택사항: 이전 요소와의 간격을 조정합니다. */
        }

        .terms_content{
            font-size: 13px;
        }
		
			
	 	.identification_btn {
		    background-color: #bfb4b0;
		    color: white;
		}
		
		.identification_btn.disabled {
		    background-color: darkgray;
		    cursor: not-allowed;
		}
		
		.identification_btn.active {
		    background-color: #bfb4b0; /* 활성화된 상태일 때의 배경색 */
		}


		
		
</style>




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

                <div class="tos_form">
                    <input type="checkbox" id="checkbox1" class="required_checkbox">
                        <label for="checkbox1">[필수] GALGODA 이용약관</label>
                    
                    <div class="terms_of_use">
                        
                        <div class="terms_content">
                            <p>제1조 규정 일반</p>
                            <p>1. 본 약관은 주식회사 GALGODA(이하 “회사”)의 이용에 관한 기본적인 사항을 정함을 목적으로 합니다.</p>
                            <p>2. 이용약관의 내용을 추가합니다.</p>
                            <p>3. 이용약관의 내용을 추가합니다.</p>
                            <p>4. 이용약관의 내용을 추가합니다.</p>
                            <p>5. 이용약관의 내용을 추가합니다.</p>
                            <p>6. 이용약관의 내용을 추가합니다.</p>
                            <p>7. 이용약관의 내용을 추가합니다.</p>
                            <p>8. 이용약관의 내용을 추가합니다.</p>
                            <p>9. 이용약관의 내용을 추가합니다.</p>
                            <p>10. 이용약관의 내용을 추가합니다.</p>
                        </div>
                    </div>

                    <br>
                    <input type="checkbox" id="checkbox2" class="required_checkbox">
                        <label for="checkbox2">[필수] 개인정보 수집 및 이용</label>

                    <div class="terms_of_use">
                        
                        <div class="terms_content">
                            <p>제1조 수집 및 이용 항목</p>
                            <p>성명(국문·영문), 생년월일, 성별, 이메일주소, 휴대폰번호, 구매 및 예약내역, 투숙기간, 아이디, 비밀번호</p>
                            <p>제2조 수집 및 이용 목적</p>
                            <p>본인 식별, GALGODA 서비스 제공 및 민원처리</p>
                            <p>제3조 보유 이용 기간</p>
                            <p>회원 탈퇴 시까지</p>

                        </div>
                    </div>

                    <br>

                    <input type="checkbox" id="checkbox3">
                        <label for="checkbox3">[선택] 개인정보 마케팅 활용 동의</label>
                    <div class="terms_of_use">
                        
                        <div class="terms_content">
                            <p>제1조 수집 및 이용 항목</p>
                            <p>성명(국문·영문), 생년월일, 성별, 이메일주소, 휴대폰번호, 자택전화, 자택주소, 구매 및 예약 내역, 투숙기간, 아이디</p>
                            <p>제2조 수집 및 이용 목적</p>
                            <p>GALGODA 상품 및 서비스 소개, 기타 제휴 호텔의 상품 및 서비스 소개, 사은·판촉행사 안내, 만족도 조사, 시장 조사</p>
                        </div>
                    </div>
                    <br>

                   <button type="button" class="btn form-control identification_btn" onclick="checkRequired();">본인인증 하기</button>

                </div>
                
                <script>
				document.addEventListener('DOMContentLoaded', function() { 
					// DOMContentLoaded 이벤트를 사용하여 페이지의 모든 요소가 로드되었을 때 스크립트 코드가 실행되도록 함
				    const checkbox1 = document.getElementById('checkbox1');
				    const checkbox2 = document.getElementById('checkbox2');
				    const button = document.querySelector('.identification_btn');
				
				    checkValidity(); // 페이지 로드 시 초기 체크 상태 확인
				
				    checkbox1.addEventListener('change', function() {
				        // 체크박스 변경 시 필수 항목 모두 선택 여부 다시 확인
				        checkValidity();
				    });
				
				    checkbox2.addEventListener('change', function() {
				        // 체크박스 변경 시 필수 항목 모두 선택 여부 다시 확인
				        checkValidity();
				    });
				
				    function checkValidity() {
				        if (checkbox1.checked && checkbox2.checked) {
				            // 필수 항목이 모두 선택되었을 때 버튼 활성화
				            button.classList.remove('disabled');
				            button.classList.add('active');
				        } else {
				            // 하나 이상의 필수 항목이 선택되지 않았을 때 버튼 비활성화
				            button.classList.add('disabled');
				            button.classList.remove('active');
				        }
				    }
				});
				
				
				function checkRequired() {
				    const checkbox1 = document.getElementById('checkbox1');
				    const checkbox2 = document.getElementById('checkbox2');
				
				    if (checkbox1.checked && checkbox2.checked) {
				        // 필수 항목이 모두 선택되었을 때
				        // 본인인증 페이지로 이동
				    	window.location.href = "<%=contextPath%>/authenti.co";
				    } else {
				        // 필수 항목 중 하나라도 선택되지 않았을 때
				        alert('필수 항목에 모두 동의해야 합니다.');
				    }
				}
				
				
				
				</script>

        
                <br>

            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>