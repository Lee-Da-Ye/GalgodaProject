<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
   
<%@ page import="com.galgoda.customer.model.vo.Reservation" %>    

    
<%
	
	Reservation r = (Reservation)request.getAttribute("r");
	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 /* 메인컨텐츠  */
        #title1 {font-size: 30px; font-weight: bold;  color: rgb(115, 90, 75);}
        #title2 {font-size: 25px; font-weight: bold;  color: rgb(115, 90, 75);}
        #title3 {font-size: 20px; font-weight: bold; }
        #btnbrown {background-color: #634C46; color: white; font-size: 15px; border: 1px solid #D4D4D4 ;   height: 40px; padding: 8px; margin-right: 8px;}
        #btnconfirm {background-color: #EBE7E3; font-size: 15px; border: 1px solid #D4D4D4 ;  height: 40px; padding: 7px;  }
        .res_detail {display: flex; flex-direction: row; width: 80%;}
        caption {font-size: 17px; color: black; font-weight: bold;}
        table {border-bottom: 1px solid gainsboro; text-align: center;}


</style>
</head>
<body>

<div class="wrap">
       <%@ include file="/views/common/header.jsp"%>
       


        <section class="main_content">
            
            <!-- 사이드 메뉴바 영역 -->
            <div class="sideMenubar">
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
                        <a class="nav-link" style="color: white; background-color: rgb(115, 90, 75);" href="<%= contextPath %>/resList.ho?page=1" >예약관리</a>
                    </li>
                 
                    <li>
                        <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo3">담당자 정보 수정</a>
                    </li>
                        
                    
                    <li>
                         <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="">공지사항</a></div> </li>   
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="">문의사항</a></div> </li>   
                </ul>
            </div>

           
            <!-- 사이드 메뉴바 영역  끝-->

            <!-- 메인 부분 -->
            <div class="page_content" style="margin-bottom: 150px;">

                <span id="title1">호텔관리</span> <span id="title2"> - 예약관리</span>
                <div style="border : 1px solid lightgray; margin-bottom: 16px;"></div>
                
                <div class="hotel_content" style="padding-left: 20px;">
                    <span id="title3">예약 상세 페이지</span><br><br>
                   
                    <div class="res_detail">
                        <div class="detail_left" style="width: 50%; margin-right: 20px;">
                            <table class="table">
                                <caption style="caption-side: top;">예약정보</caption>
                                  <tr>
                                    <td>객실</td>
                                    <td><%= r.getRoName() %></td>
                                  </tr>
                                  <tr>
                                    <td>예약일</td>
                                    <td><%= r.getDateIn() %> - <%= r.getDateOut() %></td>
                                  </tr>
                                  <tr>
                                    <td>예약인원</td>
                                    <td><%= r.getResPeople() %>명</td>
                                  </tr> 
                                  <tr>
                                    <td>추가옵션</td>
                                    <td> <%= r.getOpName() %></td>
                                  </tr>  
                            </table>

                            <table class="table">
                                <caption style="caption-side: top;">예약자정보</caption>
                                  <tr>
                                    <td>예약자</td>
                                    <td><%= r.getResName() %></td>
                                  </tr>
                                  <tr>
                                    <td>연락처</td>
                                    <td><%= r.getResPhone() %></td>
                                  </tr>
                                  <tr>
                                    <td>이메일</td>
                                    <td><%= r.getResEmail() %></td>
                                  </tr> 
                                   
                            </table>
                        </div>

                        <div class="detail_right" style="width: 50%;">
                            <table class="table">
                                <caption style="caption-side: top;">결제정보</caption>
                                  <tr>
                                    <td>결제방식</td>
                                    <td><%= r.getPayMethod() %></td>
                                  </tr>
                                  <tr style="font-size: 30px;" >
                                    <td >결제금액</td>
                                    <td><%= r.getPay() %>원</td>
                                  </tr>
                                  
                            </table>
                        </div>

                    </div>

                       
                        <!-- 버튼 부분 -->
                        <div style="display: flex; justify-content: center; margin-top: 50px; width: 80%; ">
                        
                        <% if(r.getResStatus().equals("예약대기")){ %>
                            <!-- case1 : 대기예약일때 --> 
                           
                           
                                <a class="btn" id="btnbrown" type="button" onclick="confirmRes();" href="<%= contextPath %>/confirmRes.ho?no=<%=r.getResNo() %>">예약 승인</a>
                                <button class="btn" id="btnconfirm" type="button" onclick="cancleRes();">예약 취소</button>
                       	
                       
                        <% } else if (r.getResStatus().equals("예약확정")) { %>
                            
                            <!-- case2 : 확정예약일때 -->
                            
                               
                                <button class="btn " id="btnbrown" type="button" data-toggle="modal" data-target="#myModal" >사용자 신고하기</button>
                                <a class="btn " id="btnconfirm" type="button" href="<%= contextPath %>/resList.ho?page=1" >목록으로</a>
                       <% } else if (r.getResStatus().equals("예약취소")){ %>
                            <!-- case3 : 취소예약일때 -->
                             
                                <a class="btn " id="btnconfirm" type="button" href="<%= contextPath %>/resList.ho?page=1" >목록으로</button>
                            
                       <% } %>
                        </div>

                        <!-- 버튼부분 끝 -->

                        <script>
                            function confirmRes(){
                                if(confirm("해당 예약을 승인 하겠습니까?")){
                                    
                                    }
                            }
                            function cancleRes(){
                                if(confirm("해당 예약을 취소 하겠습니까?")){
                                    alert("취소 완료되었습니다.");
                                    }
                            }
                        </script>

                        <!-- The Modal -->
                        <div class="modal" id="myModal">
                            <div class="modal-dialog">
                            <div class="modal-content">
                            
                                <!-- Modal Header -->
                                <div class="modal-header" style="background-color:#F1C40F;">
                                <h4 class="modal-title" style="color: white;">사용자 신고하기</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                </div>
                                
                                <!-- Modal body -->
                                <form action="<%= contextPath %>/reportUser.ho" method="post" onsubmit="reportUser();">
                                    <table class="table " align="center" >
                                     
                                        <input type="hidden" name="userNo" value="<%= r.getUserNo() %>">
                                        <input type="hidden" name="resNo" value="<%= r.getResNo() %>">
                                        
                                        <tr>
                                            <th>아이디</th><td><%= r.getUserId() %></td>
                                        </tr>
                                        <tr>
                                            <th>예약번호</th><td><%= r.getResNo() %></td>
                                        </tr>
                                        <tr>
                                            <th>신고사유</th>
                                            <td>
                                                <select class="form-control" name="reportReason">
                                                    <option value="욕설/폭언">욕설/폭언</option>
                                                    <option value="음란">음란</option>
                                                    <option value="허위사실">허위사실</option>
                                                    <option value="기물파손" >기물파손</option>
                                                    <option value="흡연">흡연</option>
                                                    <option value="기타" selected>기타</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th style="vertical-align: middle;">신고내용</th>
                                            <td style="vertical-align: middle; height: 200px;" >
                                                <textarea class="form-control" style="height: 100%; text-align: center;"  placeholder="사유를 입력하세요." name="repContent" ></textarea>
                                            </td>
                                        </tr>
                                    </table>
                                
                                <!-- Modal footer -->
                                <div class="modal-footer">
                                    <button class="btn" id="btnbrown" type="submit"  >사용자 신고하기</button>
                                </div>
                                </form>

                                <script>
                                    function reportUser(){
                                        
                                        if(confirm("사용자를 신고하시겠습니까?")){
                                        	
                                        }
                                           
                                        
                                    }
                                </script>
                            </div>
                            </div>
                        </div>
                        <!-- 모달 끝 -->
                                

                            </div>
                        </div>
                    
                        <!-- 메인 부분  끝 -->


        

        </section>


 				<%@ include file="/views/common/footer.jsp"%>
    </div>   

</body>
</html>