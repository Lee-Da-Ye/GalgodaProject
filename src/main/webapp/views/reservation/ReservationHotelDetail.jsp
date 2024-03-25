<%@page import="com.galgoda.customer.model.vo.Reservation"%>
<%@page import="java.util.List"%>
<%@page import="com.galgoda.hotel.model.vo.Room"%>
<%@page import="com.galgoda.hotel.model.vo.Tag"%>
<%@page import="com.galgoda.hotel.model.vo.Hotel"%>
<%@page import="com.galgoda.customer.model.vo.Review"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Hotel hotel = (Hotel)request.getAttribute("hotel");
	String[] hoteltags = null;
	if(hotel.getTagNo()!=null){
		hoteltags = hotel.getTagNo().split(",");
	}
	List<Tag> tag =(List<Tag>)request.getAttribute("tag");
	List<Review> review = (List<Review>)request.getAttribute("review");
	List<Room> rm = (List<Room>)request.getAttribute("room");
	Reservation r = (Reservation)request.getAttribute("r");
			

%>    
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><%=hotel.getHotelName() %></title>       
    <!-- 평점 관련 스타일 적용-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script>

   <!-- 호텔명, 태그명 버튼 각각 클릭 시 활성화 -->
   
   $(document).ready(function() {
       // 호텔명 버튼이나 태그명 버튼이 클릭되었을 때의 이벤트 처리
       $(".hotelName_btn, .tagName_btn").click(function() {
           // 클릭된 버튼에만 'active' 클래스를 추가하고 다른 버튼에서는 'active' 클래스를 제거
           $(this).addClass("active").siblings().removeClass("active");
           
        	// 태그명 버튼이 선택되었을 때 체크박스를 보이도록 처리
           if ($(this).hasClass("tagName_btn")) {
               $("#tagCheckboxes").show();
           } else {
               $("#tagCheckboxes").hide();
           }
       });
   });

   
   $(document).ready(function() {
       // 호텔명, 태그명 버튼 각각 클릭 시 활성화
       $(".hotelName_btn, .tagName_btn").click(function() {
           // 클릭된 버튼에만 'active' 클래스를 추가하고 다른 버튼에서는 'active' 클래스를 제거
           $(this).addClass("active").siblings().removeClass("active");
           
           // 호텔명 버튼이 선택되었을 때 입력칸을 보이고, 태그 선택 창을 숨깁니다.
           if ($(this).hasClass("hotelName_btn")) {
               $("#hotelNameInputWrapper").show();
               $("#tagCheckboxes").hide();
           } 
           // 태그명 버튼이 선택되었을 때 태그 선택 창을 보이고, 입력칸을 숨깁니다.
           else {
               $("#hotelNameInputWrapper").hide();
               $.ajax({
					url: "mainPageTagList.co",
					type: "get",
					success: function(list) {
						let value = "";
		                if (list.length > 0) {
		                    for (let i = 0; i < list.length; i++) {
		                        value += "<label>" +
		                            "<input type='checkbox' name='tagCheckbox' value='" + list[i].tagNo + "'>" +
		                            list[i].tagName +
		                            "</label>";
		                    }
		                    $("#tagCheckboxes").html(value); // 수정: 태그 체크박스를 출력하는 부분을 이동
		                    $("#tagCheckboxes").show(); // 수정: 태그 체크박스를 보이도록 처리
		                }
					}
					
				})
           }
       });
   });
   
   function setSearchType(searchType) {
       document.getElementById("searchType").value = searchType; // 호텔명/태그명 선택에 따른 값 설정
       };
       
       $(function(){
		       /* 태그부분 */
		       	var taglist = '<%= r.getTagNo() %>';
		        var  v = taglist.split(",");
		                	
		        for(var j = 0; j<v.length; j++){
		                $('input:checkbox[name=tagCheckbox][value='+v[j]+']').prop("checked", true).parent().addClass('on');
		        } 
       })
 
   </script>
    
    
    
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
    width: 100%;
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
    padding:50px;
    
}

#title {font-size: 25px; font-weight: bold;}

