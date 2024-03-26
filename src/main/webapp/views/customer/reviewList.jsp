<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.galgoda.customer.model.vo.CustomerReview" %>

<%
	List<CustomerReview> list = (List<CustomerReview>)request.getAttribute("list");
	//List<Review1> rev_title = (List<Review1>)request.getAttribute("list");
%><!-- getAttribute로 뽑으면 object 타입이라 강제로 다운캐스팅 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
		/*왼쪽 메뉴바 */
        .sideMenubar{
            width: 300px;
            background-color: rgb(235, 231, 227);
        }
        .sideMenubar a {
            color: inherit;
            text-decoration: none;
        }

        .page_content {

            width: 100%; 
            padding-top: 30px;
            padding-left: 30px;
            padding-right: 30px;
            /* border: 1px solid red; */

        }

        /* 리뷰 등록/수정/삭제 버튼 스타일 */
        .rev_button{
			background-color: #ebe7e3 !important;
			border: none;
			color: black;
			padding: 10px 20px;
			border-radius: 5px;
			}	
		#rev_status_button{
			background-color: rgb(191, 180, 176);
			color: white;
			border:none;
		}
        
</style>
</head>
<body>

	<div class="wrap">
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li class="reservation_btn">
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/resManagement.cu?page=1" data-target="#demo"  >예약관리</a>
   					</li>
                        
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/wishlist.cu" data-target="#demo2">위시리스트</a>
                    </li>
                    
                     <li>
                        <a class="nav-link" href="<%=contextPath%>/reviewlist.cu" data-target="#demo2" style="background-color: #634c46; color: white;">리뷰관리</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath%>/personalInfo.cu" data-target="#demo3">개인정보 수정</a>
                    </li>
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                
                <div class="mypage">
            
                    <div class="res_header">
                        <h2>리뷰관리</h2>
                        <div style="border: 2px solid lightgray;"></div>
                    </div>

                    <br>
                    
                    <div class="dropdown">
					  <button id="rev_status_button" type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown">
					    작성 구분
					  </button>
					  <div class="dropdown-menu">
					    <a class="dropdown-item" href="#">작성 전</a>
					    <a class="dropdown-item" href="#">작성 완료</a>
					  </div>
					</div>
					
					<br>
                 
					<% if (list.isEmpty()){ %>
					<!-- 예약내역이 없어서 쓴/쓸 리뷰 없는 경우 -->
					<tr>
						<td style="text-align: center;">예약 내역이 없습니다.</td>
					</tr>
					<% }else{ %>
					<!-- 리뷰를 쓴/쓸 예약건이 있는 경우 -->
						<% for(CustomerReview r : list){ %>
	                    <div class="rev_content1" style="display: flex;">
	                     
	                        <div>
	                        	<% if(r.getRevTitle() == null){ %>
	                        	<!-- -------------------------------------------- -->
	                            <h5>작성 전</h5>
	                            <% }else{ %>
	                            <h5>작성 완료</h5>
	                            <% } %>
	                            <!-- -------------------------------------------- -->
	                            <h6><%= r.getHotelName() %></h6>
	                            <div class="rev_content1_box" style="border: 1px solid lightgray; width: 600px; height: 200px; display: flex;">
	                                <div><img src="<%= request.getContextPath()%>/<%=r.getImg_path()%>" style="width: 200px; height: 200px; padding:10px"></div>
	                                <div>
	                                    <br>
	                                    <h6><%= r.getDate_in() %> - <%= r.getDate_out() %></h6>
	                                    <h6>총 <%= r.getRes_people() %>명</h6>
	                                     
	                                </div>
	                            </div>
	                        </div>
	                        
	                        <!-- -------------------------------------------- -->
	                        
	                        <% if(r.getRevTitle() == null){ %>
	                        <div class="rev_content1_menu" style="display: flex; flex-direction: column; padding-top: 60px; padding-left: 10px;">
	                            <a href="<%= contextPath %>/enrollForm.cu?resNo=<%= r.getResNo() %>&hotelNo=<%= r.getHotelNo() %>&res_people=<%= r.getRes_people() %>&revNo=<%= r.getRevNo() %>" class="btn rev_button">리뷰 등록</a>
	                        	<input type="hidden" name="res_people" value="<%= r.getRes_people() %>">
	                        </div>
	                        <% }else{ %>
	                        <div class="rev_content1_menu" style="display: flex; flex-direction: column; padding-top: 60px; padding-left: 10px;">
	                            <button href="" class="btn rev_button" style="margin-bottom: 10px;" onclick="updateForm(<%= r.getRevNo() %>);">리뷰 수정</button>
	                            <a href="<%= contextPath %>/deleteReview.cu?revNo=<%= r.getRevNo() %>" class="btn rev_button" style="margin-bottom: 10px;" onclick="return confirm('정말로 삭제하시겠습니까?);">리뷰 삭제</a>
	                        </div>
	                        <input type="hidden" name="revNo" value="<%= r.getRevNo() %>">
	                        
	                        
	                        <% } %>
	                        <!-- -------------------------------------------- -->
	                        <script>
	                        	function updateForm(revNo){
	                        		location.href="<%=contextPath%>/reviewUpdateForm.cu?no=<%= r.getRevNo() %>";
	                        	}
	                        	
	                        	$(document).ready(function(){
	                        		  // 작성 구분을 클릭했을 때 
	                        		  $('.dropdown-item').click(function(){
	                        		    var status = $(this).text(); 
	                        		    $('.rev_content1').hide(); // 모든 리뷰 숨기기
	                        		    $('.rev_content1:contains("' + status + '")').show(); // 선택한 상태에 해당하는 리뷰만 보이기
	                        		  });
	                        	});
	                        	
	                        </script>
	                        
	                        
	                    </div>
	                    <br>
						<% } %>
					
					
					<% } %>
                    <br><br>
                  

                </div>

            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div> 

</body>
</html>