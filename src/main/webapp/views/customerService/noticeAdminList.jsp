<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.customerService.model.vo.Notice" %>
<%@ page import="java.util.List" %>
<%@ page import="com.galgoda.common.model.vo.PageInfo" %>
<%
	List<Notice> list = (List<Notice>)request.getAttribute("li");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.center_table {
		width: 80%;
		margin: auto;
		margin-top: 50px;
		text-align: center;
		font-size: 18px;
	}
	
	table th {
		background-color: rgb(235, 231, 227);
	}
	
	table a {
		color: black;
		text-decoration: none;
	}
	
	table a:hover {
		color: black;
		text-decoration: none;
	}
	
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

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="<%=contextPath %>/list.no?page=1">공지사항 관리</a>
                    </li>

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/list.inq?page=1">문의사항 관리</a>
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
                <h2 class="contentName">공지사항</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>

                <table class="table-bordered center_table" style="width: 95%;">
                    <thead class="thead-light">
                        <tr>
                            <th style="width: 10%;">글 번호</th>
                            <th style="width: 70%;">제목</th>
                            <th style="width: 20%;">작성일</th>
                        </tr>
                    </thead>
                    <tbody>
                    	<% for(Notice n : list){ %>
                        <tr>
                            <td><%= n.getNoticeNo() %></td>
                            <td>
                            	<a href="<%= contextPath %>/detail.no?no=<%= n.getNoticeNo() %>"><%= n.getNoticeTitle() %></a>
                           	</td>
                            <td><%= n.getRegistDate() %></td>
                        </tr>
                        <% } %>
                    </tbody>
                </table>
                
                <div align="right" style="width: 97%; margin-top: 10px;">
                    <a href="<%= contextPath %>/enrollForm.no" class="btn" style="background-color: rgb(115, 90, 75); color: white;">글쓰기</a>
                </div>
                
                <ul class="pagination" style="margin-top: 50px; width: 95%; justify-content: center;">
                    <% if(pi.getCurrentPage() == 1){ %>
                    <li class="page-item disabled">
                    	<a class="page-link" href="#">&lt;</a>
                   	</li>
                    <% }else { %>
                    <li class="page-item">
                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= pi.getCurrentPage() - 1 %>">&lt;</a>
                   	</li>
                 	<% } %>
                 	<% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>   
                    	<% if(p == pi.getCurrentPage()){ %>
	                    <li class="page-item active">
	                    	<a class="page-link" href="#"><%= p %></a>
                    	</li>
	                    <% }else { %>
	                    <li class="page-item">
	                    	<a class="page-link" href="<%= contextPath %>/list.no?page=<%= p %>"><%= p %></a>
                    	</li>
                 		<% } %>
                 	<% } %>
                    
                    <% if(pi.getCurrentPage() == pi.getMaxPage()){ %>
                    <li class="page-item disabled">
                    	<a class="page-link" href="#">&gt;</a>
                   	</li>
                    <% }else { %>
                    <li class="page-item">
                   		<a class="page-link" href="<%= contextPath %>/list.no?page=<%= pi.getCurrentPage() + 1 %>">&gt;</a>
                  	</li>
                	<% } %>
                </ul>
            </div>
        </section>
        <!-- section end -->

        <%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>