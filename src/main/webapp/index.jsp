<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Calendar" %>
<%
	Date date = new Date();
	Calendar calendar = Calendar.getInstance();
	calendar.setTime(date);
	calendar.add(Calendar.DAY_OF_MONTH, 1);
	
	Date nextDay = calendar.getTime();
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	String today = sdf.format(date);
	String tomorrow = sdf.format(nextDay);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Galgoda</title>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>

	$(document).ready(function(){
	    // 페이지가 로딩될 때 서블릿 호출
	    $.ajax({
	        url: "mainPageHotelList.co", 
	        type: "GET", 
	        dataType: "json", 
	        success: function(response){
	         
	            // 받은 JSON 데이터를 화면에 표시
	            $.each(response, function(index, hotel){
	                var hotelName = hotel.hotelName;
	                var imgPath = hotel.imgPath;
	                
	                // 각 호텔 정보를 화면에 표시하는 코드 작성
	                var hotelElement = '<div class="mainpage_imgContent">';
	                hotelElement += '<div class="mainpage_hotelThumbnail">';
	                hotelElement += '<img class="mainpage_hotelImg" src="<%=request.getContextPath()%>/' + imgPath + '" alt="' + hotelName + '">';
	                hotelElement += '<div class="hotelNameOverlay">' + hotelName + '</div>'; // 호텔 이름 추가
	                hotelElement += '</div>';
	                hotelElement += '</div>';
	                
	             // 이미지를 추가할 위치에 이미지 엘리먼트 추가
	                $("#hotelImages").append(hotelElement);
	            });
	        },
	        error: function(xhr, status, error){
	            alert('인기 호텔 리스트 불러오기에 실패했습니다.');
	            console.error("서블릿 호출 실패: " + error);
	        }
	    });
	});




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
	                // 태그명 버튼 선택시 태그 리스트 출력하는 ajax
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
			                    $("#tagCheckboxes").html(value);
			                    $("#tagCheckboxes").show(); 
			                }
						}
						
					})
	            }
	        });
	    });
	    
	    function setSearchType(searchType) {
	        document.getElementById("searchType").value = searchType; // 호텔명/태그명 선택에 따른 값 설정
	        };
	        
        
  
	    
</script>

<style>
	
</style>
</head>
<body>
	<div class="wrap">
	
		<%@ include file="/views/common/header.jsp" %>
		
		<section class="mainpage_content">
            <div class="main_image"><img src="<%=contextPath%>/resources/images/mainPageImg.jpg" width="100%" alt="메인홈페이지 이미지"></div>
            <div class="main_top">
                <form id="searchForm" action="<%= contextPath %>/search.res" method="get">
                    <table class="main_searchBar">
                        <thead>
                            <tr>
                            	<td width="300px">
                                	<input type="hidden" id="searchType" name="searchType" value="hotelName"> <!-- 숨겨진 입력 필드로 검색 타입을 저장 -->
                                	<div class="d-flex search_btn">
                                    	<button type="button" class="btn btn-outline-primary flex-fill mr-1 hotelName_btn active" onclick="setSearchType('hotelName')">호텔명</button>
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
								                <input type="text" name="hotelName" id="hotelNameInput" class="form-control" style="text-align: center;" onclick="toggleCheckboxes()">
								            </div>
								        </div>
								        <div id="tagCheckboxes" class="position-absolute" style="display: none; top: -40px; left: 0; background-color: white; border: 1px solid #ced4da; border-radius: 0.25rem; padding: 5px; max-height: 76px; overflow-y: auto;">
								        </div>
								    </div>
								</td>
                                <td>
                                	<input type="date" name="checkInDate" class="form-control" value="<%= today %>" required>
                               	</td>
                                <td>
                                	<input type="date" name="checkOutDate" class="form-control" value="<%= tomorrow %>" required>
                               	</td>
                                <td></td>
                                <td>
                                	<input type="number" min="1" name="peopleCount" value="1" class="form-control" required>
                               	</td>
                                <td>
                                	<input type="number" min="1" name="roomCount" value="1" class="form-control" required>
                               	</td>
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
                    <h2 class="mainpage_h2" style="text-align : center;">인기 호텔</h2>
                    <div class="mainpage_imgContent" id="hotelImages">
                    </div>
                </div>
            </div>        
       </section>
	
		<%@ include file="/views/common/footer.jsp" %>
		
	</div>
</body>
</html>