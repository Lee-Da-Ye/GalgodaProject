<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>이용약관등록</title>
<style>
.contentName{
    color: rgb(115, 90, 75);
}
.page_content table>tbody>tr{cursor: pointer;}

.buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}

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
</style>
</head>
<body>
	<div class="wrap">
        <%@ include file="/views/common/adminHeader.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h4 class="sideMenubar_head">홈페이지 관리</h4>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="background-color: rgb(115, 90, 75); color: white;"  href="<%=contextPath%>/termsList.su" >이용약관 관리</a>
                    </li>
                        
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">이용약관</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>

                <div style="margin-bottom: 50px;">
                	<form action="<%=contextPath %>/insertTerm.su" method="post" enctype="multipart/form-data">
                		<input type="hidden" name="adminNo" value="<%=loginAdmin.getAdminNo() %>">
	                    <table align="center">
	                        <tr>
	                            <th>제목</th>
	                            <td colspan="2">
	                                <input type="text" class="formCustume" name="title" style="width: 100%; text-align: center;" placeholder="제목을 입력하세요" >
	                            </td>
	                        </tr>
	                        <tr>
	                            <td class="space" colspan="3"></td>
	                        </tr>
	                        <tr>
	                            <td colspan="3" style="margin-top: 20px;">
	                                <textarea name="content" class="textareaCustume" rows="20"  style="resize: none; width: 100%;" ></textarea>
	                            </td>
	                        </tr>
	                        <tr>
	                            <th>첨부파일</th> 
	                            <td colspan="2">
	                                <input type="file" name="upfile" class="form-control-file border">
	                            </td>
	                            
	                        </tr>
	                        <tr>
	                            <td class="space" colspan="3"></td>
	                        </tr>
	                        <tr>
	                        	<th>비고</th>
	                        	<td colspan="2">
	                        		<input type="text" name="notes" class="form-control">
	                        	</td>
	                        </tr>
	                        <tr>
	                            <td class="space" colspan="3"></td>
	                        </tr>
	                        <tr >
	                            <td colspan="3" align="right">
	                                <button type="submit" class="btn" style="background-color: rgb(115, 90, 75); color: white;">등록하기</button>
	                                <button class="btn" style="background-color: rgb(235, 231, 227);" onclick="history.back()">뒤로가기</button>
	                            </td>
	                        </tr>
	                    </table>
                    </form>
                </div>
                

            </div>


        </section>

         <%@ include file="/views/common/footer.jsp" %>
    </div>   
</body>
</html>