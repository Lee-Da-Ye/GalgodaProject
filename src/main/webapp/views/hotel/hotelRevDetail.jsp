<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="com.galgoda.customer.model.vo.Review" %> 
<%@ page import="java.util.List" %> 
<%@ page import="com.galgoda.common.model.vo.Attachment" %>   

    
<%
	
	Review r = (Review)request.getAttribute("r");
	List<Attachment> alist = (List<Attachment>)request.getAttribute("alist");

	


%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


        /* 메인컨텐츠  */
        #title1 {font-size: 30px; font-weight: bold;  color: rgb(115, 90, 75); }
        #title2 {font-size: 25px; font-weight: bold;  color: rgb(115, 90, 75);}
        #title3 {font-size: 20px; font-weight: bold; }
        #btnbrown {background-color: #634C46; color: white; font-size: 15px; border: 1px solid #D4D4D4 ;  height: 40px; padding: 7px; margin-left: 6px;}
        #btnconfirm {background-color: #EBE7E3; font-size: 15px; border: 1px solid #D4D4D4 ; width: 85px; height: 40px; padding: 7px;  }
        th{background-color: gainsboro; }
        th, td {
             text-align: center;
                }
        /* 첨부파일 style */
        #img_content{
            width: 500px;
            height: 300px;
            margin: auto;
        }
        .carousel-item img{
            width: 500px;
            height: 300px;
        }


