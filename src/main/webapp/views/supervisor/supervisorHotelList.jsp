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
<title>호텔등록 현황</title>
<style>
.contentName{
    color: rgb(115, 90, 75);
}
.page_content table>tbody>tr{cursor: pointer;}

#buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}
.btn-secondary:hover{
    background-color: rgb(115, 90, 75); 
    color: lightgray;
}

.formCustume{
    color: #495057;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    height: calc(1.3em + 0.75rem + 2px);
}
#hotelList{
	white-space: nowrap;
}
</style>
</head>
<body>
	<div class="wrap">
        <%@ include file = "/views/common/adminHeader.jsp" %>
		
		

        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">메뉴명</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/hotelList.su?page=1" style="background-color: rgb(115, 90, 75); color: white;" >호텔등록 현황</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/codeList.su?page=1" >호텔코드 등록</a>
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
                <h2 class="contentName">호텔등록 현황 조회</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>

                <table class="table table-hover" id="hotelList">
                    <thead>
                      <tr class="table-secondary">
                        <th>선택</th>
                        <th>호텔번호</th>
                        <th>호텔이름</th>
                        <th>담당자</th>
                        <th>담당자ID</th>
                        <th>담당자연락처</th>
                        <th>이메일</th>
                        <th>호텔주소</th>
                      </tr>
                    </thead>

                    <tbody id="list">
                     <%for(HotelUser u : list){ %>
	                      <tr>
	                        <td><input type="radio" name="target"></td>
	                        <td><%=u.getHotelNo() %></td>
	                        <td><%=u.getHotelName() %></td>
	                        <td><%=u.getMemName() %></td>
	                        <td><%=u.getMemId() %></td>
	                        <td><%=u.getMemPhone() %></td>
	                        <td><%=u.getMemEmail() %></td>
	                        <td><%=u.getHotelAddress() %></td>
	                      </tr>
					  <%} %>
                      
                      
                    </tbody>
                </table>

                <div align="center" style="margin-bottom: 20px;">
                    <input type="text" id="searchValue" class="formCustume" >
                    <select name="searchOption" style="margin-right: 20px;" class="formCustume">
                        <option value="1" selected>호텔이름</option>
                        <option value="2">담당자</option>
                    </select>
                    <button class="btn btn-secondary" id="buttonColor" onclick="modifyButton();" >수정하기</button>
                    <button  class="btn btn-secondary" id="buttonColor" data-toggle="modal" data-target="#userDelete" >삭제하기</button>
                </div>

                <ul class="pagination justify-content-center" >
                	<%if(pi.getCurrentPage()==1){ %>
                    <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                    <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/hotelList.su?page=<%=pi.getCurrentPage()-1%>">Previous</a></li>
                    <%} %>
                    <%for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
                    	<%if(p==pi.getCurrentPage()){ %>
	                    <li class="page-item active"><a class="page-link" href="#"><%=p %></a></li>
	                    <%}else{ %>
	                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/hotelList.su?page=<%=p%>"><%=p %></a></li>
	                    <%} %>
                    <%} %>
					<%if(pi.getCurrentPage()==pi.getMaxPage()){ %>                    
                    <li class="page-item disabled"><a class="page-link" href="#">Next</a></li>
                    <%}else{ %>
                    <li class="page-item"><a class="page-link" href="<%=contextPath%>/hotelList.su?page=<%=pi.getCurrentPage()+1%>">Next</a></li>
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
                    <p>해당 호텔정보를 삭제하시겠습니까?</p>
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer center">
                        <button onclick="deleteButton();" class="btn btn-secondary" style="width: 80px;">Ok</button>
                        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
            
                </div>
                </div>
            </div>
            
            <script>
				
			    $(function(){
            		$("#list>tr").click(function(){
            			 var checkbox = $(this).find('input[type="radio"]');
            			    if (checkbox.prop("checked")) {
            			        checkbox.prop("checked", false);
            			    } else {
            			        checkbox.prop("checked", true);
            			    }
            		})
            		
            		
            		
            	})
            	
            	function search(){
        		        var selectedType = $("select[name='searchOption']").val();
        		        var searchValue = $("#searchValue").val();
        		        
        		        $.ajax({
        		            url: "<%=contextPath%>/searchHo.su",
        		            data:{type:selectedType, value:searchValue, page:1},
        		            success:function(result){
        		                console.log(result);
        		              //조회된 공지사항 게시글 수만큼 tr요소를 만들어서
        		                // 위의 table#output4 안의 tbody 영역에 뿌려주기
        		                let value="";
        		              	
        		                for(let i=0; i<result.length; i++){
        		                    value +="<tr>" 
        		                            + "<td><input type='radio' name='target'></td>"
        		                            + "<td> " + result[i].memNo + "</td>"
        		                            + "<td> " + result[i].hotelName + "</td>"
        		                            + "<td> " + result[i].memName + "</td>"
        		                            + "<td> " + result[i].memId + "</td>" 
        		                            + "<td> " + result[i].memPhone + "</td>" 
        		                            + "<td> " + result[i].memEmail + "</td>" 
        		                            + "<td> " + result[i].hotelAddress + "</td>" 
        		                            + "<tr>";
        		                }
        		                $("#hotelList tbody").html(value);
        		                
        		                
        		                
        		            },
        		            error : function(){ // 오타 수정
        		                console.log("ajax통신실패");
        		            }
        		        });
        		    }
            	
            	
            	$(document).ready(function() {
				       $("#searchValue").keydown(function() {
				           if (event.keyCode === 13){ 
				           		search();
				           }
				       });
				       
				   })
				
            			
            	
            	function modifyButton(){
			    	var hotelNo = $('input[type="radio"]:checked').closest('tr').find('td:eq(1)').text();
			    	location.href = "<%=contextPath%>/hotelDetail.su?no=" + hotelNo;
            	}	
			    
			    function deleteButton(){
			    	hotelNo = $('input[type="radio"]:checked').closest('tr').children().eq(1).text();
			    	location.href = "<%=contextPath%>/deleteHotel.su?no=" + hotelNo;
			    }
			    
			    
			        
			</script>
            
            
            
        </section>

        <%@ include file = "/views/common/footer.jsp" %>
    </div>   	
</body>
</html>