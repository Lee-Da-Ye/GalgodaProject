<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Customer user = (Customer)request.getAttribute("user"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자조회페이지</title>
<style>
.contentName{
    color: rgb(115, 90, 75);
}

.buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}

#userTable{
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

/* 버튼 색 변경*/
#btn_color1{
    background-color: rgb(115, 90, 75); color: white;
}
#btn_color2{
    margin-right: 10px; background-color: rgb(235,231,227); color: black; border: none;
}

</style>
</head>
<body>
	<div class="wrap">
	<%@ include file="/views/common/adminHeader.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h4 class="sideMenubar_head">사용자 관리</h4>
                    </li>
                    
                    <li>
                        <a href="<%=contextPath%>/userList.su" class="nav-link" style="background-color: rgb(115, 90, 75); color: white;"  href="" >계정정보 조회</a>
                    </li>
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">사용자 계정 조회</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>
                
                <!------------------------------------>
                
                <div>
                    <div class="right_nav">
                        
                        <span id="boot-icon" class="bi bi-person-circle" style="font-size: 26px; margin-left: 10px;"> <%=user.getUserName() %>님 (<%=user.getUserId() %>)</span>
                        
                    </div>
    
                    <form action="<%=contextPath %>/updateUser.su" method="post" class="modify_form">
                    	<input type="hidden" name="userNo" value="<%=user.getUserNo() %>">
                        <div style="display: flex;">
                            <table id="userTable">
                                <tr>
                                    <th>이름</th>
                                    <td><input type="text" name="userName" class="form-control" required value="<%=user.getUserName()%>"></td>
                                </tr>
                                <tr>
                                    <th>아이디</th>
                                    <td>
                                        <input type="text" name="userId" class="form-control" required value="<%=user.getUserId()%>" readonly>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>
                                        <div style="display: flex;">
                                        <%String phone = user.getPhone(); %>
                                            <input type="text" name="phone1" class="form-control" style="flex: 1;" required value="<%=phone.substring(0,phone.indexOf('-'))%>">
                                            <span style="margin: 0 5px; text-align: center;">-</span>
                                            <input type="text" name="phone2" class="form-control" style="flex: 1;" required value="<%=phone.substring(phone.indexOf('-')+1,phone.lastIndexOf('-'))%>">
                                            <span style="margin: 0 5px;">-</span>
                                            <input type="text" name="phone3" class="form-control" style="flex: 1;" required value="<%=phone.substring(phone.lastIndexOf('-')+1)%>">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="email" name="email" class="form-control" required value="<%=user.getEmail()%>"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                        <div style="display: flex;">
                                            <input type="text" name="address" class="form-control" required value="<%=user.getAddress() %>" style="flex: 1;">
                                            <button id="findZipCodeButton" class="btn btn-outline-primary btn-sm" style="background-color: rgb(99,76,70); color: white; border: none;">우편번호 찾기</button>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="border: none; background-color: white;"></th>
                                    <td><input type="text" name="addressDetail" class="form-control" required value="<%=user.getAddressDetail()%>"></td>
                                </tr>
                                
        
                            </table>
                    
                        </div>
                        
                        <div style="display: flex; justify-content: flex-end;">
                            <button type="submit" class="btn btn-secondary" id="btn_color2" onclick="return confirm('정보를 수정하시겠습니까?')" >정보수정</button>
                            
                        </div>
                        
                    </form>

                                     
                </div>

			</div>

                <!-------------------------------------->

        </section>

         <%@ include file="/views/common/footer.jsp" %>
	</div>
	
</body>
</html>