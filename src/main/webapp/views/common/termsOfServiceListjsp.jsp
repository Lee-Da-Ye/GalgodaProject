<%@page import="com.galgoda.supervisor.model.vo.Terms"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Terms> list = (List<Terms>)request.getAttribute("list"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관</title>
<style>
.contentName{
     color: rgb(115, 90, 75);
}
.page_content table>tbody>tr{cursor: pointer;}

#buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}
</style>
</head>
<body>
	<div class="wrap">
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h4 class="sideMenubar_head">이용약관</h4>
                    </li>
                    <li>
                        <a href="<%=contextPath %>/termsList.co" class="nav-link" >개인정보 처리방침</a>
                    </li>
                    <li>
                        <a href="<%=contextPath %>/termsList.co" class="nav-link" style="background-color: rgb(115, 90, 75); color: white;">이용약관</a>
                    </li>
                        
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">이용약관</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>

                <table class="table table-hover" id="termsBoard">
                    <thead>
                      <tr class="table-secondary">
                        <th width="100">번호</th>
                        <th width="300">제목</th>
                        <th width="100">작성자</th>
                        <th width="100">비고</th>
                      </tr>
                    </thead>

                    <tbody>
                    	<%for(Terms t : list){ %>
	                      <tr>
	                        <td><%=t.getTermsNo() %></td>
	                        <td><%=t.getTermsTitle() %></td>
	                        <td><%=t.getAdminNo() %></td>
	                        <td><%=t.getNotes() %></td>
	                      </tr>
                      	<%} %>
                    </tbody>
                </table>
                <%if(loginAdmin != null){ %>
                <div align="right">
                  <a href="<%=contextPath%>/enrollTermForm.su" class="btn btn-secondary" id="buttonColor" style="margin-top: 10px;">등록하기</a>
                </div>
				<%} %>
                

            </div>
			
			<script>
                	$(function(){
                		$("#termsBoard>tbody>tr").click(function(){
                				location.href = "<%=contextPath%>/detailTerms.co?no=" + $(this).children().eq(0).text();
                		})
                			
                		
                	})
                
            </script>

        </section>

        <%@ include file="/views/common/footer.jsp" %>
     </div>
</body>
</html>