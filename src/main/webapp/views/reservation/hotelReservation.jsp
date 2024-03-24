<%@page import="java.util.List"%>
<%@page import="com.galgoda.hotel.model.vo.Room"%>
<%@page import="com.galgoda.hotel.model.vo.Tag"%>
<%@page import="com.galgoda.hotel.model.vo.Hotel"%>
<%@page import="com.galgoda.customer.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Hotel hotel = (Hotel)request.getAttribute("hotel");
	List<Tag> tag =(List<Tag>)request.getAttribute("tag");
	List<Review> review = (List<Review>)request.getAttribute("review");
	List<Room> rm = (List<Room>)request.getAttribute("room");
			

%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>       
    <!-- 평점 관련 스타일 적용-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 지도 -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Gothic+A1:wght@400;700&display=swap" rel="stylesheet">

    <meta property="og:image" content="image.jpg"/>
    
<style>
#main_content{min-height:600px;}
/*호텔 관련 영역 서식 */
.hotelPictures{
    display: flex;
    
    margin: 20px;
    width: 100px;
    
    border-bottom: 1px solid rgb(99, 76, 70);
}
.hotelImg{
    
    margin: 20px;
    width: 400px;
    height: 290px;
    
    
}
.hotelDetailImg1{
    display: flex;
    /*flex-wrap: wrap;*/
    flex-direction: row;
    margin: 10px 10px 10px 20px;
    width: 800px;
}
.hotelDetailImg2{
    display: flex;
    /*flex-wrap: wrap;*/
    flex-direction: row;
    margin: 10px 10px 10px 20px;
    width: 800px;
}
.hotelDetailImg3{
    display: flex;
    /*flex-wrap: wrap;*/
    flex-direction: row;
    margin: 10px 10px 10px 20px;
    width: 800px;
}
.detailImg{
    border: 0;
}

.resPoss{
    color:green;
}
.resImposs{
    color:red;
}
h2{
    color: rgb(115, 90, 85);
}
.main_bottom>div{
    border-radius:10px;
    min-height:50px;
    padding:50px;
    
}

#title {font-size: 25px; font-weight: bold;}

