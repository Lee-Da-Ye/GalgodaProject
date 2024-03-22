<%@page import="com.galgoda.common.model.vo.Attachment"%>
<%@page import="com.galgoda.supervisor.model.vo.Terms"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% Terms t  = (Terms)request.getAttribute("term"); %>    
<% Attachment at = (Attachment)request.getAttribute("at"); %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관 상세</title>
<style>
.contentName{
    color: rgb(115, 90, 75);
}
.page_content table>tbody>tr{cursor: pointer;}

#buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}

 /* 공지사항상세페이지 스타일 */
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

.formCustume{
    color: #495057;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    height: calc(1.3em + 0.75rem + 2px);
}
.textareaCustume{
    color: #495057;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
}
.dateCustume{
    border: 1px solid #ced4da;
    border-radius: 0.25rem; 
    width: 100px; 
    text-align: center;
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

                <div style="margin-bottom: 50px;">
                	<form action="<%=contextPath %>/updateTerm.su" method="post" enctype="multipart/form-data">
                		<input type="hidden" name="no" value="<%=t.getTermsNo()%>">
	                    <table align="center">
	                        <tr>
	                            <th>제목</th>
	                            <td colspan="2">
	                                <input readonly type="text" class="formCustume"  name="title" style="width: 100%; text-align: center;" value="<%=t.getTermsTitle() %>" >
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="space" colspan="3"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="3" style="margin-top: 20px;">
	                                <textarea readonly name="content" class="textareaCustume" rows="20"  style="resize: none; width: 100%;" ><%=t.getTermsContent() %></textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>첨부파일</th> 
	                            <td colspan="2">
		                            <!-- 기존의 첨부파일이 있었을 경우 -->
	                                <%if(at!=null){ %>
	                                <a download="<%=at.getFileName() %>" href="<%=contextPath + "/" + at.getFilePath() + at.getFileName()%>"><%=at.getFileName()%></a>
	                                <input type="hidden" name="originFileNo" readonly value="<%=at.getFileNo()%>">
	                                <%}else{%>
	                                <input readonly type="text" class="formCustume" value="첨부파일이 없습니다." >
	                                <%} %>
	                                
	                                <%if(loginAdmin != null){ %>
	                                <!-- 새로운 첨부파일 업로드 가능하기 때문에 그 때의 input type=file -->
	                                <input type="file" name="upfile" class="form-control-file">
	                                <%} %>
	                            </td>
	                            
	                        </tr>
	                        <tr>
	                            <td class="space" colspan="3"></td>
	                        </tr>
	                        <tr>
	                            <th>비고</th> 
	                            <td colspan="2">
	                            	<input type="text" class="form-control" name="notes" readonly value="<%=t.getNotes()%>">
	                            </td>
	                            
	                        </tr>
	                        <tr>
	                            <td class="space" colspan="3"></td>
	                        </tr>
	                        <tr>
	                            <th>작성일</th> 
	                            <td class="dateCustume"><%=t.getModifyDate() %></td>
	                            <td></td>
	                        </tr>
	                        <%if(loginAdmin != null){ %>
	                        <tr>
	                            <td colspan="3" align="right">
	                                <button  class="btn" id="buttonColor" color: white;">수정하기</button>
	                                <a href="<%=contextPath %>/deleteTerm.su?no=<%=t.getTermsNo() %>" class="btn" style="background-color: rgb(235, 231, 227);" onclick="return confirm('이용약관을 삭제하시겠습니까?')">삭제하기</a>
	                            </td>
	                        </tr>
	                        <%} %>
	                    </table>
                    </form>
                </div>
                

            </div>
            
		
        </section>

        <%@ include file="/views/common/footer.jsp" %>
      </div>
</body>
</html>