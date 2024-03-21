<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>호텔코드 관리</title>
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
                        <a class="nav-link" href="" >호텔등록 현황</a>
                    </li>
                    <li>
                        <a class="nav-link" href="" style="background-color: rgb(115, 90, 75); color: white;" >호텔코드 등록</a>
                    </li>
                    <li>
                        <a class="nav-link" href="" >태그 관리</a>
                    </li>
                    <li>
                        <a class="nav-link" href="" >추가옵션 관리</a>
                    </li>
                        
                    
                    
                </ul>
            </div>

            <div class="page_content"> 
                <h2 class="contentName">호텔코드 등록</h2>
                <div style="margin-top: 10px; margin-bottom: 40px; border: 2px solid lightgray;"></div>
                <div align="center">
                    <div class="selectCodeDiv">
                        
                        <span class="btn btn-modify" style="background-color: rgb(235, 231, 227); cursor: default;" >호텔이름</span>
                        <input type="text" class="formCustume" value="GALGODA제주"> 
                        <br>
                        <span class="btn" style="background-color: rgb(235, 231, 227); cursor: default;" >호텔코드</span>
                        <input type="text" class="formCustume" value="QWERFEWS"> 
                        
                        <div style="padding-top: 20px; ">
                            <a class="btn btn-secondary buttonColor" style="margin-top: 10px;">수정하기</a>
                            <a class="btn btn-secondary buttonColor" style="margin-top: 10px;" onclick="return confirm('정말로 삭제하시겠습니까?')">삭제하기</a>
                        </div>
                    </div>
                    
                </div>
            </div>
        </section>

        <%@ include file = "/views/common/footer.jsp" %>
    </div>
</body>
</html>