/* 여기서부터 확인*/
#btnconfirm {background-color: #EBE7E3; font-size: 15px; border: 1px solid #D4D4D4 ; height: 40px; padding: 10px 20px; margin-right: 5px; }
.btncollapse {background-color: white; font-size: 15px; border: none ; height: 40px; padding: 10px 20px; margin-right: 5px; }
.btnname {background-color: #EBE7E3; font-size: 15px; border: 1px solid #D4D4D4 ; width: 85px; height: 40px; padding: 7px;  pointer-events : none;}
.btnlarge {background-color: #EBE7E3; font-size: 15px; border: 1px solid #D4D4D4 ; width: 170px; height: 40px; padding: 7px;  pointer-events : none;}
.btnbrown {background-color: #634C46; color: white; font-size: 15px; border: 1px solid #D4D4D4 ; width: 160px; height: 40px; padding: 7px; margin-left: 6px;}

.hotel_content td {padding-bottom: 7px;}
.form-controller input {width: 100%;}
.add_content { 
    display: inline-block;
    width: 100%;
    min-height: 150px;
    padding: 20px;
    height: 100%;
    }
.add_content>input{ margin-right: 10px;}
.hotel_content { width: 100%;}
.page_content label { margin-left: 10px; margin-right: 15px; }
.sminput {width: 220px;}
#room_list {
    height: 70px;
    margin-bottom: 11px;
    display: flex;
    justify-content: space-between;
    align-items: center;
}
#rdetail { 
    margin-bottom: 11px;
    height: auto;
    padding-top: 10px;
    box-sizing: border-box;
    display: flex;
    flex-direction:colum;
    align-items: center;
    justify-content: center;
}

/* 지도 */
.box {
    width: 1200px;            
    height: 400px;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    padding: 10px 100px 0 0 0;
    margin: 40px 10px 10px 10px;
}

.map {
    width: 600px;
    height: 400px;

    margin: 30px;
    
}
.revBox{
    width: 1200px;            
    
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    
    margin: 5px 5px 5px 5px;
}
.rev{
    width: 200px;
    height: auto;
    margin: 20px 10px 0px 0px;
}
.revText{
    width: 1200px;
    height: auto;

    margin: 10px 10px 0 0; 
}

.story {
    width: 600px;
    height: 400px;
    margin: 40px;
}



.story > h2 {
    
    margin: 20px 0px 0px 0px;
}

.story > h3 {
    
    margin-top: 5px;

}
</style>
</head>
<body>
	<div class="wrap">
        <%@ include file="/views/common/header.jsp"%>


        <section id="main_content">
           
            <!-- main_top임시 지움  -->
           
           
            <div class="page_content" style="margin-bottom: 150px">
                <div class="mytitle">
                
            </div>
            
            <div class="hotelPictures">
                <img class="hotelImg" src="../../resources/images/hotel_thumbnail1.jpg" alt="호텔 대표이미지1">
                <div class="hotelDetailImg">
                    <div class="hotelDetailImg1">
                
                
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>

                        
                    </div>
                    <div class="hotelDetailImg2">
                    
                    
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>

                    </div>
                    <div class="hotelDetailImg3">
                    
                    
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>
                        <button class="detailImg" onclick="expandImg();"><img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; padding-right: 10px;"></button>

                    </div>
                </div>
                
                
            </div>
            <!-- 지도 -->
            <div class="box">
                <div class="story">
                    
                    <p>
                    <!-- 조건추가해야됨 -->
                    <%for(Tag t : tag){ %>
                    	#<%=t.getTagName() %>
                    <%} %>
                    </p>
                    <br>
                    <h3><b><%=hotel.getHotelName() %></b></h3>
                    <br>
                    <p><%=hotel.getHotelAddress() +" " + hotel.getHotelDetailAdd()%> </p>
                    <br>
                    <p>
                        주차 및 Wi-Fi가 항상 무료로 제공되므로 언제든지 차량을 입출차할 수 있으며 연락을 취하실 수 있습니다. 제주 시내에 위치해 있어 현지 명소 및 관광지와 인접해 있습니다. 떠나기 전 유명한 성산일출봉을/를 방문해 보세요. 별 4개를 받은 본 고급 숙소는 투숙객에게 숙소 내 레스토랑 및 마사지을/를 제공합니다.
                    </p>
                </div>
                <div class="map" id="map">
                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3327.608454639534!2d126.4908994!3d33.4855434!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x350cfb08a26d8ea7%3A0xcac77d1eaf097827!2z7KCc7KO87Yq567OE7J6Q7LmY64-EIOygnOyjvOyLnCDsl7Drj5kgMjc0LTE2!5e0!3m2!1sko!2skr!4v1710484347417!5m2!1sko!2skr" width="600" height="350" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
                </div>
                
               
            </div>
            
            
            
            
                
                
                <div class="hotel_content" style="padding-left: 40px;">
                <span id="title">객실</span>
                	
                	<%for(Room r : rm){ %>
                    <div class="form-control" id="room_list" style="height: 200px; width: 1200px">
                        <div><img src="../../resources/images/x-square.png" style="width: 300px; height: 180px; padding-right: 10px;"></div>
                            <div style="text-align: left">
                                <b><%=r.getRoomName() %></b><br>
                                <%=r.getRoPrice() %>
                               
                            </div>
                            <div class="resPoss" >
                                <%if(r.getRoCount()!=0){ %>
                                예약가능
                                <%}else{ %>
                                예약불가능
                                <%} %>
                                
                            </div>
                            <div>
                                <button class="btn btncollapse" data-toggle="collapse" data-target="#room_detail"> 자세히 보기</button>
                                <br><button class="btn" id="btnconfirm " onclick="resRoom();"> 예약하기</button>
                            </div>
                    </div>
                    <div class="collapse" id="room_detail" >
                    	<div class="form-control" id="rdetail">
	                        <form>
	                            <div style="display:flex; margin: 15px 0px 0px 15px;">
	                                <div><img src="../../resources/images/x-square.png" style="width: 290px; height: 200px; padding-right: 10px;"></div>
	                                <div><img src="../../resources/images/x-square.png" style="width: 290px; height: 200px; padding-right: 10px;"></div>
	                                <div><img src="../../resources/images/x-square.png" style="width: 290px; height: 200px; padding-right: 10px;"></div>
	                                <div><img src="../../resources/images/x-square.png" style="width: 290px; height: 200px; padding-right: 10px;"></div>
	                            </div>
	                            
	                            <div style="text-align: left; margin: 15px 0px 0px 15px;">
	                                <b>객실 구성
	                                </b><br><br>
	                                
	                                <small>더블베드 1개</small><br>
	                                    
	                                <small>객실 크기: 25m²</small><br>    
	                                    
	                                <small>전망: 시티뷰</small><br>    
	                                    
	                                <small>금연</small><br>    
	                                    
	                                <small>욕조 및 샤워실</small><br>    
	                                    
	                                <small>무료 Wi-Fi</small><br>    <br><br>
	                                
	                            </div>
	    
	                            
	                        </form>
                        </div>

                    </div>
                    <%} %>
                </div>
                
                
                
            </div>
        
            <!-- 메인 부분  끝 -->

            <div class="main_bottom">
                


                <div>
                    <h3><b>편의시설 / 서비스</b></h3>
                    <br>
                    <li>주차장</li>
                    <li>무료 Wi-Fi (모든 객실)</li>
                    <li>24시간 프런트 데스크</li>
                    <li>익스프레스 체크인/체크아웃</li>
                    <li>여행 가방 보관 서비스</li>
                    <li>전기차 충전소</li>
                </div>
                <div>
                    <h3><b>정책</b></h3>
                    <br>
                    <li>19세 미만의 투숙객은 반드시 보호자와 동행해야 합니다.</li>
                    <li>객실을 10개 이상 예약하실 경우 다른 정책 및 추가 요금이 적용될 수 있습니다.</li>
                    <li>Minors under 19 years of age cannot stay unless accompanied by their parents.
                        (Available for guests over 19 years of age or older at the time of check-in)
                        City view from all rooms</li>
                    <li>객실을 5개 이상 예약하실 경우 다른 정책 및 추가 요금이 적용될 수 있습니다.</li>
                </div>
                <div>
                    <h3><b>리뷰</b></h3>
                    
                    <div class="revBox">
                        <div class="rev">
                            
                            <td class="form-control" required>
                                <span class="fa fa-star stars" id="star1"></span>
                                <span class="fa fa-star stars" id="star2"></span>
                                <span class="fa fa-star stars" id="star3"></span>
                                <span class="fa fa-star stars" id="star4"></span>
                                <span class="fa fa-star stars" id="star5"></span>
                
                                <script>
                                function add(ths,sno){
                                    for (var i=1;i<=5;i++){
                                        var cur=document.getElementById("star"+i)
                                        cur.className="fa fa-star"
                                    }
                
                                    for (var i=1;i<=sno;i++){
                                        var cur=document.getElementById("star"+i)
                                        if(cur.className=="fa fa-star"){
                                            cur.className="fa fa-star checked"
                                        }
                                    }
                                }
                                </script>
                                
                            
                                
                            
                            </td>
                            <div><b>Boram Kang</b></div>
                            <ul>
                                <li>가족 여행</li>
                                <li>스위트룸</li>
                            </ul>
                        </div>
                        <div class="revText" id="revText">
                            <td>아름다운 함덕 해수욕장이 가까워서 좋아요! 무엇보다도 유명한 맛집과 도보로 이동 가능 하단 것도 큰 장점입니다. 공항과 가까운 것은 말할 것도 없고요. 체크인은 대면으로 했지만 체크아웃은 fast checkout이라고 엘레베이터 앞에 키 반납하면 간단하게 끝나더라고요. 다음에 제주시 갈 일 있으면 또 묵을까 합니다. 공조시스템도 잘 작동하고, 화장실도 넓고 깨끗해서 기분 좋게 잘 쉬다 갑니다. 다음번엔 호텔 시설(라운지, 카페)를 좀 이용해볼까봐요~ 조식이 맛있다는 후기가 많아서 기대됩니다.</td>
                        </div>
                        
                       
                    </div>
                    <div class="revBox">
                        <div class="rev">
                            
                            <td class="form-control" required>
                                <span class="fa fa-star stars" id="star1"></span>
                                <span class="fa fa-star stars" id="star2"></span>
                                <span class="fa fa-star stars" id="star3"></span>
                                <span class="fa fa-star stars" id="star4"></span>
                                <span class="fa fa-star stars" id="star5"></span>
                
                                <script>
                                function add(ths,sno){
                                    for (var i=1;i<=5;i++){
                                        var cur=document.getElementById("star"+i)
                                        cur.className="fa fa-star"
                                    }
                
                                    for (var i=1;i<=sno;i++){
                                        var cur=document.getElementById("star"+i)
                                        if(cur.className=="fa fa-star"){
                                            cur.className="fa fa-star checked"
                                        }
                                    }
                                }
                                </script>
                                
                            
                                
                            
                            </td>
                            <div><b>Yeonghun Kim</b></div>
                            <ul>
                                <li>가족 여행</li>
                                <li>스위트룸</li>
                            </ul>
                        </div>
                        <div class="revText" id="revText">
                            <td>공항에서 접근성이 좋아요. 늦은 시간에 제주 오면 이용합니다. 그래도 차가 있어야 오갈 수 있어요. 대중교통으로는 불편합니다.
                                늦은 시간에 주차할 때에 대응이 느렸습니다. 조식 맛있습니다.</td>
                        </div>
                        
                       
                    </div>
                    
                </div>
            </div>
        </section>

         <%@ include file="/views/common/footer.jsp"%>
    </div>
</body>
</html>