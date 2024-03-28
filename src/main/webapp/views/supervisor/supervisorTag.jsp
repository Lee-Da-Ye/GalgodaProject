<%@page import="com.galgoda.hotel.model.vo.Tag"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Tag> list = (List<Tag>)request.getAttribute("list");%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>태그관리</title>
<style>
.page_content {                                                                                                                                                                                   width: 100%;        
    padding-top: 30px;
    padding-left: 30px;
    padding-right: 30px;
}

.contentName{
    color: rgb(115, 90, 75);
}

.tag_content{
    display: inline-block;
    width: 60%;
    min-height: 400px;
    border: 1px solid black;
    text-align: left;
    padding: 20px;
}
.tag_content label{
    margin-right: 10px;
}


.tag_controll *{
    margin-left: 30px;
    margin-top: 10px;
}
.formCustume{
    color: #495057;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    height: calc(1.3em + 0.75rem + 2px);
}
#buttonColor{
    background-color: rgb(235, 231, 227); 
    color: black;
}      
#buttonColor2{
	background-color: rgb(115, 90, 75); 
    color: white;
}
</style>
</head>
<body>
	<div class="wrap">
        <%@ include file="/views/common/adminHeader.jsp" %>

		<% if(loginAdmin==null){ %>
		 	 <script>
		        location.href = "<%=contextPath %>";
		    </script>
		<%} %>
        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">호텔관리</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/hotelList.su?page=1" >호텔등록 현황</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/codeList.su?page=1"  >호텔코드 등록</a>
                    </li>
                    <li>
                        <a class="nav-link" style="background-color: rgb(115, 90, 75); color: white;" href="" >태그 관리</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/option.su" >추가옵션 관리</a>
                    </li>
                        
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">태그관리</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>
                <div align="center">
                    <h4 style="display: inline;"><span class="badge badge-secondary" style="background-color: rgb(235, 231, 227); color: rgb(115, 90, 85);">등록된태그</span></h4>
                    <div  class="tag_content formCustume">
                    	<%for(Tag t : list){ %>
                        <label>
                            <input type="radio" name="tag">
                            <%=t.getTagName() %>
                        </label>
                        <%} %>
                    </div>
                    <div class="tag_controll">
                        <!--<i class="bi bi-search" style="background-color: lightgray;"></i>-->
                        <input type="hidden" class="formCustume" placeholder="태그검색">
                        <button  class="btn btn-secondary" id="buttonColor2" style="margin-top: 10px;" data-toggle="modal" data-target="#tagAdd" >추가하기</button>
                        <button  class="btn btn-secondary" id="buttonColor2" style="margin-top: 10px;" data-toggle="modal" data-target="#tagModify" onclick="Callmodify();">수정하기</button>
                        <button  class="btn btn-secondary" id="buttonColor2" style="margin-top: 10px;" data-toggle="modal" data-target="#tagDelete" onclick="Calldelete();">삭제하기</button>
                    </div>
                </div>  
            </div>
        <!--추가하기 모달-->
        <!-- The Modal -->
        <div class="modal" id="tagAdd">
            <div class="modal-dialog" style="width: 350px;">
            <div class="modal-content">
        
                <!-- Modal body -->
                <div class="modal-body ">
                        <span class="btn btn-sm" id="buttonColor" >추가할 태그명</span>
                        <input type="text" name="tagName" class="formCustume">
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer center">
                <button class="btn btn-secondary" style="width: 80px;" onclick="addButton();">Ok</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
        
            </div>
            </div>
        </div>
        
        <!--수정하기 모달-->
        <!-- The Modal -->
        <div class="modal" id="tagModify">
            <div class="modal-dialog" style="width: 350px;">
            <div class="modal-content">
        
                <!-- Modal body -->
                <div class="modal-body ">
                    <table>
                        <tr>
                            <td class="btn btn-sm" id="buttonColor" >기존 태그명</td>
                            <td><input type="text" name="originTag" class="formCustume" readonly ></td>
                        </tr>
                        <tr>
                            <td class="btn btn-sm" id="buttonColor">수정할 태그명</td>
                            <td><input type="text" class="formCustume" name="newTagName"></td>
                        </tr>
                    </table>
                         <br>
                        
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer center">
                <button class="btn btn-secondary" style="width: 80px;" onclick="modifyButton();">Ok</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
        
            </div>
            </div>
        </div>

        <!--삭제하기 모달-->
        <!-- The Modal -->
        <div class="modal" id="tagDelete">
            <div class="modal-dialog modal-sm">
            <div class="modal-content">
        
                <!-- Modal body -->
                <div class="modal-body center">
                	<p name="deleteTag"></p>
                	<p> 태그를 삭제하시겠습니까?</p>
                </div>
        
                <!-- Modal footer -->
                <div class="modal-footer center">
                    <button href="" class="btn btn-secondary" style="width: 80px;" onclick="deleteButton();">Ok</button>
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                </div>
        
            </div>
            </div>
        </div>
		<script>
			function addButton(){
		    	let tagName = $('input[name="tagName"]').val();
		    	location.href = "<%=contextPath%>/insertTag.su?name=" + tagName;
		    }
			function Callmodify(){
				tagName = $('input[type="radio"]:checked').closest('label').text().trim();
		    	$('input[name="originTag"]').val(tagName);
			}
			
			function modifyButton(){
		    	tagName = $('input[type="radio"]:checked').closest('label').text().trim();
		    	newTagName = $('input[name="newTagName"]').val();
		    	location.href = "<%=contextPath%>/updateTag.su?name=" + tagName +"&newTagName=" + newTagName;
		    }
			
			function Calldelete(){
				tagName = $('input[type="radio"]:checked').closest('label').text().trim();
		    	$('p[name="deleteTag"]').text("#" +tagName);
			}
			
			function deleteButton(){
		    	tagName = $('input[type="radio"]:checked').closest('label').text().trim();
		    	location.href = "<%=contextPath%>/deleteTag.su?name=" + tagName;
		    }
		
		</script>

        </section>

         <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>