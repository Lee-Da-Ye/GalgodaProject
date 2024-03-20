<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Resign Form</title>
<style>
	/* 사이드메뉴 선택함에 따라 색상 변경 */
    .modify_btn{
        background-color: rgb(99, 76, 70);
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
                        <a class="nav-link" style="color: black;" href="" data-toggle="collapse" data-target="#demo">예약관리</a>
                    </li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">상세 조회</a>
                        </div>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">예약 변경/취소</a>
                        </div>
                    </li>
                    
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">리뷰 관리</a>
                        </div>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo2">위시리스트</a>
                    </li>
                    
                    <li class="modify_btn">
                        <a class="nav-link" href="#" data-toggle="collapse" data-target="#demo3" style="color : white">개인정보 수정</a>
                    </li>
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                
                <div class="withdraw_page">
            
                    <div class="withdraw_header">
                        <h2>회원 탈퇴</h2>
                        <div style="border: 2px solid lightgray;"></div>
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
                                <label for="checkbox2">탈퇴 후 회원정보 및 사이트 이용기록은 모두 삭제됩니다.</label>
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
                                <label for="checkbox3">탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</label>
                            </div>
                        </div>
                
                        <div style="margin-left: 20px; margin-top: -15px;">
                            <h6 style="font-size: 14px; color: gray;">본 사이트에 올린 리뷰 및 문의글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
                                <br>삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다. <br>
                                탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다. </h6>
                        </div>

                        <br>


                        <div style="margin-left: 20px; margin-top: -15px;">
                            <h6 style="font-size: 16px; color: gray; font-weight: bold;">탈퇴 후에는 기존 아이디로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
                                <br>게시판형 서비스에 남아 있는 게시글은 탈퇴 후 삭제할 수 없습니다. </h6>
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
                                        <a href="<%=contextPath%>/resignConfirm.cu" class="btn btn-danger" id="confirmWithdrawButton">확인</a>
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
</body>
</html>