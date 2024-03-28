<%@page import="java.util.List"%>
<%@page import="com.galgoda.common.model.vo.PageInfo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	PageInfo pi = (PageInfo)request.getAttribute("pi"); 
	List<HotelUser> list = (List<HotelUser>)request.getAttribute("list");
%>   


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔코드 관리</title>
<style>
.contentName{
    color: rgb(115, 90, 75);
}
.page_content table>tbody>tr{cursor: pointer;}

#buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}

.formCustume{
    color: #495057;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    height: calc(1.3em + 0.75rem + 2px);
}

.selectCodeDiv{
    border: 1px solid rgb(115, 90, 75); 
    border-radius: 10px;
    width: 400px; height: 300px; 
    padding-top: 30px;
}
</style>
</head>
<body>
	<div class="wrap">
        <%@include file="/views/common/adminHeader.jsp" %>
		<% if(loginAdmin==null){ %>
		 	 <script>
		        location.href = "<%=contextPath %>";
		    </script>
		<%} %>

        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">호텔관리</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/hotelList.su?page=1" >호텔등록 현황</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/codeList.su?page=1" style="background-color: rgb(115, 90, 75); color: white;" >호텔코드 등록</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/tag.su" >태그 관리</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/option.su" >추가옵션 관리</a>
                    </li>
                        
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">호텔코드 등록</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>

                <table class="table table-hover">
                    <thead>
                      <tr class="table-secondary">
                        <th width="100">호텔 계정번호</th>
                        <th width="200">담당자</th>                        
                        <th width="300">호텔이름</th>
                        <th width="100">호텔 인증번호</th>
                      </tr>
                    </thead>

                    <tbody id="list">
                    	<%for(HotelUser h : list){ %>
	                      <tr>
	                        <td><%=h.getMemNo() %></td>
	                        <td><%=h.getMemName() %></td>
	                        <td><%=h.getHotelName() %></td>
	                        <td><%=h.getAuthentiCode() %></td>
	                      </tr>
                      	<%} %>
                    </tbody>
                </table>
                <div align="right">
                  <a href="" class="btn btn-secondary" id="buttonColor" data-toggle="modal" data-target="#addHotelCode" style="margin-top: 10px;">등록하기</a>
                </div>

                <ul class="pagination justify-content-center" >
                	<%if(pi.getCurrentPage()==1){ %>
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/codeList.su?page=<%=pi.getCurrentPage()-1%>">Previous</a></li>
                    <%} %>
                    <%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                    	<%if(p==pi.getCurrentPage()){ %>
	                    <li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
	                    <%}else{ %>
	                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/codeList.su?page=<%=p%>"><%=p %></a></li>
	                    <%} %>
                    <%} %>
					<%if(pi.getCurrentPage()==pi.getMaxPage()){ %>                    
                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/codeList.su?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
                    <%} %>
                 </ul>

            </div>

            <!--추가하기 모달-->
            <!-- The Modal -->
            <div class="modal" id="addHotelCode">
                <div class="modal-dialog" style="width: 350px;">
                <div class="modal-content">
            		<form action="<%=contextPath %>/insertCode.su" method="post">
	            		
	                    <!-- Modal body -->
	                    <div class="modal-body ">
	                            <span class="btn btn-sm" style="background-color: rgb(235, 231, 227);">호텔이름</span>
	                            <input type="text" name="hotelName" required class="form-control">
	                            <span class="btn btn-sm" style="background-color: rgb(235, 231, 227); margin-top: 5px;">호텔코드</span>
	                            <input type="text" name="hotelCode" required class="form-control" pattern="[0-9]{8}" title="8자리 숫자를 입력하세요">
	                    </div>
	            
	                    <!-- Modal footer -->
	                    <div class="modal-footer center">
	                    <button type=submit class="btn btn-secondary" style="width: 80px;">Ok</button>
	                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	                    </div>
            		</form>
                </div>
                </div>
            </div>
	
			<script>
				$(function(){
				    $("#list>tr").click(function(){
				        var memNo = $(this).children().eq(0).text();
				        location.href = "<%=contextPath%>/detailCode.su?no=" + memNo;
				    });
				});
				
				
				
				
			</script>
        </section>

         <%@include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>