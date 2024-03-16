<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .mypage_rec_menu{
            color: white;
            text-decoration: none;
        }
        .mypage_cir_menu{
            color:  rgb(99, 76, 70);
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
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">메뉴명</h3>
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
                    <h3>GALGODA제주님의 마이페이지</h3>
                    <div style="margin-top: 10px;border: 2px solid lightgray;"></div>
                    <h6 style="margin-top: 10px;">GALGODA에서 더 많은 고객들을 만나보세요!
                    </h6>
                </div>
        
                <br>

                <div class="mypage_content">
                    <div class="mypage_shortcut">  
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="" class="mypage_cir_menu">40</a>
                            </div>
                            <div class="mypage_circle_menu">
                                <button class="btn">객실현황</button>
                            </div>
                        </div>
                        
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="" class="mypage_cir_menu">15</a>
                            </div>
                            <div class="mypage_circle_menu">
                                <button class="btn">예약현황</button>
                            </div>
                        </div>
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="" class="mypage_cir_menu">26</a>
                            </div>
                            <div class="mypage_circle_menu">
                                <button class="btn">등록리뷰</button>
                            </div>
                        </div>
                    </div>

                    <br><br>

                    <div class="mypage_menu">
                        <div class="mypage_rectangle">
                            <a href="" class="mypage_rec_menu">예약 관리</a>
                        </div>
                        <div class="mypage_rectangle">
                            <a href="" class="mypage_rec_menu">호텔 관리</a>
                        </div>
                        <div class="mypage_rectangle">
                            <a href="" class="mypage_rec_menu">담당자 정보 수정</a>
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