<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>HotelUser Resign Form</title>
<style>
		/* 사이드메뉴바 선택 시 색상 적용 */
        .modify_btn{
            background-color: rgb(99, 76, 70);
            color: white;
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
                        <a class="nav-link" style="color: black;" href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/hotelinsertForm.ho">호텔 등록</a>
                        </div>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="<%=contextPath%>/hotelupdateForm.ho">호텔 정보 수정</a>
                        </div>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="<%=contextPath%>/roominsertForm.ho">객실 등록</a>
                        </div>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="<%=contextPath%>/roomUpdateForm.ho">객실 수정</a>
                        </div>
                    </li>
                    
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="<%=contextPath%>/revList.ho?page=1">리뷰 관리</a>
                        </div>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%= contextPath %>/resList.ho?page=1" >예약 관리</a>
                    </li>
                    
                    <li class="modify_btn">
                        <a class="nav-link" href="<%=contextPath %>/personalInfo.ho" >담당자 정보 수정</a>
                    </li>
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                     <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="<%=contextPath%>/list.no?page=1">공지사항</a></div> </li>   
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="<%=contextPath%>/list.inq?page=1">문의사항</a></div> </li>   
            
                    
                </ul>
            </div>

            <div class="page_content">
                <div class="withdraw_page">
            
                    <div class="withdraw_header">
                        <h2>회원 탈퇴</h2>
                        <div style="border: 2px solid lightgray; min-width: 800px;"></div>
                    </div>
    
                    <br>
    
                    <div>
                        <h6>회원 탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h6>

                        <br>

                        <div class="row">
                            <div class="col-auto pr-0">
                                <div class="form-check" style="margin-bottom: 20px;">
                                    <input type="checkbox" class="form-check-input" id="checkbox1">
                                    <label class="form-check-label" for="checkbox1"></label>
                                </div>
                            </div>
                            <div class="col pl-0">
                                <label for="checkbox1">사용하고 계신 아이디는 탈퇴할 경우 재사용 및 복구가 불가능합니다</label>
                            </div>
                        </div>
                
                        <div style="margin-left: 20px; margin-top: -15px;">
                            <h6 style="font-size: 14px; color: gray;">탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가하오니 신중하게 선택하시기 바랍니다.</h6>
                        </div>

                        <br>

                        <div class="row">
                            <div class="col-auto pr-0">
                                <div class="form-check" style="margin-bottom: 20px;">
                                    <input type="checkbox" class="form-check-input" id="checkbox2">
                                    <label class="form-check-label" for="checkbox2"></label>
                                </div>
                            </div>
                            <div class="col pl-0">
                                <label for="checkbox2">탈퇴 후 회원정보, 객실정보 및 사이트 이용기록은 모두 삭제됩니다.</label>
                            </div>
                        </div>
                
                        <div style="margin-left: 20px; margin-top: -15px;">
                            <h6 style="font-size: 14px; color: gray;">회원정보 및 예약 내역 등 사이트 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. </h6>
                        </div>

                        <br>

                        <div class="row">
                            <div class="col-auto pr-0">
                                <div class="form-check" style="margin-bottom: 20px;">
                                    <input type="checkbox" class="form-check-input" id="checkbox3">
                                    <label class="form-check-label" for="checkbox3"></label>
                                </div>
                            </div>
                            <div class="col pl-0">
                                <label for="checkbox3">탈퇴 후 재가입 시 호텔 정보, 객실 정보 등 관련 정보를 모두 신규 등록해야 합니다.</label>
                            </div>
                        </div>
                
                        <div style="margin-left: 20px; margin-top: -15px;">
                            <h6 style="font-size: 14px; color: gray;">본 사이트에 게재되었던 호텔 정보, 객실 정보 등은 회원 탈퇴와 동시에 일괄 삭제됩니다.
                                <br>탈퇴 후 재가입 시 기존에 등록되었던 정보는 사용할 수 없습니다.</h6>
                        </div>

                        <br>


                        <div style="margin-left: 20px; margin-top: -15px;">
                            <h6 style="font-size: 16px; color: gray; font-weight: bold; white-space: nowrap;">탈퇴 후에는 기존 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.</h6>
                        </div>

                        <br>

                        <div class="row">
                            <div class="col-auto pr-0">
                                <div class="form-check" style="margin-bottom: 20px;">
                                    <input type="checkbox" class="form-check-input" id="checkbox4">
                                    <label class="form-check-label" for="checkbox4"></label>
                                </div>
                            </div>
                            <div class="col pl-0">
                                <label for="checkbox4" style="font-size: 16px; font-weight: bold;">안내 사항을 모두 확인하였으며, 이에 동의합니다.</label>
                            </div>
                        </div>
                        
                        <br>

                        <div style="display: flex; justify-content: flex-end;">
                            <button type="button" class="btn btn-secondary" id="withdrawButton" data-toggle="modal" data-target="#myModal1" style="margin-right: 200px; background-color: rgb(99, 76, 70);" disabled>회원탈퇴</button>
                        </div>

                        <!-- 회원 탈퇴 확인 모달 -->
                        <div class="modal fade" id="myModal1">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <!-- 모달 헤더 -->
                                    <div class="modal-header">
                                        <h4 class="modal-title">회원 탈퇴 확인</h4>
                                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                                    </div>
                                    <!-- 모달 바디 -->
                                    <div class="modal-body">
                                        <p>정말로 회원 탈퇴하시겠습니까?</p>
                                    </div>
                                    <!-- 모달 푸터 -->
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
                                        <a href="<%=contextPath%>/resignConfirm.hu" class="btn btn-danger" id="confirmWithdrawButton">확인</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <script>
                            $(document).ready(function() {
                                // 모든 체크박스를 모니터링하고 모든 체크박스가 체크되었을 때 버튼을 활성화시킴
                                $('input[type="checkbox"]').change(function() {
                                    var allChecked = true;
                                    $('input[type="checkbox"]').each(function() {
                                        if (!this.checked) {
                                            allChecked = false;
                                            return false; // 중단
                                        }
                                    });
                                    $('#withdrawButton').prop('disabled', !allChecked);
                                });
                        
                                // 입력란 클릭 시 연결된 체크박스를 선택하도록 설정
                                $('input[type="text"]').click(function() {
                                    var checkboxId = $(this).attr('data-checkbox');
                                    $('#' + checkboxId).prop('checked', !$('#' + checkboxId).prop('checked'));
                                });
                        
                                // 입력란에서 포커스 아웃 시 연결된 체크박스의 상태를 업데이트
                                $('input[type="text"]').focusout(function() {
                                    var checkboxId = $(this).attr('data-checkbox');
                                    var isChecked = $('#' + checkboxId).prop('checked');
                                    $('#' + checkboxId).prop('checked', isChecked);
                                });
                        
                                
                            });
                        </script>
                        
                        
                        

                        

                        




                    </div>
                    
                </div>

            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>