</style>
</head>
<body>
 <div class="wrap">
       
        <%@ include file="/views/common/header.jsp" %>


        <section class="main_content">
            
            <!-- 사이드 메뉴바 영역 -->
            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li >
                        <h3 style="margin-left: 10px; margin-right: 30px; margin-top: 10px; border-bottom: 1px solid black;">마이페이지</h3>
                    </li>
                    
                    <li>
                        <a class="nav-link " style="color: white; background-color: rgb(115, 90, 75);" href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                    <li > <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="<%= contextPath %>/hotelinsertForm.ho">호텔등록</a></div> </li> 
                    <li > <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="<%= contextPath %>/hotelupdateForm.ho">호텔 정보 수정</a></div> </li>  
                    <li > <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="<%= contextPath%>/roominsertForm.ho">객실등록</a></div> </li>  
                    <li> <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="<%= contextPath %>/roomUpdateForm.ho">객실수정</a></div> </li>  
                    <li style="background-color: #BFB4B0;"> <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="<%= contextPath %>/revList.ho?page=1">리뷰 관리</a></div> </li>   
                    
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="<%= contextPath %>/resList.ho?page=1" >예약관리</a>
                    </li>
                 
                    <li>
                        <a class="nav-link" style="color: black; " href="<%=contextPath %>/personalInfo.ho" >담당자 정보 수정</a>
                    </li>
                        
                    
                    <li>
                         <a class="nav-link" style="color: black;" href="#" data-toggle="collapse" data-target="#demo4">고객센터</a>
                    </li>
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="<%=contextPath%>/list.no?page=1">공지사항</a></div> </li>   
                    <li> <div id="demo4" class="collapse" style="margin-left: 30px;"><a href="<%=contextPath%>/list.inq?page=1">문의사항</a></div> </li>   
                </ul>
            </div>

           
            <!-- 사이드 메뉴바 영역  끝-->

            <!-- 메인 부분 -->
            <div class="page_content" style="margin-bottom: 150px;">

                <span id="title1">호텔관리</span> <span id="title2"> - 리뷰관리</span>
                <div style="border : 1px solid lightgray; margin-bottom: 16px;"></div>
                
                <div class="hotel_content" style="padding-left: 20px; width: 80%;">
                    <span id="title3">리뷰 상세 조회</span>
                   
                    <table class="table "   style="margin-top: 12px;  text-align: center;">
                        <tr>
                            <th>No.</th><td><%= r.getRevNo() %></td>
                        </tr>
                        <tr>
                            <th>아이디</th><td><%= r.getUserId() %></td>
                        </tr>
                        <tr>
                            <th>예약번호</th><td><%= r.getResNo() %></td>
                        </tr>
                        <tr>
                            <th>작성일자</th><td><%= r.getRegistDate() %></td>
                        </tr>
                        <tr>
                            <th>별점</th><td><%= r.getRevRating() %></td>
                        </tr>
                        <tr>
                            <th>제목</th><td><%= r.getRevTitle() %></td>
                        </tr>
                        <tr >
                            <th style="vertical-align: middle;">내용</th>
                            <td style="vertical-align: middle; height: 200px;" >
                                <p style="white-space: pre;"><%= r.getRevContent() %></p>
                            </td>
                        </tr>
                        <tr>
                            <th style="vertical-align: middle;">첨부파일</th>
                            <td style="vertical-align: middle; height: 200px;">
                                <div id="img_content" class="carousel slide" data-ride="carousel">

                                    <!-- Indicators -->
                                    <ul class="carousel-indicators">
                                      <li data-target="#demo" data-slide-to="0" class="active"></li>
                                      <li data-target="#demo" data-slide-to="1"></li>
                                      <li data-target="#demo" data-slide-to="2"></li>
                                    </ul>
                                  
                                    <!-- The slideshow -->
                                    <div class="carousel-inner">
			                        <%
									    String fileNumbers = ""; // 모든 파일 번호를 저장할 변수
									%>
                                   <% boolean isFirst = true; %>
									<% for(Attachment a : alist){ %>
								     <% 
									        // 현재 파일의 파일 번호를 가져옴
									        String currentFileNumber = String.valueOf(a.getFileNo()) ; 
									        
										     if (isFirst) {
										            fileNumbers += currentFileNumber;
										            
										        } else {
										            fileNumbers += ", " + currentFileNumber;
										        }
									    %>
									    <div class="carousel-item <%= isFirst ? "active" : "" %>">
									        <img src="<%= a.getFilePath() %>" alt="" style="width:200px height">
									    </div>
									    <% isFirst = false; %>
									<% } %>
									
                                     
                                    </div>
                                  
                                    <!-- Left and right controls -->
                                    <a class="carousel-control-prev" href="#img_content" data-slide="prev">
                                      <span class="carousel-control-prev-icon"></span>
                                    </a>
                                    <a class="carousel-control-next" href="#img_content" data-slide="next">
                                      <span class="carousel-control-next-icon"></span>
                                    </a>
                                  
                                  </div>
                            </td>
                        </tr>
                       
                    </table>
	
					  <form action="<%= contextPath %>/reportReview.ho" method="post" onsubmit="reportRv();">
                    <div class="float-right" >
                    
                             <input type="hidden" name="revNo" value="<%= r.getRevNo() %>">
                             <input type="hidden" name="resNo" value="<%= r.getResNo() %>">
                             <input type="hidden" name="fileNo" value=" <%= fileNumbers %> ">
                             
                          
                    
                        <button class="btn  " id="btnbrown" type="button" data-toggle="modal" data-target="#myModal">사용자 신고하기</button>
                        <button class="btn " id="btnbrown" type="submit" >리뷰 신고하기</button>
                        
                        <br>
                        <div class="float-right" style="margin-top: 10px;">
                            <a class="btn " id="btnconfirm" type="button" href="<%= contextPath %>/revList.ho?page=1" >목록으로</a>
                        </div>
                    </div>
                    </form>
                    
                </div>
            </div>

            
            <script>
                function reportRv(){
                    if(confirm("리뷰를 신고하시겠습니까?")){
                        
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
                             <input type="hidden" name="type" value="Rev">
                                            
                            
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
                                    <textarea class="form-control" style="height: 100%; text-align: center;"  placeholder="사유를 입력하세요." name="repContent"  ></textarea>
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



        
            <!-- 메인 부분  끝 -->


        

        </section>

           <%@ include file="/views/common/footer.jsp" %>
    </div>   

</body>
</html>