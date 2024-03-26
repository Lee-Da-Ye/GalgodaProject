<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.galgoda.common.model.vo.PageInfo" %>    
<%@ page import="com.galgoda.customer.model.vo.Reservation" %>    
<%@ page import="java.util.List" %>  
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Reservation> list = (List<Reservation>)request.getAttribute("list");
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 /* 메인컨텐츠  */
        #title1 {font-size: 30px; font-weight: bold;  color: rgb(115, 90, 75);}
        #title2 {font-size: 25px; font-weight: bold;  color: rgb(115, 90, 75);}
        #title3 {font-size: 20px; font-weight: bold; }
        .top_status > a{margin: 13px; color:#B2AEAE ; font-weight: bold; font-size: 18px;}
        .top_menu {display: flex; justify-content: space-between;}
        
    

        


</style>
</head>
<body>
 <div class="wrap">
        
        <%@ include file="/views/common/header.jsp"%>


        <section class="main_content">
            
            <!-- 사이드 메뉴바 영역 -->
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link "  href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="<%= contextPath %>/hotelinsertForm.ho">호텔등록</a></div> </li> 
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="<%= contextPath %>/hotelupdateForm.ho">호텔 정보 수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="<%= contextPath%>/roominsertForm.ho">객실등록</a></div> </li>  
                    <li> <div id="demo"  class="collapse " style="margin-left: 30px;"><a href="<%= contextPath %>/roomUpdateForm.ho">객실수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="<%= contextPath %>/revList.ho?page=1">리뷰 관리</a></div> </li>   
                    
                    
                    <li>
                        <a class="nav-link" style="color: white; background-color: rgb(115, 90, 75);" href="<%= contextPath %>/resList.ho?page=1"  >예약관리</a>
                    </li>
                  
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">담당자 정보 수정</a>
                    </li>
                        
                    
                    <li>
                         <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="">공지사항</a></div> </li>   
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="">문의사항</a></div> </li>   
                </ul>
            </div>

           
            <!-- 사이드 메뉴바 영역  끝-->

            <!-- 메인 부분 -->
            <div class="page_content" style="margin-bottom: 150px;">

                <span id="title1">호텔관리</span> <span id="title2"> - 예약관리</span>
                <div style="border : 1px solid lightgray; margin-bottom: 16px;"></div>
                
                <div class="hotel_content" style="padding-left: 20px;">
                    <span id="title3">예약 현황 조회</span><br><br>
                   
                   <form>
	                    <div class="top_menu">
	                        <div class="top_status">
	                            <a href="<%= contextPath %>/resCategoryList.ho?page=1&category=대기"  >대기</a> |  <a href="<%= contextPath %>/resCategoryList.ho?page=1&category=확정">확정</a> |  <a href="<%= contextPath %>/resCategoryList.ho?page=1&category=취소">취소</a> 
	                        </div>
	                        <div class="float-right top_array">
		                        
		                            <select class="form-control" name="filter">
		                                <option value="arrayDate" selected>예약날짜순</option>
		                                <option value="arrayRes">예약번호순</option>
		                            </select>
		                        
	                        </div>
	                    </div>
                    </form>

                    <table class="table table-hover" id="res_list" style="margin-top: 12px;">
                        <thead>
                        <tr class="table-active" align="center">
                            <th>상태</th>
                            <th>예약자</th>
                            <th>예약번호</th>
                            <th>연락처</th>
                            <th>이용기간</th>
                            <th>상세조회</th>
                        </tr>
                        </thead>
                        <tbody>
                        
                        <% for(Reservation r : list){ %>
                        <tr align="center">
                            <td><%= r.getResStatus() %></td>
                            <td><%= r.getResName() %></td>
                            <td><%= r.getResNo() %></td>
                            <td><%= r.getResPhone() %></td>
                            <td><%= r.getDateIn() %> - <%= r.getDateOut() %></td>
                            <td><a href="<%= contextPath%>/resDetail.ho?no=<%= r.getResNo()%>">상세조회</a></td>
                        </tr>
                         <% } %>
                         
                        </tbody>
                    </table>


	 
                
                   
                   
                    <table class="float-right" style="margin-top: 100px; margin-right: 20px;">
                        <tr >
                            
                            <td > 
                            <div style="margin-left: 7px;">
                               <!--  페이징바 영역 -->
					                <ul class="pagination justify-content-center">
					
										<% if(!list.isEmpty()) {%>
										<% if(pi.getCurrentPage() == 1) { %>
					                    <li class="page-item disabled"><a class="page-link" href="#"> &lt; </a></li>
					                 	<% } else { %>
					                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/resList.ho?page=<%=pi.getCurrentPage()-1%>&category=<%= request.getParameter("cateogry") %>"> &lt; </a></li>
					                    <% } %>
					                    
					                    
					                    <% for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
						                    
						                    <% if(p == pi.getCurrentPage()){ %>
						                    <li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
						                    <% } else{ %>
						                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/resList.ho?page=<%= p %>&category=<%= request.getParameter("cateogry") %>"> <%= p %></a></li>
						                    <% }  %>
					                    <% } %>
					                    
					                    <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
					                    <li class="page-item disabled"><a class="page-link" href="#"> &gt; </a></li>
					                    <% } else { %>
					                    <li class="page-item"><a class="page-link" href="<%= contextPath%>/resList.ho?page=<%=pi.getCurrentPage() + 1 %>&category=<%= request.getParameter("cateogry") %>"> &gt; </a></li>
					                    <% } %>
					                    <% } %>
					                </ul>
                           </div>

                            </td>
                        </tr>
                    </table>
                  


                </div>
            </div>
        
            <!-- 메인 부분  끝 -->


        

        </section>
        
        
	 <%@ include file="/views/common/footer.jsp"%>
        
    </div>   



</body>
</html>