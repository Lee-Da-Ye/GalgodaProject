<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Supervisor MyPage</title>
<style>

.page_content {
    width: 100%; 
    padding-top: 30px;
    padding-left: 30px;
    padding-right: 30px;
    display: flex;
    flex-direction: column;
}
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
/*호버기능 색변경 수정*/

.mypage_circle:hover a{
    color: gray;
    text-decoration: none;
}
.mypage_rectangle:hover a{
	color: gray;
    text-decoration: none;
}
.mypage_rectangle:hover{
	cursor:pointer;
}
.btn {
   white-space: nowrap; /* 텍스트 줄바꿈 방지 */
}
</style>
</head>
<body>
	<div class="wrap">
        <%@ include file="/views/common/adminHeader.jsp" %>


        <section class="main_content">
            <div class="page_content"> 


                <div class="mypage_header">
                    <h3>관리자 페이지</h3>
                    <div style="margin-top: 10px;border: 2px solid lightgray;"></div>
                    
                </div>
        
                <br>

                <div class="mypage_content">
                    <div class="mypage_shortcut">  
                        <div class="mypage_circle">
                            <div class="mypage_circle_num" id="cirMenu1" >
                                <a href="<%=contextPath%>" id="cirMenuLink1" class="mypage_cir_menu">40</a>
                            </div>
                            <div class="mypage_circle_menu">
                                <button class="btn">호텔 등록 현황</button>
                            </div>
                        </div>
                        
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="" class="mypage_cir_menu">12</a>
                            </div>
                            <div class="mypage_circle_menu">
                                <button class="btn">고객센터 새 문의글</button>
                            </div>
                        </div>
                        <div class="mypage_circle">
                            <div class="mypage_circle_num">
                                <a href="" class="mypage_cir_menu">3</a>
                            </div>
                            <div class="mypage_circle_menu">
                                <button class="btn">이용약관 등록 수</button>
                            </div>
                        </div>
                    </div>

                    <br><br>

                    <div class="mypage_menu">
                        <div class="mypage_rectangle" onclick="LinkTo(this);">
                            <a href="<%=contextPath%>/no1" class="mypage_rec_menu">호텔 관리</a>
                        </div>
                        <div class="mypage_rectangle" onclick="LinkTo(this);">
                            <a href="<%=contextPath%>/userList.su?page=1" class="mypage_rec_menu">사용자 관리</a>
                        </div>
                        <div class="mypage_rectangle">
                            <a href="" class="mypage_rec_menu">고객센터 관리</a>
                        </div>
                        <div class="mypage_rectangle" onclick="LinkTo(this);">
                            <a href="<%=contextPath %>/termsList.su" class="mypage_rec_menu">홈페이지 관리</a>
                        </div>
                    </div>

                    <br><br>
                </div>
            
            </div>
			
			<script>
			    function LinkTo(element) {
			    	location.href = element.querySelector('a').getAttribute('href');
			        
			    }
			</script>
			
			
        </section>

         <%@ include file="/views/common/footer.jsp" %>
    </div> 
</body>
</html>