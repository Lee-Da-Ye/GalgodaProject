<%@page import="com.galgoda.member.model.vo.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Customer> list = (List<Customer>)request.getAttribute("list"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
/* 페이지 영역 서식*/
.page_content {
    width: 100%; 
    padding-top: 30px;
    padding-left: 30px;
    padding-right: 30px;
}

.contentName{
    color: rgb(115, 90, 75);
}
.page_content table>tbody>tr{cursor: pointer;}

#buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}
#buttonColor:hover{
	color:lightgray;
}
.formCustume{
    color: #495057;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    height: calc(1.3em + 0.75rem + 2px);
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
                        <a class="nav-link" style="background-color: rgb(115, 90, 75); color: white;"  href="" >계정정보 조회</a>
                    </li>
                        
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">사용자 계정 조회</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>

                <table class="table table-hover">
                    <thead>
                      <tr class="table-secondary">
                        <th>선택</th>
                        <th >회원번호</th>
                        <th >회원이름</th>
                        <th >회원ID</th>
                        <th >연락처</th>
                        <th>이메일</th>
                        <th>생년월일</th>
                        <th>주소</th>
                      </tr>
                    </thead>

                    <tbody>
                      <%for(Customer c : list){ %>
	                      <tr>
	                        <td><input type="checkbox"></td>
	                        <td><%=c.getUserNo() %></td>
	                        <td><%=c.getUserName() %></td>
	                        <td><%=c.getUserEngName() %></td>
	                        <td><%=c.getPhone() %></td>
	                        <td><%=c.getEmail() %></td>
	                        <td><%=c.getBirthDate() %></td>
	                        <td><%=c.getAddress() + c.getAddressDetail() %></td>
	                      </tr>
					  <%} %>
                    </tbody>
                </table>

                <div align="center" style="margin-bottom: 20px;">
                    <input type="text" class="formCustume">
                    <select class="formCustume" name="searchOption" style="margin-right: 20px;">
                        <option value="name">회원번호</option>
                        <option selected>회원이름</option>
                        <option>회원ID</option>
                        <option>연락처</option>
                        <option >이메일</option>
                        <option>생년월일</option>
                        <option>주소</option>
                    </select>
                    <a href="" class="btn btn-secondary" id="buttonColor" >수정하기</a>
                    <button  class="btn btn-secondary" id="buttonColor" data-toggle="modal" data-target="#userDelete">삭제하기</button>
                </div>

                <ul class="pagination center">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                  </ul>

            </div>

            <!--삭제하기 모달-->
            <!-- The Modal -->
            <div class="modal" id="userDelete">
                <div class="modal-dialog modal-sm">
                <div class="modal-content">
            
                    <!-- Modal body -->
                    <div class="modal-body center">
                    <p>해당 계정을 삭제하시겠습니까?</p>
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer center">
                        <a href="" class="btn btn-secondary" style="width: 80px;">Ok</a>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
            
                </div>
                </div>
            </div>


        </section>

         <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>