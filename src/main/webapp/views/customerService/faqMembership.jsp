<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	/* 자주묻는질문페이지 스타일 */

	.content_category {
        padding-top: 50px;
    }

    .content_category ul {
        display: flex;
        justify-content: space-around;
    }

    .content_category li {
        color: lightgray;
        text-decoration-line: none;
        list-style-type: none;
    }

    .page_content a:hover {
        color: black;
        text-decoration: none;
        cursor: pointer;
    }
    .table pre {
        color: rgb(115, 90, 75);
        font-size: 30px;
        padding-top: 5px;
    }
    
    .faq_list {
        border-top: 2px solid lightgray;
        border-bottom: 2px solid lightgray;
        margin-bottom: 20px;
    }

    .faq_question {
        font-size: 20px; 
        padding-top: 15px;
    }
    
    .faq_answer{
        font-size: 15px;
        padding-top: 15px;
        color: rgb(115, 90, 75);
    }
    .content_category a{
    	color: lightgrey;
    }
    .sideMenubar_head {
            width: 80%;
            margin-left: 10px;
            margin-right: 50px;
            margin-top: 10px;
            border-bottom: 1px solid gray;
    }
</style>
</head>
<body>
    <div class="wrap">
        
        <%@ include file="/views/common/header.jsp" %>

        <!-- section start -->
        <section class="main_content">

            <div class="sideMenubar">
                <ul class="nav flex-column">
                    <li>
                        <h3 class="sideMenubar_head">고객센터</h3>
                    </li>

                    <li>
                        <a class="nav-link" href="<%= contextPath %>/list.no?page=1">공지사항</a>
                    </li>

                    <li style="background-color: rgb(115, 90, 75);">
                        <a class="nav-link" style="color: white;" href="<%= contextPath %>/hotel.faq">자주 묻는 질문</a>
                    </li>

                    <li>
                        <a class="nav-link" href="#aaa" data-toggle="collapse">1:1문의</a>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/enrollForm.inq">문의하기</a>
                        </div>
                    </li>
                    <li>
                        <div class="collapse" id="aaa" style="margin-left: 30px;">
                            <a href="<%= contextPath %>/list.inq?page=?">문의내역</a>
                        </div>
                    </li>


                </ul>
            </div>

            <div class="page_content">
                <h2 class="contentName">자주 묻는 질문</h2>
                <div style="margin-top: 10px; border: 2px solid lightgray;"></div>

                <div class="content_category">
                    <ul>
                        <li align="center">
                            <a href="<%= contextPath %>/hotel.faq">
                                <img src="resources/images/hotelicon4.png" style="width: 45px; height: 40px;"><br>
                                HOTEL<br>GALGODA
                            </a>
                        </li>
                        <li align="center">
                            <a href="<%= contextPath %>/user.faq">
                                <img src="resources/images/usericon2.png" style="width: 45px; height: 40px;"><br>
                                USER
                            </a>
                        </li>
                        <li align="center">
                            <a href="<%= contextPath %>/credit.faq">
                                <img src="resources/images/crediticon.png" style="width: 40px; height: 40px;"><br>
                                CREDIT
                            </a>
                        </li>
                        <li align="center">
                            <a href="<%= contextPath %>/transport.faq">
                                <img src="resources/images/caricon.png" style="width: 45px; height: 40px;"><br>
                                    TRANSPORT
                            </a>
                        </li>
                        <li align="center">
                            <a href="<%= contextPath %>/membership.faq" style="color: black;">
                                <img src="resources/images/gifticon.png" style="width: 42px; height: 40px"><br>
                                MEMBERSHIP
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="faq_list" id="bbb">
                    <table class="table">
                        <tbody>
                            <tr>
                                <td style="width: 5%;">
                                    <pre>Q</pre>
                                </td>
                                <td style="width: 85%;"><p class="faq_question">질문1</p></td>
                                <td style="width: 10%;" align="right">
                                    <a href="#faq1" data-toggle="collapse" >
                                        <img src="resources/images/bottom.png" style="margin-top: 10px;">
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="3" class="collapse" id="faq1" data-parent="#bbb" style="background-color: rgb(253, 251, 249);">
                                    <p class="faq_answer">답1</p>
                                </td>
                            </tr>

                            
                        </tbody>
                    </table>
                </div>

            </div>


        </section>
        <!-- section end -->

		<%@ include file="/views/common/footer.jsp" %>
        
    </div>
</body>
</html>