/* 여기서부터 확인*/
#btnconfirm {background-color: #EBE7E3; font-size: 15px; border: 1px solid #D4D4D4 ; height: 40px; padding: 10px 20px; margin-right: 5px; }
#btncollapse {background-color: white; font-size: 15px; border: none ; height: 40px; padding: 10px 20px; margin-right: 5px; }
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
    height: 200px;
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
    width: 100%;            
    height: 400px;
    display: flex;
    flex-direction: row;
    align-items: center;
    justify-content: center;
    padding: 10px 100px 0 0 0;
    margin: 40px 10px 10px 10px;
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
           
            <!-- 검색바  -->
           	<div class="main_top">
			
				 <form id="searchForm" >
				                    <table class="main_searchBar">
				                        <thead>
				                            <tr>
				                                <td width="300px">
				                                	<input type="hidden" id="searchType" name="searchType" value=<%= r.getSearchType() %>> <!-- 숨겨진 입력 필드로 검색 타입을 저장 -->
				                                	<div class="d-flex search_btn">
				                                            <button type="button" class="btn btn-outline-primary flex-fill mr-1 hotelName_btn" onclick="setSearchType('hotelName')">호텔명</button>
				                                            <button type="button" class="btn btn-outline-primary flex-fill mr-1 tagName_btn" onclick="setSearchType('tagName')">태그명</button>
				                                    </div>
				                                </td>
				                                <td width="150px" style="text-align: center;">체크인</td>
				                                <td width="150px" style="text-align: center;">체크아웃</td>
				                                <td width="100px"></td>
				                                <td width="110px" align="center">인원수</td>
				                                <td width="110px" align="center">객실</td>
				                            </tr>
				                        </thead>
				                        <tbody>
				                            <tr> 
				                                <td>
												    <div class="position-relative">
												        <div id="hotelNameInputWrapper" style="display: block;">
												            <div class="iconInput">
												                <i class="bi bi-search"></i>
												                <input type="text" name="hotelName" id="hotelNameInput" class="form-control" style="text-align: center;" onclick="toggleCheckboxes()" value="<%= r.getHotelName() %>">
												            </div>
												        </div>
												        
												        <div id="tagCheckboxes" class="position-absolute" style="display: none; top: -40px; left: 0; background-color: white; border: 1px solid #ced4da; border-radius: 0.25rem; padding: 5px;">
												       
												        </div>
												    </div>
												</td>
				                                
				                                <td><input type="date" name="checkInDate" class="form-control" value="<%= r.getDateIn() %>"></td>
				                                <td><input type="date" name="checkOutDate" class="form-control" value="<%= r.getDateOut() %>"></td>
				                                <td></td>
				                                <td><input type="number" min="1" name="peopleCount" value="<%= r.getResPeople() %>" class="form-control"></td>
				                                <td><input type="number" min="1" name="roomCount" value="<%= r.getRoomCount() %>" class="form-control"></td>
				                                <td colspan="2" align="right">
									                <button type="submit" class="btn main_searchButton">검색하기</button>
									            </td>
				                            </tr>
				                            <tr>
				                                <td colspan="7" style="display: none;">
									                <div class="iconInput">
									                    <i class="bi bi-tags"></i>
									                    <input type="text" class="form-control" style="text-align: center;">
									                </div>
						           				</td>
				                                
				                            </tr>
				                        </tbody>
				                    </table>
				   </form>
				
			</div>
            <!--  main_top 검색바 end -->
           
            <div class="page_content" style="margin-bottom: 150px">
                <div class="mytitle">
            </div>
            
            <div class="hotelPictures">
                <img class="hotelImg" src="<%=contextPath %>/<%=hotel.getImgPath() %>" alt="호텔 대표이미지1">
                <div class="hotelDetailImg">
                	<!-- 첨부파일 불러와서 호텔넘버 일치하는 것들 뿌리기 -->
                    <div class="hotelDetailImg1">
                        <div class="detailImg" onclick="expandImg();">
                        	<img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; margin-right: 10px;">
                        </div>
                        <div class="detailImg" onclick="expandImg();">
                        	<img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; margin-right: 10px;">
                        </div>
                        <div class="detailImg" onclick="expandImg();">
                        	<img src="../../resources/images/x-square.png" style="width: 140px; height: 100px; margin-right: 10px;">
                        </div>                        
                    </div>
                    
                </div>
            </div>
            
            <!-- 지도 -->
            <div class="box">
                <div class="story">
                    
                    <p>
                    <%if(hotel.getTagNo()!=null){ %>
                    	<%for(Tag t : tag){ %>
	                    	<% for(String tagNo : hoteltags){%>
		                    	<%if(t.getTagNo() == Integer.parseInt(tagNo)){ %>
		                    	 #<%=t.getTagName() %>
		                    	<%} %>
	                    	<%} %>
                    	<%} %>
                    <%}else{ %>
                    	등록된 태그가 없습니다.
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
                
                <div id="map" style="width:500px;height:400px;"></div>
					<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=61dfee2be1e4a99d90ca31ae07ed8b56&libraries=services,clusterer,drawing"></script>

					<script>
					var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.450752, 126.540667), // 지도의 중심좌표
				        level: 4 // 지도의 확대 레벨
				    };  
					// 지도를 생성합니다    
					var map = new kakao.maps.Map(mapContainer, mapOption); 
					// 주소-좌표 변환 객체를 생성합니다
					var geocoder = new kakao.maps.services.Geocoder();
					// 검색할 주소
					var address = '<%=hotel.getHotelAddress()%> + " " + <%=hotel.getHotelDetailAdd()%>';
					// 주소로 좌표를 검색합니다
					geocoder.addressSearch(address, function(result, status) {
						// 정상적으로 검색이 완료됐으면 
					    if (status === kakao.maps.services.Status.OK) {
					        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
					    
					     // 결과값으로 받은 위치를 마커로 표시합니다
					        var marker = new kakao.maps.Marker({
					            map: map,
					            position: coords
					       	});
					     // 인포윈도우로 장소에 대한 설명을 표시합니다
					        var infowindow = new kakao.maps.InfoWindow({
					            content: '<div style="width:150px;text-align:center;padding:6px 0;"><%=hotel.getHotelName()%></div>'
					        });
					        infowindow.open(map, marker);

					        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
					        map.setCenter(coords);
					    } else {
					        // 주소 검색 실패 시 처리
					        console.log('주소 검색 실패');
					    }
					});

					

						
					</script>
            </div>
            
            
            
            <script>
        	
       		function resRoom(RoomNo){
       			location.href = "<%=contextPath%>/reservationDetail.res?hotelNo=<%=hotel.getHotelNo()%>&roomNo=" + RoomNo 
       					+ "&checkIn=<%=r.getDateIn()%>" + "&checkOut=<%=r.getDateOut()%>";
       		}
        	
        	</script>
                
                
                <div class="hotel_content">
                <span id="title">객실</span>
                	
                	<%for(Room room : rm){ %>
                    <div class="form-control" id="room_list">
                        <div><img src="<%=contextPath %>/<%=room.getImgPath() %>" style="width: 300px; height: 180px; padding-right: 10px;"></div>
                            <div style="text-align: left">
                                <b><%=room.getRoomName() %></b><br>
                                <%=room.getRoPrice() %>
                               
                            </div>
                            <%if(room.getRoCount()!=0){ %>
                            <div class="resPoss" >
                                예약가능
                            </div>
                            <%}else{ %>
                            <div class="resImposs">
                            	예약불가능
                            </div>
                            <%} %>
                            
                            <div>
                                <button class="btn" id="btncollapse" data-toggle="collapse" data-target="#room_detail<%=room.getRoomNo()%>"> 자세히 보기</button>
                                <br>
                                <button class="btn" id="btnconfirm" onclick="resRoom(<%=room.getRoomNo() %>);" > 예약하기</button>
                            </div>
                    </div>
                    <div class="collapse" id="room_detail<%=room.getRoomNo()%>" >
                    	<div class="form-control" id="rdetail">
	                        <form>
	                            <div style="display:flex; margin: 15px 0px 0px 15px;">
	                                <div>
	                                	<img src="../../resources/images/x-square.png" style="width: 290px; height: 200px; padding-right: 10px;">
	                                </div>
	                                
	                                <div>
	                                	<img src="../../resources/images/x-square.png" style="width: 290px; height: 200px; padding-right: 10px;">
	                                </div>
	                                
	                                <div>
	                                	<img src="../../resources/images/x-square.png" style="width: 290px; height: 200px; padding-right: 10px;">
	                                </div>
	                                
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
                    <!-- 객실div끝 -->
                </div>
                
            </div>
        
            <!-- 메인 부분  끝 -->

            <div class="main_bottom">
                <div style="min-height: 100px">
                    <h3><b>편의시설 / 서비스</b></h3>
                    <br>
                    <ul>
	                    <li>주차장</li>
	                    <li>무료 Wi-Fi (모든 객실)</li>
	                    <li>24시간 프런트 데스크</li>
	                    <li>익스프레스 체크인/체크아웃</li>
	                    <li>여행 가방 보관 서비스</li>
	                    <li>전기차 충전소</li>
                    </ul>
                </div>
                <div style="min-height: 100px">
                    <h3><b>정책</b></h3>
                    <br>
                    <ul>
	                    <li>19세 미만의 투숙객은 반드시 보호자와 동행해야 합니다.</li>
	                    <li>객실을 10개 이상 예약하실 경우 다른 정책 및 추가 요금이 적용될 수 있습니다.</li>
	                    <li>Minors under 19 years of age cannot stay unless accompanied by their parents.
	                        (Available for guests over 19 years of age or older at the time of check-in)
	                        City view from all rooms</li>
	                    <li>객실을 5개 이상 예약하실 경우 다른 정책 및 추가 요금이 적용될 수 있습니다.</li>
                    </ul>
                </div>
                <div>
                    <h3><b>리뷰</b></h3>
                    <%if(review!=null){ %>
	                    <%for(Review re : review){ %>
	                    <div class="revBox">
	                        <div class="rev">
	                            
	                            <p>
	                                <span class="fa fa-star stars" id="star1"></span>
	                                <span class="fa fa-star stars" id="star2"></span>
	                                <span class="fa fa-star stars" id="star3"></span>
	                                <span class="fa fa-star stars" id="star4"></span>
	                                <span class="fa fa-star stars" id="star5"></span>
	                            </p>
	                            
	                            <div><b><%=re.getUserId() %></b></div>
	                            <ul>
	                                <li><%=re.getModifyDate() %></li>
	                                
	                            </ul>
	                        </div>
	                        <div class="revText" id="revText">
	                        	<p><%=re.getRevTitle() %></p>
	                            <p><%=re.getRevContent() %></p>
	                        </div>                       
	                    </div>
	                    <%} %>
                    <%}else{ %>
                    <p>등록된 리뷰가 없습니다</p>
                    <%} %>
                    <!--  리뷰박스 끝  -->
                </div>
            </div>
        </section>
        
        
        

         <%@ include file="/views/common/footer.jsp"%>
    </div>
</body>
</html>