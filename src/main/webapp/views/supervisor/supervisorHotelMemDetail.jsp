<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% HotelUser mem = (HotelUser)request.getAttribute("mem"); %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔담당자 상세조회</title>
<style>
.page_content {
    width: 100%; 
    padding-top: 30px;
    padding-left: 30px;
    padding-right: 30px;
}

/* 페이지컨텐츠 영역*/
.contentName{
    color: rgb(115, 90, 75);
}
.page_content table>tbody>tr{cursor: pointer;}

#buttonColor{
    background-color: rgb(115, 90, 75); 
    color: white;
}
.btn-secondary:hover{
    background-color: rgb(115, 90, 75); 
    color: lightgray;
}

.formCustume{
    color: #495057;
    border: 1px solid #ced4da;
    border-radius: 0.25rem;
    height: calc(1.3em + 0.75rem + 2px);
}

/*테이블서식영역*/
table{
    border-spacing: 10px;
    border-collapse: separate;
}
table th{
    width: 100px;
    height: 40px;
    background-color: rgb(235, 231, 227);
    border-radius: 5px;
    text-align: center;
    border: 1px solid lightgray;
    color: rgb(94, 94, 94);
}

table td{
    width:1000px;
    height: 30px;
    border-radius: 5px;
    padding-left: 5px;
}
.modify_form{
    width: 80%;
}

/* 갈색 버튼 모음 */
#brown_button{
    background-color: rgb(99, 76, 70);
    border: none;
    color: white;
   
}
#buttonColor2{
    margin-right: 5px; 
    background-color: rgb(235, 231, 227); 
    border: none; color: black;
}
#buttonColor2:hover{
    color: gray;
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
                        <a class="nav-link" href="<%=contextPath %>/hotelList.su?page=1" style="background-color: rgb(115, 90, 75); color: white;" >호텔등록 현황</a>
                    </li>
                    <li>
                        <a class="nav-link" href="<%=contextPath %>/codeList.su?page=1" >호텔코드 등록</a>
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
                <h2 class="contentName">호텔등록 현황 조회 -담당자조회</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>

                
                <div class="mypage" style="width: 80%; min-height: 80%; margin-bottom: 20px;">
            

                    <div class="right_nav">
                        
                        <span id="boot-icon" class="bi bi-person-circle" style="font-size: 20px;"> GALGODA 제주</span>
                        
                    </div>
    
                    <form action="<%=contextPath %>/updateMem.su" method="post">
                    	<input type="hidden" name="no" value="<%=mem.getMemNo() %>">
                        <div style="display: flex;">
                            <table>
                                <tr>
                                    <th>담당자명</th>
                                    <td><input type="text" class="form-control" name="name" required value="<%=mem.getMemName()%>"></td>
                                </tr>
                                <tr>
                                    <th>아이디</th>
                                    <td>
                                        <input type="text" class="form-control"  value="<%=mem.getMemId() %>" disabled>
                                    </td>
                                    
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td>
                                        <div style="display: flex; align-items: center; justify-content: center;">
                                            <input type="text" class="form-control" name="phone" style="flex: 1;" required value="<%=mem.getMemPhone()%>">
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="email" class="form-control" name="email" required value="<%=mem.getMemEmail()%>"></td>
                                </tr>
                                
        
                            </table>
                            
                        </div>
                        
                        <div style="display: flex; justify-content: flex-end;">
                            <button type="submit" class="btn" id="buttonColor2" >정보수정</button>
                            <a href="<%=contextPath %>/deleteMem.su?no=<%=mem.getMemNo() %>" type="button" class="btn btn-secondary" id="brown_button" style="margin-right: 10px;" onclick="return confirm('계정을 삭제하시겠습니까?')">계정삭제</a>
                        </div>                
                    </form>        
                </div>

            </div>

        </section>

         <%@ include file="/views/common/footer.jsp" %>
    </div> 
</body>
</html>