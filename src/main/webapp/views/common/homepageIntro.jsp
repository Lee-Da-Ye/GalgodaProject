<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Galgoda HomePage Intro</title>
<style>
		/* GALGODA 소개 페이지 스타일 */
		
		.page_content {

            width: 100%;
            /* border: 1px solid red; */
            display: flex;
            flex-direction: column;
            position: relative;
        }
      
        .mypage_header {
            margin: 0 auto;
            width: 600px;
        }
        .hotel_introduction{
            position: absolute;
            color:white;
            top: 200px;
            left: 100px;
        }
		
        #galgoda_intro{
            margin: 0 auto;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        table {
            border-collapse: collapse;
            width: 800px;
            height: 600px;
        }
        th, td {
            border: none;
            padding: 10px;
            text-align: center;
            font-weight: bold;
            font-size: 20px;
            position: relative;
        }
        .cell1 {
            transition: background-color 0.3s ease;
        }
        .cell2 {
            transition: background-color 0.3s ease;
        }
        .cell3 {
            transition: background-color 0.3s ease;
        }
        .cell1:hover img {
        opacity: 0; /* 이미지를 호버했을 때 숨김 */
        }
        .cell1:hover .text-overlay {
            visibility: visible; /* 호버할 때 텍스트를 보이도록 변경 */
        }
        .cell2:hover img {
        opacity: 0; /* 이미지를 호버했을 때 숨김 */
        }
        .cell2:hover .text-overlay {
            visibility: visible; /* 호버할 때 텍스트를 보이도록 변경 */
        }
        .cell3:hover img {
        opacity: 0; /* 이미지를 호버했을 때 숨김 */
        }
        .cell3:hover .text-overlay {
            visibility: visible; /* 호버할 때 텍스트를 보이도록 변경 */
        }
        .cell1:hover {
            background-color: #ee70b6;
            text-align: left;
        }
        .cell2:hover {
            background-color: #14da14f8;
            text-align: left;
        }
        .cell3:hover {
            background-color: #ffcccc;
            text-align: left;
        }
        
        img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover; /* 이미지가 셀 내에 꽉 차도록 설정 */
        }

        .text-overlay {
            position: absolute;
            top: 40%;
            left: 50%;
            transform: translateX(-50%);
            color: white;
            font-size: 25px;
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
                <div id="galgoda_intro">
                    <table>
                        <tr>
                            <td class="cell1" style="position: relative;">
                                <img src="<%= request.getContextPath()%>/resources/images/city.jpg" alt="" style="width: 100%; height: 100%;">
                                <div class="text-overlay">도심부터</div> <!-- 텍스트 오버레이 추가 -->
                            </td>
                            <td colspan="2" class="cell2">
                                <img src="<%= request.getContextPath()%>/resources/images/rest.jpg" alt="" style="width: 100%; height: 100%;">
                                <div class="text-overlay">휴양지까지</div> <!-- 텍스트 오버레이 추가 -->
                            </td>
                            
                        </tr>
                        <tr>
                            <td class="cell3">
                                <img src="<%= request.getContextPath()%>/resources/images/cinema.jpg" alt="" style="width: 100%; height: 100%;">
                                <div class="text-overlay">ARTS & CULTURE</div> <!-- 텍스트 오버레이 추가 -->
                            </td>
                            <td class="cell2">
                                <img src="<%= request.getContextPath()%>/resources/images/recreation.jpg" alt="" style="width: 100%; height: 100%;">
                                <div class="text-overlay">RECREATION</div> <!-- 텍스트 오버레이 추가 -->
                            </td>
                            <td class="cell1">
                                <img src="<%= request.getContextPath()%>/resources/images/shopping.jpg" alt="" style="width: 100%; height: 100%;">
                                <div class="text-overlay">SHOPPING</div> <!-- 텍스트 오버레이 추가 -->
                            </td>
                        </tr>
                        <tr>
                            <td class="cell2">
                                <img src="<%= request.getContextPath()%>/resources/images/tag.jpg" alt="" style="width: 100%; height: 100%;">
                                <div class="text-overlay">TAG로 찾기</div> <!-- 텍스트 오버레이 추가 -->
                            </td>
                            <td class="cell3" colspan="2">
                                <img src="<%= request.getContextPath()%>/resources/images/local_attraction.jpg" alt="" style="width: 100%; height: 100%;">
                                <div class="text-overlay">LOCAL ATTRACTIONS</div> <!-- 텍스트 오버레이 추가 -->
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
               
            
                
          
		<br><br>

        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>
</body>
</html>