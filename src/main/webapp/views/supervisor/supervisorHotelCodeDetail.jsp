<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% HotelUser code = (HotelUser)request.getAttribute("code"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔코드 관리</title>
<style>
.page_content {
                                                                                                                                                                                
    width: 100%;        
    padding-top: 30px;
    padding-left: 30px;
    padding-right: 30px;
    /*border: 1px solid red;*/

}

.contentName{
    color: rgb(115, 90, 75);
}
.page_content table>tbody>tr{cursor: pointer;}

#buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}

.formCustume{
    color: #495057;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    height: calc(1.3em + 0.75rem + 2px);
}

.selectCodeDiv{
    border: 1px solid rgb(115, 90, 75); 
    border-radius: 10px;
    width: 400px; height: 300px; 
    padding-top: 30px;
}
</style>
</head>
<body>
	<div class="wrap">
        <%@ include file = "/views/common/adminHeader.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">메뉴명</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/hotelList.su?page=1" >호텔등록 현황</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/codeList.su?page=1" style="background-color: rgb(115, 90, 75); color: white;" >호텔코드 등록</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/tag.su" >태그 관리</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/option.su" >추가옵션 관리</a>
                    </li>
                        
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">호텔코드 수정</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>
                <div align="center">
                
                    <div class="selectCodeDiv">
                        <form action="<%=contextPath %>/updateCode.su" method="post">
                        	<input type="hidden" name="memNo" value="<%=code.getMemNo()%>">
	                        <span class="btn btn-modify" style="background-color: rgb(235, 231, 227); cursor: default;" >호텔이름</span>
	                        <input type="text" name="hotelName" class="formCustume" value="<%=code.getHotelName()%>"> 
	                        <br>
	                        <span class="btn" style="background-color: rgb(235, 231, 227); cursor: default;" >호텔코드</span>
	                        <input type="text" name="hotelCode" class="formCustume" value="<%=code.getAuthentiCode()%>"> 
	                        <br>
	                        <span class="btn" style="background-color: rgb(235, 231, 227); cursor: default;" >담당자  </span>
	                        <input type="text" name="memName" class="formCustume" value="<%=code.getMemName()%>">
	                        
	                        <div style="padding-top: 20px; ">
	                            <button type="submit" class="btn btn-secondary" id="buttonColor" style="margin-top: 10px;">수정하기</button>
	                            <a href="<%=contextPath %>/deleteCode.su?no=<%=code.getMemNo()%>" class="btn btn-secondary" id="buttonColor" style="margin-top: 10px;" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제하기</a>
	                        </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </section>

        <%@ include file = "/views/common/footer.jsp" %>
    </div>
</body>
</html>