<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.galgoda.customer.model.vo.Reservation" %>
<%@ page import="com.galgoda.hotel.model.vo.Hotel" %>

<%@ page import="java.util.List" %>  

<%
	
	
	List<Hotel> list = (List<Hotel>)request.getAttribute("list");
	Reservation r = (Reservation)request.getAttribute("r");


%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- ---------------------------------- -->
    <!-- 아이콘 사용을 위한 연결-->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!---------------------------------------->
    <!-- 태그 선택창 뜨게 하는 연결 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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




 
 /* 검색바 관련 서식*/
        .main_top{
            padding-top: 3px;
            padding-bottom: 10px;
            border-bottom: 1px solid rgb(99, 76, 70);
            
        }
        .searchBar {
            height: 150px;
            width: 100%;
            margin: auto;
            margin-top: 10px;
        }
        .searchBar td{
            padding: 10px;
        }
        .searchBar input[type="number"] {
            width: 100%;
            text-align: center;
        }
        .searchButton{
            color: rgb(99, 76, 70);
            background-color: rgb(235, 231, 227);
            width: 230px;
        }
        
        .iconInput{
            position: relative;
        }
        .iconInput i {
            position: absolute;
            top: 5px;
            left: 10px;
        }
        i{
            color: rgb(115, 90, 85);
        }
        
        /*호텔 관련 영역 서식 */
		.main_content{ flex-direction: column;}
        
        /*정렬리스트 스타일*/
        #arraylist {
		    margin-bottom: 20px;
		    text-align: right;
		    height : 10%; /* 기본 값으로 변경 */
		    overflow: hidden; /* 내용이 넘치는 경우 숨김 처리 */
		}
        h2{
            color: rgb(115, 90, 85);
        }
        .main_bottom>div{
            border-radius:10px;
            min-height:10px;
            padding:10px;
            
        }
        .hotelSummaryBundle{
            display: flex;
            flex-direction: column;
            flex-wrap: nowrap;
            justify-content: center;
        }
        .hotelSummary {
            display:flex;
            margin: 10px;
            border: 1px solid lightgray;
            padding: 5px;
            position: relative;
            flex-direction: row;
            
        }
        .hotelImg{
            width: 240px;
            height: 230px;
        }
        /* 호텔 정보 스타일 */
        .hotelInfo{
            margin-left: 50px;
            cursor: pointer;
        }
        /* 태그 창 관련 스타일 */
        .tagList {
        display: none;
        column-count: 3; /* 여기에 원하는 열의 수를 지정하세요 */
        column-gap: 20px; /* 각 열 사이의 간격을 조정합니다 */
        } 

        /* 예약버튼 스타일 */
        .buttonColor{
            background-color: rgb(115, 90, 75); 
            color: white;
        }
        
        /* 위시리스트 하트 표시 관련 스타일 */

        .heartbox {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            top: 30px;
            left: 210px;
            z-index: 10;
        }

        svg {
            cursor: pointer;
            overflow: visible;
            width: 60px;
            margin: 20px
        }

        svg #heart {
            transform-origin: center;
            animation: animateHeartOut .3s linear forwards
        }

        svg #main-circ {
            transform-origin: 29.5px 29.5px
        }

        .checkbox {
            display: none
        }

        .checkbox:checked+label svg #heart {
            transform: scale(0.2);
            fill: #E2264D;
            animation: animateHeart .3s linear forwards .25s
        }

        .checkbox:checked+label svg #main-circ {
            transition: all 2s;
            animation: animateCircle .3s linear forwards;
            opacity: 1
        }

        .checkbox:checked+label svg #heartgroup1 {
            opacity: 1;
            transition: .1s all .3s
        }

        .checkbox:checked+label svg #heartgroup1 #heart1 {
            transform: scale(0) translate(0, -30px);
            transform-origin: 0 0 0;
            transition: .5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup1 #heart2 {
            transform: scale(0) translate(10px, -50px);
            transform-origin: 0 0 0;
            transition: 1.5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup2 {
            opacity: 1;
            transition: .1s all .3s
        }

        .checkbox:checked+label svg #heartgroup2 #heart1 {
            transform: scale(0) translate(30px, -15px);
            transform-origin: 0 0 0;
            transition: .5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup2 #heart2 {
            transform: scale(0) translate(60px, -15px);
            transform-origin: 0 0 0;
            transition: 1.5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup3 {
            opacity: 1;
            transition: .1s all .3s
        }

        .checkbox:checked+label svg #heartgroup3 #heart1 {
            transform: scale(0) translate(30px, 0px);
            transform-origin: 0 0 0;
            transition: .5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup3 #heart2 {
            transform: scale(0) translate(60px, 10px);
            transform-origin: 0 0 0;
            transition: 1.5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup4 {
            opacity: 1;
            transition: .1s all .3s
        }

        .checkbox:checked+label svg #heartgroup4 #heart1 {
            transform: scale(0) translate(30px, 15px);
            transform-origin: 0 0 0;
            transition: .5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup4 #heart2 {
            transform: scale(0) translate(40px, 50px);
            transform-origin: 0 0 0;
            transition: 1.5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup5 {
            opacity: 1;
            transition: .1s all .3s
        }

        .checkbox:checked+label svg #heartgroup5 #heart1 {
            transform: scale(0) translate(-10px, 20px);
            transform-origin: 0 0 0;
            transition: .5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup5 #heart2 {
            transform: scale(0) translate(-60px, 30px);
            transform-origin: 0 0 0;
            transition: 1.5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup6 {
            opacity: 1;
            transition: .1s all .3s
        }

        .checkbox:checked+label svg #heartgroup6 #heart1 {
            transform: scale(0) translate(-30px, 0px);
            transform-origin: 0 0 0;
            transition: .5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup6 #heart2 {
            transform: scale(0) translate(-60px, -5px);
            transform-origin: 0 0 0;
            transition: 1.5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup7 {
            opacity: 1;
            transition: .1s all .3s
        }

        .checkbox:checked+label svg #heartgroup7 #heart1 {
            transform: scale(0) translate(-30px, -15px);
            transform-origin: 0 0 0;
            transition: .5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup7 #heart2 {
            transform: scale(0) translate(-55px, -30px);
            transform-origin: 0 0 0;
            transition: 1.5s transform .3s
        }

        .checkbox:checked+label svg #heartgroup2 {
            opacity: 1;
            transition: .1s opacity .3s
        }

        .checkbox:checked+label svg #heartgroup3 {
            opacity: 1;
            transition: .1s opacity .3s
        }

        .checkbox:checked+label svg #heartgroup4 {
            opacity: 1;
            transition: .1s opacity .3s
        }

        .checkbox:checked+label svg #heartgroup5 {
            opacity: 1;
            transition: .1s opacity .3s
        }

        .checkbox:checked+label svg #heartgroup6 {
            opacity: 1;
            transition: .1s opacity .3s
        }

        .checkbox:checked+label svg #heartgroup7 {
            opacity: 1;
            transition: .1s opacity .3s
        }

        @keyframes animateCircle {
            40% {
                transform: scale(10);
                opacity: 1;
                fill: #DD4688
            }

            55% {
                transform: scale(11);
                opacity: 1;
                fill: #D46ABF
            }

            65% {
                transform: scale(12);
                opacity: 1;
                fill: #CC8EF5
            }

            75% {
                transform: scale(13);
                opacity: 1;
                fill: transparent;
                stroke: #CC8EF5;
                stroke-width: .5
            }

            85% {
                transform: scale(17);
                opacity: 1;
                fill: transparent;
                stroke: #CC8EF5;
                stroke-width: .2
            }

            95% {
                transform: scale(18);
                opacity: 1;
                fill: transparent;
                stroke: #CC8EF5;
                stroke-width: .1
            }

            100% {
                transform: scale(19);
                opacity: 1;
                fill: transparent;
                stroke: #CC8EF5;
                stroke-width: 0
            }
        }

        @keyframes animateHeart {
            0% {
                transform: scale(0.2)
            }

            40% {
                transform: scale(1.2)
            }

            100% {
                transform: scale(1)
            }
        }

        @keyframes animateHeartOut {
            0% {
                transform: scale(1.4)
            }

            100% {
                transform: scale(1)
            }
        }
        
        
      

