<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	int roomCount = (int)request.getAttribute("roomCount");
	int resCount = (int)request.getAttribute("resCount");
	int reviewCount = (int)request.getAttribute("reviewCount");
	String hotelName = (String)request.getAttribute("hotelName");

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel MyPage</title>
<style>
		/* 마이페이지_메인에만 적용하는 스타일 */

        .mypage_header {
	        margin: 0 auto;
	        width: 600px;
	     }
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
        #mypage_rec_menu{
            color: white;
            text-decoration: none;
        }
        #mypage_cir_menu{
            color:  rgb(99, 76, 70);
            text-decoration: none;
        }
        button {pointer-events : none;}
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
                        <a class="nav-link "  href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="<%= contextPath %>/hotelinsertForm.ho">호텔등록</a></div> </li> 
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">호텔 정보 수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">객실등록</a></div> </li>  
                    <li> <div id="demo"  class="collapse " style="margin-left: 30px;"><a href="">객실수정</a></div> </li>  
                    <li > <div id="demo" class="collapse " style="margin-left: 30px;"><a href="">리뷰 관리</a></div> </li>   
                    
                    
                    <li>
                        <a class="nav-link" href="<%= contextPath %>/resList.ho?page=1"  >예약관리</a>
                    </li>
                  
                    <li>
                        <a class="nav-link" style="color: black;" href="<%=contextPath %>/personalInfo.ho" data-target="#demo3">담당자 정보 수정</a>
                    </li>
                        
                    
                    <li>
                         <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="<%= contextPath %>/list.no?page=1">공지사항</a></div> </li>   
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="<%= contextPath %>/list.inq?page=1">문의사항</a></div> </li>   
                </ul>
            </div>

            <div class="page_content"> 


                <div class="mypage_header">
                    <h3><%=hotelName %>님의 마이페이지</h3>
                    <div style="margin-top: 10px;border: 2px solid lightgray;"></div>
                    <h6 style="margin-top: 10px;">GALGODA에서 더 많은 고객들을 만나보세요!
                    </h6>
                </div>
        
                <br>

                <div class="mypage_content">
                    <div class="mypage_shortcut">  
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="<%= contextPath %>/roomUpdateForm.ho" id="mypage_cir_menu"><%=roomCount%></a>
                            </div>
                            <div class="mypage_circle_menu">
                                <button class="btn">객실현황</button>
                            </div>
                        </div>
                        
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="<%= contextPath %>/resList.ho?page=1" id="mypage_cir_menu"><%=resCount%></a>
                            </div>
                            <div class="mypage_circle_menu">
                                <button class="btn">예약현황</button>
                            </div>
                        </div>
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="<%= contextPath %>/revList.ho?page=1" id="mypage_cir_menu"><%=reviewCount%></a>
                            </div>
                            <div class="mypage_circle_menu">
                                <button class="btn">등록리뷰</button>
                            </div>
                        </div>
                    </div>

                    <br><br>

                    <div class="mypage_menu">
                        <div class="mypage_rectangle">
                            <a href="<%= contextPath %>/resList.ho?page=1" id="mypage_rec_menu">예약 관리</a>
                        </div>
                        <div class="mypage_rectangle">
                            <a href="<%= contextPath %>/hotelinsertForm.ho" id="mypage_rec_menu">호텔 관리</a>
                        </div>
                        <div class="mypage_rectangle">
                            <a href="<%= contextPath %>/personalInfo.ho" id="mypage_rec_menu">담당자 정보 수정</a>
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