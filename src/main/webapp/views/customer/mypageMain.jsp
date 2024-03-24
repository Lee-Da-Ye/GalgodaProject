<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int resCount = (int)request.getAttribute("resCount");
	int wishCount = (int)request.getAttribute("wishCount");
	int reviewCount = (int)request.getAttribute("reviewCount");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer MyPage Main</title>
<style>
		.mypage_header {
	        margin: 0 auto;
	        width: 600px;
        }

        /* 마이페이지_메인에만 적용하는 스타일 */
        
        .mypage_shortcut{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
        }
       

        .mypage_circle{
            width: 150px;
            height: 150px;
            background-color: rgb(235, 231, 227);
            border-radius: 50%;
            margin: 10px;
            position: relative;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }
        .mypage_circle_num{
            position:absolute;
            font-size: 30px;
            font-weight: bold;
        }
        .mypage_circle_menu{
            position: absolute;
            top:160px;
            font-weight: bold;
        }

        .mypage_menu{
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
        }

        .mypage_rectangle{
            width: 500px;
            height: 30px;
            background-color: rgb(99, 76, 70);
            margin: 5px;
            color: white;
            padding-left: 5px;
            line-height: 30px;
        }
        .mypage_rec_menu{
            color: white;
            text-decoration: none;
        }
        #mypage_cir_menu{
            color:  rgb(99, 76, 70);
            text-decoration: none;
        }
        
        /* 마우스 호버 시 색상 및 밑줄 스타일 */
		.mypage_rec_menu:hover{
		    color: white; 
		    text-decoration: none;
		}
		

</style>
</head>

<body>

	<div class="wrap">
	
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar" style="display: none;">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="" data-toggle="collapse" data-target="#demo">메뉴1</a>
                    </li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">하위메뉴</a>
                        </div>
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo2">메뉴2</a>
                    </li>
                        <div id="demo2" class="collapse" style="margin-left: 30px;">
                            <a href="">하위메뉴</a>
                        </div>
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">메뉴3</a>
                    </li>
                        <div id="demo3" class="collapse" style="margin-left: 30px;">
                            <a href="">하위메뉴</a>
                        </div>
                    
                </ul>
            </div>

            <div class="page_content"> 


                <div class="mypage_header">
                    <h3>홍길동님의 마이페이지</h3>
                    <div style="margin-top: 10px;border: 2px solid lightgray;"></div>
                    <h6 style="margin-top: 10px;">Galgoda에서 여행을 시작해보세요!</h6>
                </div>
        
                <br>

                <div class="mypage_content">
                    <div class="mypage_shortcut">  
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="<%=contextPath%>/resManagement.cu?page=1" id="mypage_cir_menu"><%=resCount%></a>
                            </div>
                            <div class="mypage_circle_menu">
                                <a class="btn">예약현황</a>
                            </div>
                        </div>
                        
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="<%=contextPath%>/wishlist.cu" id="mypage_cir_menu"><%=wishCount%></a>
                            </div>
                            <div class="mypage_circle_menu">
                                <a class="btn">위시리스트</a>
                            </div>
                        </div>
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="" id="mypage_cir_menu"><%=reviewCount%></a>
                            </div>
                            <div class="mypage_circle_menu">
                                <a class="btn">작성 리뷰</a>
                            </div>
                        </div>
                    </div>

                    <br><br>

                    <div class="mypage_menu">
                        <div class="mypage_rectangle">
                            <a href="<%=contextPath%>/resManagement.cu?page=1" class="mypage_rec_menu">예약 관리</a>
                        </div>
                        <div class="mypage_rectangle">
                            <a href="<%=contextPath%>/wishlist.cu" class="mypage_rec_menu">위시리스트</a>
                        </div>
                        <div class="mypage_rectangle">
                            <a href="<%=contextPath%>/personalInfo.cu" class="mypage_rec_menu">개인정보 수정</a>
                        </div>
                    </div>

                    <br><br>
                </div>
            
            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>

</body>
</html>