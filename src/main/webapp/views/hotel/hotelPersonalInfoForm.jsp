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
                        <a class="nav-link "  href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="<%= contextPath %>/hotelinsertForm.ho">호텔등록</a></div> </li> 
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="<%=contextPath%>/hotelupdateForm.ho">호텔 정보 수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="<%=contextPath%>/roominsertForm.ho">객실등록</a></div> </li>  
                    <li> <div id="demo"  class="collapse " style="margin-left: 30px;"><a href="<%=contextPath%>/roomUpdateForm.ho">객실수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="<%=contextPath%>/revList.ho?page=1">리뷰 관리</a></div> </li>   
                    
                    
                    <li> 
                        <a class="nav-link" href="<%= contextPath %>/resList.ho?page=1"  >예약관리</a>
                    </li>
                  
                    <li>
                        <a class="nav-link" style="color: white; background-color: rgb(115, 90, 75);" href="<%=contextPath %>/personalInfo.ho" >담당자 정보 수정</a>
                    </li>
                        
                    
                    <li>
                         <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="<%=contextPath%>/list.no?page=1">공지사항</a></div> </li>   
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="<%=contextPath%>/list.inq?page=1">문의사항</a></div> </li>   
                </ul>
            </div>

            <div class="page_content">
                
            
                    <div class="res_header">
                        <h2>담당자 정보 수정</h2>
                        <div style="border: 2px solid lightgray;"></div>
                    </div>
                    
                    <div style="display: flex; justify-content: center; padding-top: 150px;">
                        <form action="<%=contextPath%>/confirmHotelUser.ho" method="post">
                            <div class="input-group mb-3" style="align-items: center;">
                                <div class="input-group-prepend">
                                    <span class="input-group-text"style="background-color: rgb(235, 231, 227);">비밀번호</span>
                                </div>
                                <input type="password"  name="userPwd" class="form-control pwd_confirm" placeholder="비밀번호를 입력하시오" style="margin: 0 auto;">
                            </div>
                            <div class="pwd_confirm_button" style="display: flex; justify-content: center;">
                                <button type="submit" class="btn btn-primary" style="width: 100px; background-color: rgb(235, 231, 227); color: black; border: none; margin-right: 10px;">확인</button>
                                <a href="<%=contextPath%>/mypage.ho" class="btn btn-primary" style="width: 100px; background-color: rgb(99, 76, 70); border: none;">취소</a>
                            </div>
                        </form>
                    </div>
            </div>
            

        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>

</body>
</html>