</style>

   
	<script>
   			 var contextPath = "<%= request.getContextPath() %>";
	</script>
	<script src="your_script.js"></script>
		
		
 <script>
        $(document).ready(function(){
            $('.checkbox').change(function(){
                var id = $(this).attr('id');
                var heartSvg = $('#heart-svg' + id.substring(id.length - 1));
                if($(this).is(':checked')){
                    heartSvg.find('#heart').css('fill', '#E2264D');
                    // 다른 하트 관련 동작 추가
                } else {
                    heartSvg.find('#heart').css('fill', '#AAB8C2');
                    // 다른 하트 관련 동작 추가
                }
            });
        });
        
       
        
        /* 조회된 호텔 클릭시 폼 두개 합쳐서  제출 */
		       document.addEventListener("DOMContentLoaded", function() {
				    var hotelSummary = document.querySelector(".hotelInfo");
				
				    hotelSummary.addEventListener("click", function() {
				        var form1Data = new FormData(document.getElementById("searchForm"));
				        var form2Data = new FormData(document.getElementById("searchForm2"));
				        
				        // form2Data의 값을 form1Data에 병합
				        for (var [key, value] of form2Data.entries()) {
				            form1Data.append(key, value);
				        }
				
				        // form1Data를 폼으로 변환하여 전송
				        var combinedForm = document.createElement("form");
				        combinedForm.method = "GET"; // 또는 "GET" 설정
				        combinedForm.action = contextPath + "/resDetail.res"; // 전송할 대상 URL 설정
				        
				        // 폼에 폼 데이터 추가
				        for (var pair of form1Data.entries()) {
				            var input = document.createElement("input");
				            input.type = "hidden";
				            input.name = pair[0];
				            input.value = pair[1];
				            combinedForm.appendChild(input);
				        }
				
				        // document body에 폼 추가하여 제출
				        document.body.appendChild(combinedForm);
				        combinedForm.submit();
				    });
				});
        
        /* 폼 제출 부분 끝*/
    </script>
