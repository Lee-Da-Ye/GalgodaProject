<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Galgoda</title>
<style>


</style>
</head>
<body>
	<div class="wrap">
		<%@ include file="/views/common/header.jsp" %>
		
		
		<section class="mainpage_content">
            <div class="main_image"><img src="<%=contextPath%>/resources/images/mainPageImg.jpg" width="100%" alt="메인홈페이지 이미지"></div>
            <div class="main_top">
                <form action="">
                    <table class="main_searchBar">
                        <thead>
                            <tr>
                                <td width="300px">호텔 또는 여행지</td>
                                <td width="150px">체크인</td>
                                <td width="150px">체크아웃</td>
                                <td width="100px"></td>
                                <td width="110px" align="center">인원수</td>
                                <td width="110px" align="center">객실</td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr> 
                                <td><div class="iconInput"><i class="bi bi-search"></i><input type="text" class="form-control" style="text-align: center;"></div></td>
                                <td><input type="date" class="form-control"></td>
                                <td><input type="date" class="form-control"></td>
                                <td></td>
                                <td><input type="number" class="form-control"></td>
                                <td><input type="number" class="form-control"></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div class="iconInput">
                                        <i class="bi bi-tags">
                                        </i><input type="text" class="form-control" style="text-align: center;">
                                    </div>
                                </td>
                                <td></td>
                                <td></td>
                                <td colspan="2" align="center"><button type="submit" class="btn main_searchButton" >검색하기</button></td>
                                
                            </tr>
                        </tbody>
                    </table>
                </form>
            </div>
            
            <div class="main_bottom">
                <div class="main">
                    <h2 class="mainpage_h2" style="margin-left: 200px;">인기 호텔</h2>
                    <div class="mainpage_imgContent" >
                        <div class="mainpage_hotelThumbnail">
                            <img class="mainpage_hotelImg" src="" alt="">
                        </div>
                        <div class="mainpage_hotelThumbnail">
                            <img class="mainpage_hotelImg" src="" alt="">
                        </div>
                        <div class="mainpage_hotelThumbnail">
                            <img class="mainpage_hotelImg" src="" alt="">
                        </div>
                        
                    </div>
                </div>
                
            </div>
        </section>
	
	
		<%@ include file="/views/common/footer.jsp" %>
	</div>
</body>
</html>