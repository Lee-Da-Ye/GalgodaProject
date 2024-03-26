<%@page import="com.galgoda.common.model.vo.PageInfo"%>
<%@page import="com.galgoda.member.model.vo.Customer"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Customer> list = (List<Customer>)request.getAttribute("list"); %>    
<% PageInfo pi = (PageInfo)request.getAttribute("pi"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>사용자관리</title>
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
                        <a class="nav-link" style="background-color: rgb(115, 90, 75); color: white;"  href="<%=contextPath%>/userList.su" >계정정보 조회</a>
                    </li>
                        
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">사용자 계정 조회</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>

                <table class="table table-hover" id="userList">
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

                    <tbody id="list">
                      <%for(Customer c : list){ %>
	                      <tr class="check">
	                        <td><input type="radio" name="target"></td>
	                        <td><%=c.getUserNo() %></td>
	                        <td><%=c.getUserName() %></td>
	                        <td><%=c.getUserId() %></td>
	                        <td><%=c.getPhone() %></td>
	                        <td><%=c.getEmail() %></td>
	                        <td><%=c.getBirthDate() %></td>
	                        <td><%=c.getAddress() + c.getAddressDetail() %></td>
	                      </tr>
					  <%} %>
                    </tbody>
                </table>

                <div align="center" style="margin-bottom: 20px;">
                    <input type="text" id="searchValue" class="formCustume">
                    <select class="formCustume" name="searchOption" style="margin-right: 20px;">
                        <option value="1" selected>회원이름</option>
                        <option value="2" >회원ID</option>
                        
                    </select>
                    <button  class="btn btn-secondary" id="buttonColor" onclick="modifyButton();" >수정하기</button>
                    <button  class="btn btn-secondary" id="buttonColor" data-toggle="modal" data-target="#userDelete">삭제하기</button>
                </div>

                <ul class="pagination justify-content-center" id="pageBar" >
                	<%if(pi.getCurrentPage()==1){ %>
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/userList.su?page=<%=pi.getCurrentPage()-1%>">Previous</a></li>
                    <%} %>
                    <%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                    	<%if(p==pi.getCurrentPage()){ %>
	                    <li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
	                    <%}else{ %>
	                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/userList.su?page=<%=p%>"><%=p %></a></li>
	                    <%} %>
                    <%} %>
					<%if(pi.getCurrentPage()==pi.getMaxPage()){ %>                    
                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/userList.su?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
                    <%} %>
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
                        <button class="btn btn-secondary" style="width: 80px;" onclick="deleteButton();">Ok</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
            
                </div>
                </div>
            </div>

			<script>
				
				$(document).on('click', '#list>tr', function() {
	                var checkbox = $(this).find('input[type="radio"]');
	                if (checkbox.prop("checked")) {
	                    checkbox.prop("checked", false);
	                } else {
	                    checkbox.prop("checked", true);
	                }
	            });
				
				$(document).on('click','#searchPage',function(){
	            	var pageNo = $(this).text();
	            	search(pageNo);
	            	return false;
	            })
	            
	            $(document).on('click','#searchPage2',function(){
	            	var pageNo = $(this).data('page');
	            	search(pageNo);
	            	return false;
	            })
	            
	            function search(pageNo){
        		        var selectedType = $("select[name='searchOption']").val();
        		        var searchValue = $("#searchValue").val();
        		        
        		        $.ajax({
        		            url: "<%=contextPath%>/searchUser.su",
        		            data:{type:selectedType, value:searchValue, page:pageNo},
        		            success:function(result){
        		                let value="";
        		              	//유저정보
        		                for(let i=0; i<result.list.length; i++){
        		                    value +="<tr>" 
        		                            + "<td><input type='radio' name='target'></td>"
        		                            + "<td> " + result.list[i].userNo + "</td>"
        		                            + "<td> " + result.list[i].userName + "</td>"
        		                            + "<td> " + result.list[i].userId + "</td>"
        		                            + "<td> " + result.list[i].phone + "</td>" 
        		                            + "<td> " + result.list[i].email + "</td>" 
        		                            + "<td> " + result.list[i].birthDate + "</td>" 
        		                            + "<td> " + result.list[i].address + result.list[i].addressDetail  + "</td>" 
        		                            + "<tr>";
        		                }
        		                
        		                $("#userList tbody").html(value);
        		                
        		                var paginationHtml = "";
							    if(result.pi.currentPage==1) {
							        paginationHtml += "<li class='page-item disabled'><a class='page-link' href='#'>Previous</a></li>";
							    } else {
							        paginationHtml += "<li class='page-item'><a class='page-link' href='#' id='searchPage2' data-page='" + (result.pi.currentPage-1) + "'>Previous</a></li>";
							        
							        
							    }
							    
							    for(var p=result.pi.startPage; p<=result.pi.endPage; p++) {
							        if(p==result.pi.currentPage) {
							            paginationHtml += "<li class='page-item active'><a class='page-link' href='#'>" + p + "</a></li>";
							        } else {
							            paginationHtml += "<li class='page-item'><a class='page-link' id='searchPage' href='#' >" + p + "</a></li>";
							        }
							    }
							    
							    
							    if(result.pi.currentPage==result.pi.maxPage) {
							        paginationHtml += "<li class='page-item disabled'><a class='page-link' href='#'>Next</a></li>";
							    } else {
							        paginationHtml += "<li class='page-item'><a class='page-link' href='#' id='searchPage2' date-page='" + (result.pi.currentPage+1) + "'>Next</a></li>";
							    }
							    
							    $("#pageBar").html(paginationHtml);
        		                
        		                
        		                
        		            },
        		            error : function(){ // 오타 수정
        		                console.log("ajax통신실패");
        		            }
        		        });
        		    }
            	
            	
            	$(document).ready(function() {
				       $("#searchValue").keydown(function() {
				           if (event.keyCode === 13){ 
				           		search(1);
				           }
				       });
				       
				   })
	            
	            
	            
				
            	function modifyButton(){
			    	var userNo = $('input[type="radio"]:checked').closest('tr').find('td:eq(1)').text();
			        location.href = "<%=contextPath%>/detailUser.su?no=" + userNo;

            	}	
			    
			    function deleteButton(){
			    	userNo = $('input[type="radio"]:checked').closest('tr').children().eq(1).text();
			    	location.href = "<%=contextPath%>/deleteUser.su?no=" + userNo;
			    }
			</script>
        </section>

         <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>