</head>
<body>

<div class="wrap">


         <%@ include file="/views/common/header.jsp"%>


		<section class="main_content">
		
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
			
			
			<div class="main_bottom">
			
				
				
				<div class="main">
					<div class="hotelSummaryBundle" >
					
					 <span id="arraylist" class="float-right" >
				        <select name="list">
				                        <option value="">평점순</option>
				                        <option value="">리뷰많은순</option>
				                        <option value="">인기순</option>
				        </select>
				 	</span>
					
						<% for(Hotel h : list){ %>
				            <div class="hotelSummary">
				                        <form  id="searchForm2" >
				                        <input type="hidden" name="selectHotelNo" value="<%= h.getHotelNo() %>">
				                        </form>
				                        
				                         <img class="hotelImg" src="<%= h.getImgPath() %>" alt="호텔 대표이미지1">
				    		
				    					<div class="hotelInfo">
				    						
				    						 <div style="padding-top: 15px;">
				                                    <h3><b><%= h.getHotelName() %></b><!--<a href="" class="btn btn-secondary buttonColor" align="right">예약</a>--></h3>
				                             </div>
				    						
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
				    						<%= h.getReviewCount() %>+
				    						 <br><br>
				    						 #제주 #동부 #휴양 #바다 #바다뷰 #성산일출봉 #가족여행
				    						  <br><br>
				                              <h4><%= h.getMinPrice() %>원 ~</h4>
				    						
				    					
				    					</div>                    
						
					
					
										<div class="heartbox"> 
				                                <input type="checkbox" class="checkbox" id="checkbox1" />
				                                <label for="checkbox1"> 
				                                    <svg id="heart-svg" viewBox="467 392 58 57" xmlns="http://www.w3.org/2000/svg">
				                                        <g id="Group" fill="none" fill-rule="evenodd" transform="translate(467 392)">
				                                            <path d="M29.144 20.773c-.063-.13-4.227-8.67-11.44-2.59C7.63 28.795 28.94 43.256 29.143 43.394c.204-.138 21.513-14.6 11.44-25.213-7.214-6.08-11.377 2.46-11.44 2.59z" id="heart" fill="#AAB8C2" />
				                                            <circle id="main-circ" fill="#E2264D" opacity="0" cx="29.5" cy="29.5" r="1.5" />
				                                            <g id="heartgroup7" opacity="0" transform="translate(7 6)">
				                                                <circle id="heart1" fill="#9CD8C3" cx="2" cy="6" r="2" />
				                                                <circle id="heart2" fill="#8CE8C3" cx="5" cy="2" r="2" />
				                                            </g>
				                                            <g id="heartgroup6" opacity="0" transform="translate(0 28)">
				                                                <circle id="heart1" fill="#CC8EF5" cx="2" cy="7" r="2" />
				                                                <circle id="heart2" fill="#91D2FA" cx="3" cy="2" r="2" />
				                                            </g>
				                                            <g id="heartgroup3" opacity="0" transform="translate(52 28)">
				                                                <circle id="heart2" fill="#9CD8C3" cx="2" cy="7" r="2" />
				                                                <circle id="heart1" fill="#8CE8C3" cx="4" cy="2" r="2" />
				                                            </g>
				                                            <g id="heartgroup2" opacity="0" transform="translate(44 6)">
				                                                <circle id="heart2" fill="#CC8EF5" cx="5" cy="6" r="2" />
				                                                <circle id="heart1" fill="#CC8EF5" cx="2" cy="2" r="2" />
				                                            </g>
				                                            <g id="heartgroup5" opacity="0" transform="translate(14 50)">
				                                                <circle id="heart1" fill="#91D2FA" cx="6" cy="5" r="2" />
				                                                <circle id="heart2" fill="#91D2FA" cx="2" cy="2" r="2" />
				                                            </g>
				                                            <g id="heartgroup4" opacity="0" transform="translate(35 50)">
				                                                <circle id="heart1" fill="#F48EA7" cx="6" cy="5" r="2" />
				                                                <circle id="heart2" fill="#F48EA7" cx="2" cy="2" r="2" />
				                                            </g>
				                                            <g id="heartgroup1" opacity="0" transform="translate(24)">
				                                                <circle id="heart1" fill="#9FC7FA" cx="2.5" cy="3" r="2" />
				                                                <circle id="heart2" fill="#9FC7FA" cx="7.5" cy="2" r="2" />
				                                            </g>
				                                        </g>
				                                    </svg> 
				                                </label>
				                                
				                            </div>
										
					
					
					
					  		</div>
				                        
				       <% } %>
					
					
					
					
					
					</div>
				</div>
				
				
				
				
				
			</div>
			
			
			
			
			
			
			
			
			
			
			
		
		</section>
       
        
        
          <%@ include file="/views/common/footer.jsp"%>
          
          
</div>
</body>
</html>