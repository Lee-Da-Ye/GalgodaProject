<%@page import="com.galgoda.hotel.model.vo.Option"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% List<Option> list = (List<Option>)request.getAttribute("list"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>추가옵션 관리</title>
<style>
.page_content {                                                                                                                                                                                
    width: 100%;        
    padding-top: 30px;
    padding-left: 30px;
    padding-right: 30px;    
}

.contentName{
    color: rgb(115, 90, 75);
}

.addOpion_content{
    display: inline-block;
    width: 60%;
    min-height: 400px;
    border: 1px solid black;
    text-align: left;
    padding: 20px;
}
.addOpion_content label{
    margin-right: 10px;
}
.addOption_controll *{
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
                        <a class="nav-link"  href="<%=contextPath %>/tag.su" >태그 관리</a>
                    </li>
                    <li>
                        <a class="nav-link" style="background-color: rgb(115, 90, 75); color: white;" href="<%=contextPath %>/option.su" >추가옵션 관리</a>
                    </li>
                        
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">추가옵션 관리</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>
                <div align="center">
                    <h4 style="display: inline;"><span class="badge badge-secondary" style="background-color: rgb(235, 231, 227); color: rgb(115, 90, 85);">등록된태그</span></h4>
                    <div  class="addOpion_content formCustume">
                    	<%for(Option o : list){ %>
	                        <label>
	                            <input type="radio" name="addOpion">
	                            <%=o.getOpName() %>
	                        </label>
						<%} %>                                          
                        
                    </div>
                    <div class="addOption_controll">
                        <!--<i class="bi bi-search" style="background-color: lightgray;"></i>-->
                        <input type="hidden" class="formCustume" placeholder="옵션검색">
                        <button  class="btn btn-secondary" id="buttonColor2" style="margin-top: 10px;" data-toggle="modal" data-target="#optionAdd">추가하기</button>
                        <button  class="btn btn-secondary" id="buttonColor2" style="margin-top: 10px;" data-toggle="modal" data-target="#optionModify" onclick="Callmodify();">수정하기</button>
                        <button  class="btn btn-secondary" id="buttonColor2" style="margin-top: 10px;" data-toggle="modal" data-target="#optionDelete" onclick="Calldelete();">삭제하기</button>
                    </div>
                </div>  
            </div>
        <!--추가하기 모달-->
        <!-- The Modal -->
        <div class="modal" id="optionAdd">
            <div class="modal-dialog" style="width: 350px;">
            <div class="modal-content">
        
                <!-- Modal body -->
                <div class="modal-body ">
                        <span class="btn btn-sm" id="buttonColor">추가할 옵션명</span>
                        <input type="text" name="name">
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
        <div class="modal" id="optionModify">
            <div class="modal-dialog" style="width: 350px;">
            <div class="modal-content">
        		<form action="<%=contextPath%>/updateOption.su" method="post">
                <!-- Modal body -->
                	<div class="modal-body ">
	                    <table>
	                        <tr>
	                            <td class="btn btn-sm" id="buttonColor" >기존 옵션명</td>
	                            <td><input type="text" name="originName" readonly></td>
	                        </tr>
	                        <tr>
	                            <td class="btn btn-sm" id="buttonColor">수정할 옵션명</td>
	                            <td><input type="text" name="newName"></td>
	                        </tr>
	                    </table>
	                </div>
	        
	                <!-- Modal footer -->
	                <div class="modal-footer center">
	                <button type="submit" class="btn btn-secondary" style="width: 80px;">Ok</button>
	                <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	                </div>
                </form>
        
            </div>
            </div>
        </div>

        <!--삭제하기 모달-->
        <!-- The Modal -->
        <div class="modal" id="optionDelete">
            <div class="modal-dialog modal-sm">
            <div class="modal-content">
        		<form action="<%=contextPath %>/deleteOption.su" method="post">
	                <!-- Modal body -->
	                <div class="modal-body center">
	                	<input type="hidden" name="deleteOption">
	                	<p name="deleteTarget"></p>
	                	<p> 해당 옵션을 삭제하시겠습니까?</p>
	                </div>
	        
	                <!-- Modal footer -->
	                <div class="modal-footer center">
	                    <button type="submit" class="btn btn-secondary" style="width: 80px;">Ok</button>
	                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
	                </div>
        		</form>
            </div>
            </div>
        </div>
		
		<script>
			function addButton(){
		    	let optionName = $('input[name="name"]').val();
		    	location.href = "<%=contextPath%>/insertOption.su?name=" + optionName;
		    }
			function Callmodify(){
				optionName = $('input[type="radio"]:checked').closest('label').text().trim();
		    	$('input[name="originName"]').val(optionName);
			}
			function Calldelete(){
				optionName = $('input[type="radio"]:checked').closest('label').text().trim();
		    	$('p[name="deleteTarget"]').text("#" + optionName);
		    	$('input[name="deleteOption"]').val(optionName);
			}
			
			
		
		</script>

        </section>

         <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>