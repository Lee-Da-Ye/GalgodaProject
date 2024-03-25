<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.common.model.vo.PageInfo"%>
<%@ page import="java.util.List"%>
<%@ page import="com.galgoda.customerService.model.vo.Inq"%>
<%@ page import="com.galgoda.hotel.model.vo.Hotel"%>
<%
	List<Inq> list1 = (List<Inq>)request.getAttribute("list1");
	List<Hotel> list2 = (List<Hotel>)request.getAttribute("list2");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .sideMenubar_head {
        width: 80%;
        margin-left: 10px;
        margin-right: 50px;
        margin-top: 10px;
        border-bottom: 1px solid gray;
	}
</style>
</head>
<body>
	<div class="wrap">
        
        <%@ include file="/views/common/adminHeader.jsp" %>

        <!-- section start -->
        <section class="main_content">
			<div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터 관리</h3>
                    </li>

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/list.no?page=1">공지사항 관리</a>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="<%= contextPath %>.list.inq?page=1">문의사항 관리</a>
                    </li>

                    <li>
                        <a class="nav-link" data-toggle="collapse" data-target="#aaa">신고 관리</a>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/userList.rep?page=1">신고 계정 관리</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/reviewList.rep?page=1">신고 리뷰 관리</a>
                        </div>
                    </li>
                </ul>
            </div>

            <div class="page_content">
                <h2 class="contentName">1:1 문의내역</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>
                <div style="margin-top: 20px;">
                    <select name="category" id="hotelCategory">
                    	<option value="전체">전체</option>
                    	<% for(int i=0; i<list2.size(); i++){ %>
                        <option value="<%= list2.get(i).getHotelName() %>"><%= list2.get(i).getHotelName() %></option>
                        <% } %>
                    </select>
                </div>
                <div style="margin-top: 20px;">
                    <table class="table">
                    	<thead>
	                        <tr align="center" class="table-active">
	                            <th style="width: 15%;">구분</th>
	                            <th style="width: 10%;">작성자</th>
	                            <th style="width: 10%;">문의유형</th>
	                            <th style="width: 45%;">제목</th>
	                            <th>작성일</th>
	                        </tr>
                        </thead>
                        <tbody>
                        	<% for(Inq inq : list1){ %>
	                        	<tr align="center">
	                        		<td><%= inq.getCategory() %></td>
	                        		<td><%= inq.getInqWriter() %></td>
	                        		<td><%= inq.getInqType() %></td>
	                        		<td>
	                        			<a href="<%= contextPath %>/detail.inq?no=<%= inq.getInqNo() %>"><%= inq.getInqTitle() %></a>
                        			</td>
	                        		<td><%= inq.getRegistDate() %></td>
	                        	</tr>
                        	<% } %>
                        </tbody>
                    </table>
                    <ul class="pagination" style="margin-top: 50px; width: 95%; justify-content: center;">
	                    
	                    <% if(pi.getCurrentPage() == 1){ %>
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">&lt;</a>
                   		</li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.inq?page=<%= pi.getCurrentPage() - 1 %>">&lt;</a>
                    	</li>
	                 	<% } %>
	                 	<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>   
	                    	<% if(p == pi.getCurrentPage()){ %>
		                    <li class="page-item active">
		                    	<a class="page-link" href="#"><%= p %></a>
	                    	</li>
		                    <% }else { %>
		                    <li class="page-item">
		                    	<a class="page-link" href="<%= contextPath %>/list.inq?page=<%= p %>"><%= p %></a>
	                    	</li>
	                 		<% } %>
	                 	<% } %>
	                    
	                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
	                    <li class="page-item disabled">
	                    	<a class="page-link" href="#">&gt;</a>
                   		</li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.inq?page=<%= pi.getCurrentPage() + 1 %>">&gt;</a>
                    	</li>
	                	<% } %>
	                </ul>
                </div>
            </div>
            <script>
				$(function() {
					$("#hotelCategory").change(function() {
						var category = $(this).val();
			            var contextPath = '<%= contextPath %>';
			            var newURL = contextPath + '/adminList.inq?page=1&category=' + category;
			            window.location.href = newURL;
					})
				})
			</script>
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>