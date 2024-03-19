<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<%@ page import="com.galgoda.common.model.vo.PageInfo" %>    
<%@ page import="com.galgoda.customer.model.vo.Review" %>    
<%@ page import="java.util.List" %>  
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	List<Review> list = (List<Review>)request.getAttribute("list");
	


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
        
        /* 검색창 부분 */
          .under_search{
            width: 150px;
            height: 40px;
            display: flex;
            align-items: center;
            padding: 3px;
              }
        .search_form{ width: 100%; height: 100%; display: flex; }
        .search_form > input{ width: 80%; border: 1px solid gainsboro; ;}
        .search_form > button{width: 20%; height: 100%; }
        .search_form > button > img{ height: 70%; width: 100%; }


        /* 페이징 바 부분 */
       
        .page-link {
        color: #000; 
        background-color: #fff;
        border: 1px solid #ccc; 
        }

        .page-item.active .page-link {
        z-index: 1;
        color: white;
        font-weight:bold;
        background-color: rgb(115, 90, 75);;
        border-color: #ccc;
        
        }

        .page-link:focus, .page-link:hover {
        color: #000;
        background-color: #fafafa; 
        border-color: #ccc;
        }

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
                        <a class="nav-link " style="color: white; background-color: rgb(115, 90, 75);" href="" data-toggle="collapse" data-target="#demo">호텔관리</a>
                    </li>
                    <li > <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="">호텔등록</a></div> </li> 
                    <li > <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="">호텔 정보 수정</a></div> </li>  
                    <li > <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="">객실등록</a></div> </li>  
                    <li> <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="">객실수정</a></div> </li>  
                    <li style="background-color: #BFB4B0;"> <div id="demo" class="collapse show" style="margin-left: 30px;"><a href="">리뷰 관리</a></div> </li>   
                    
                    
                    <li>
                        <a class="nav-link" style="color: black;" href="#" >예약관리</a>
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

                <span id="title1">호텔관리</span> <span id="title2"> - 리뷰관리</span>
                <div style="border : 1px solid lightgray; margin-bottom: 16px;"></div>
                
                <div class="hotel_content" style="padding-left: 20px;">
                    <span id="title3">리뷰목록</span>
                   
                    <table class="table table-hover"  style="margin-top: 12px;">
                        <thead>
                        <tr class="table-active" align="center">
                            <th>No.</th>
                            <th>아이디</th>
                            <th>예약번호</th>
                            <th>작성일자</th>
                            <th>별점</th>
                            <th>제목</th>
                        </tr>
                        </thead>
                        <tbody>
                        
                        <% for(Review r : list){ %>
                        <tr align="center">
                            <td><%= r.getRevNo() %></td>
                            <td><%= r.getUserId() %></td>
                            <td><%= r.getResNo() %></td>
                            <td><%= r.getRegistDate() %></td>
                            <td><%= r.getRevRating() %></td>
                            <td><a href=""><%= r.getRevTitle() %></a></td>
                        </tr>
                        <% } %>
                        
                       
                        </tbody>
                    </table>

                   
                   
                    <table class="float-right" style="margin-top: 100px; margin-right: 20px;">
                        <tr >
                            <td style="vertical-align: top;">
                                <div class="under_search " >
                                    <form action="search.do" class="search_form ">
                                        <input  type="search"  name="keyword" placeholder="아이디">
                                        <button type="submit" ><img src="resources/images/search.png" ></button>
                                </form>
                                </div>
        
                            </td>
                            <td > 
                            <div style="margin-left: 7px;">
                                 <!--  페이징바 영역 -->
					                <ul class="pagination justify-content-center">
					
										
										<% if(pi.getCurrentPage() == 1) { %>
					                    <li class="page-item disabled"><a class="page-link" href="#"> &lt; </a></li>
					                 	<% } else { %>
					                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/revList.ho?page=<%=pi.getCurrentPage()-1%>"> &lt; </a></li>
					                    <% } %>
					                    
					                    
					                    <% for(int p= pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
						                    
						                    <% if(p == pi.getCurrentPage()){ %>
						                    <li class="page-item active"><a class="page-link" href="#"><%= p %></a></li>
						                    <% } else{ %>
						                    <li class="page-item"><a class="page-link" href="<%= contextPath %>/revList.ho?page=<%= p %>"> <%= p %></a></li>
						                    <% }  %>
					                    <% } %>
					                    
					                    <% if(pi.getCurrentPage() == pi.getMaxPage()) { %>
					                    <li class="page-item disabled"><a class="page-link" href="#"> &gt; </a></li>
					                    <% } else { %>
					                    <li class="page-item"><a class="page-link" href="<%= contextPath%>/revList.ho?page=<%=pi.getCurrentPage() + 1 %>"> &gt; </a></li>
					                    <% } %>
					                </ul>
                                </div>

                            </td>
                        </tr>
                    </table>
                  


                </div>
            </div>
        
            <!-- 메인 부분  끝 -->


        

        </section>

	<%@ include file="/views/common/footer.jsp"%>

    </div>   


</body>
</html>