<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.customerService.model.vo.Notice" %>
<%
	Notice n = (Notice)request.getAttribute("n");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	/* 공지사항수정페이지 스타일 */
	.space {
		padding: 10px;
	}
	
	.page_content table {
		margin-top: 30px;
		width: 90%;
	}
	
	.page_content th {
		background-color: rgb(235, 231, 227);
		width: 100px;
		text-align: center;
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
                        <a class="nav-link" style="color: white;" href="<%= contextPath %>/list.no?page=1">공지사항 관리</a>
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
                <form action="<%= contextPath %>/update.no" method="post">
                	<input type="hidden" name="no" value="<%= n.getNoticeNo() %>">
                    <div style="margin-bottom: 50px;">
                        <table align="center">
                            <tr>
                                <th>제목</th>
                                <td colspan="2">
                                    <input type="text" name="title" style="width: 100%;" value="<%= n.getNoticeTitle() %>" required>
                                </td>
                            </tr>
                            <tr>
                                <td class="space" colspan="3"></td>
                            </tr>
                            <tr>
                                <td colspan="3" style="margin-top: 20px;">
                                    <textarea name="content" rows="20" style="resize: none; width: 100%;" required><%= n.getNoticeContent() %></textarea>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="space"></td>
                            </tr>
                            <tr>
                                <td colspan="3" align="center">
                                    <button type="submit" class="btn" style="background-color: rgb(115, 90, 75); color: white;" onclick="updateNotice();">수정</button>
                                    <button type="button" class="btn" style="background-color: rgb(235, 231, 227);" onclick="history.back();">취소</button>
                                </td>
                            </tr>
                        </table>
                    </div>
                </form>
            </div>
            <script>
                function updateNotice(){
                    if(!confirm("해당 공지사항을 수정하시겠습니까?")){
                    	event.preventDefault();
                    }
                }
            </script>
        </section>
        <!-- section end -->

       	<%@ include file="/views/common/footer.jsp" %>
       
    </div>
</body>
</html>