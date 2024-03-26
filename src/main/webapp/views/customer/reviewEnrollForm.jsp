<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="com.galgoda.customer.model.vo.Reservation" %>
<%@ page import="com.galgoda.hotel.model.vo.Hotel" %>
<%@ page import="com.galgoda.common.model.vo.*" %>
    
 <%
 	Reservation r = (Reservation)request.getAttribute("r");
	int hotelNo = (int)request.getAttribute("hotelNo");
	int resNo = (int)request.getAttribute("resNo");
	String date_in = (String)request.getAttribute("date_in");
	String date_out = (String)request.getAttribute("date_out");
	int res_people = (int)request.getAttribute("res_people");
	int revNo = (int)request.getAttribute("revNo");
%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- 부트스트랩 기능을 위한 CDN 방식 연결 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
    <!-- ---------------------------------- -->
    <!-- 평점 관련 스타일 적용-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    
<style>
/*왼쪽 메뉴바 */
        .sideMenubar{
            width: 300px;
            background-color: rgb(235, 231, 227);
        }
        .sideMenubar a {
            color: inherit;
            text-decoration: none;
        }

        .page_content {

            width: 100%; 
            padding-top: 30px;
            padding-left: 30px;
            padding-right: 30px;
            /* border: 1px solid red; */

        }
        

        /* 리뷰 관리 페이지 */
        table{
            border-spacing: 10px;
            border-collapse: separate;
        }
        table th{
            width: 200px;
            height: 40px;
            background-color: rgb(235, 231, 227);
            border-radius: 5px;
            border: 1px solid lightgray;
            text-align: center;
            color: rgb(94, 94, 94);
        }

        table td{
            width:1000px;
            height: 30px;
            border-radius: 5px;
            
        }


        /* 평점 관련 스타일 */
        .checked {
            color: orange;
            }

        /* 클릭한 메뉴 색상 변경 */
        .review_btn{
            background-color: rgb(99, 76, 70);
            color: white;
        }
        /* 리뷰 등록/수정/삭제 버튼 스타일 */
        .rev_button{
			background-color: #ebe7e3 !important;
			border: none;
			color: black;
			padding: 10px 20px;
			border-radius: 5px;
			}	
    
        
</style> 
<!-- 평점 관련 스타일 적용-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<body>
<div class="wrap">
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="" data-toggle="collapse" data-target="#demo">예약관리</a>
                    </li>

                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">상세 조회</a>
                        </div>
                    </li>
                    <li>
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">예약 변경/취소</a>
                        </div>
                    </li>
                    
                    <li class="review_btn">
                        <div id="demo" class="collapse" style="margin-left: 30px;">
                            <a href="">리뷰 관리</a>
                        </div>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo2">위시리스트</a>
                    </li>
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">개인정보 수정</a>
                    </li>
                    
                    
                </ul>
            </div>

            <div class="page_content">
                <div class="review_page">
            
                    <div class="rev_header">
                        <h2>리뷰 관리 - <span style="font-size: smaller;">등록</span></h2>
                        <div style="border: 2px solid lightgray; min-width: 800px;"></div>
                    </div>
                    
                    <br>
					
                    <div class="rev_content1" style="width: 80%;">
                        <div>
                            <h5><%= r.getHotelName() %></h5>
                            <div class="res_content1_box" style="border: 1px solid lightgray; width: 100%; height: 150px; display: flex;">
                                <div><img src="<%= request.getContextPath()%>/<%=r.getImgPath() %>" style="width: 150px; height: 150px; padding:10px"></div>
                                <div>
                                    <br>
                                    <h6><%= r.getDateIn() %> - <%= r.getDateOut() %></h6>
	                                <h6>총 <%= r.getResPeople()  %>명</h6>
                                </div>
                     </div>
                     
                        

                        <br>
                        
                        <form action="<%= contextPath %>/insert.cu" method="post">
                        	<input type="hidden" name="hotelNo" value="<%=hotelNo %>">
                        	<input type="hidden" name="res_people" value="<%=res_people %>">      
                        	<input type="hidden" name="date_in" value="<%= date_in %>"> 
                        	<input type="hidden" name="date_out" value="<%= date_out %>"> 
                        	<input type="hidden" name="revRating" value="" id="rating">
                        	<input type="hidden" name="revNo" value="<%= revNo %>">
                        	<input type="hidden" name="resNo" value="<%= resNo %>">
                        	
                            <table>
                                <tr>
                                    <th>평점</th>
                                    <td class="form-control" required name="revRating">
                                        <span class="fa fa-star stars" id="star1" onclick="add(this,1)"></span>
                                        <span class="fa fa-star stars" id="star2" onclick="add(this,2)"></span>
                                        <span class="fa fa-star stars" id="star3" onclick="add(this,3)"></span>
                                        <span class="fa fa-star stars" id="star4" onclick="add(this,4)"></span>
                                        <span class="fa fa-star stars" id="star5" onclick="add(this,5)"></span>
                        
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
                                            
                                            // 아이디가 rating인 input요소객체에 value속성값으로 sno에 담겨있는 값 넣기               
                                            $("#rating").val(sno);                                     
                                        }
                                        </script>
                                    </td>
                                </tr>
                                <tr>
                                    <th>제목</th>
                                    <td><input type="text" class="form-control" required name="revTitle"></td>
                                </tr>
                                <tr>
                                    <th>내용</th>
                                    <td><textarea cols="30" rows="10" class="form-control" style="resize: none;" required name="revContent"></textarea></td>
                                </tr>
                                <tr>
                                    <th>사진</th>
                                    
                            	<td>
                                
                                <!-- 새로운 첨부파일 업로드 가능하기 때문에 그 때의 input type=file -->
                                <input type="file" class="form-control-file" name="upfile">
                            	</td>
                                    
                                </tr>
                                <tr>
                                    <td colspan="2" align="right">
                                        <button type="submit" class="btn" style="background-color: rgb(99,76,70); color: white; border: none;">리뷰 등록</button>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        
                        

                    
                    </div>

                    <br>
                    
                    


                                     
                </div>

            </div>


        </section>

        <%@ include file="/views/common/footer.jsp" %>
    </div>   
</body>
</html>