<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.customerService.model.vo.Inq"%>
<%@ page import="java.util.List"%>
<%@ page import="com.galgoda.common.model.vo.Attachment"%>
<%
	Inq inq = (Inq)request.getAttribute("inq");
	List<Attachment> list = (List<Attachment>)request.getAttribute("list");
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
	
	#img_content {
		width: 500px;
		height: 300px;
		margin: auto;
	}
	
	.carousel-item img {
		width: 500px;
		height: 300px;
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
                        <a class="nav-link" style="color: white;" href="<%= contextPath %>/list.inq?page=1">문의사항 관리</a>
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
					<table class="table">
						<tr>
							<th style="width: 100px;">구분</th>
							<td><%= inq.getCategory() %></td>
							<th style="width: 100px;">문의유형</th>
							<td><%= inq.getInqType() %></td>
						</tr>
						<tr>
							<th>제목</th>
							<td colspan="3"><%= inq.getInqTitle() %></td>
						</tr>
						<tr>
							<td colspan="4">
								<textarea style="width: 100%; height: 300px; resize: none; overflow-y: auto;" readonly><%= inq.getInqContent() %></textarea>
							</td>
						</tr>
						<tr>
							<th style="vertical-align: middle;">첨부파일</th>
							<td colspan="2" style="vertical-align: middle;">
								<div id="img_content" class="carousel slide" data-ride="carousel">
									<!-- Indicators -->
									<ul class="carousel-indicators">
										<% for(int i=0; i<list.size(); i++){ %>
										<li data-target="#bbb" data-slide-to="<%=i%>" class="<%= i==0 ? "active" : "" %>"></li>
										<% } %>
									</ul>
									<!-- The slideshow -->
									<div class="carousel-inner ">
										<% for(int i=0; i<list.size(); i++){ %>
										<div class="carousel-item <%= i==0 ? "active" : "" %>">
											<img src="<%= list.get(i).getFilePath() %>">
										</div>
										<% } %>
									</div>
									<!-- Left and right controls -->
									<a class="carousel-control-prev" href="#bbb" data-slide="prev">
										<span class="carousel-control-prev-icon"></span>
									</a> 
									<a class="carousel-control-next" href="#bbb" data-slide="next">
										<span class="carousel-control-next-icon"></span>
									</a>
								</div>
							</td>
							<td></td>
						</tr>
						<tr>
							<td colspan="4">
								<h3 style="color: rgb(115, 90, 75);">답변</h3>
							</td>
						</tr>
						<tr>
							<td colspan="4">
								<% if(inq.getAnsContent() != null){ %> 
								<textarea style="width: 100%; height: 500px; resize: none; overflow-y: auto;" readonly><%= inq.getAnsContent() %></textarea>
								<% }else{ %> 
								<textarea style="width: 100%; height: 500px; resize: none;" readonly></textarea>
								<% } %>
							</td>
						</tr>
					</table>
				</div>
			</div>
        </section>
        <!-- section end -->

       	<%@ include file="/views/common/footer.jsp" %>
       
    </div>
</body>
</html>