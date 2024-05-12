<%@page import="backendweb.d01_dao.PreparedStmtDao_sj"%>
<%@page import="backendweb.d01_dao.Admin_Dao"%>
<%@page import="backendweb.z01_vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendeb.z01_vo.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>   
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	
	<title>SSMarket_adimin</title>
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap" rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="css/jquery-ui.min.css" type="text/css">
    <link rel="stylesheet" href="css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="css/style.css" type="text/css">
    <link rel="stylesheet" href="css/style2.css" type="text/css">
    <script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<script src="${path}/a00_com/bootstrap.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
</head>
<%
Member mem = (Member)session.getAttribute("member");
System.out.print(mem.getNickname());
PreparedStmtDao_sj dao = new PreparedStmtDao_sj();
mem = dao.login(mem.getPhonenumber(), mem.getPwd());
System.out.print("로그인하고:"+mem.getNickname());
if (mem == null){
	mem = new Member();
}


%>
<body>
    <!-- Header Section Begin -->
   	<jsp:include page="menubar.jsp"></jsp:include>
    <!-- Header Section End -->
    
    <!-- Page Preloder 
    <div id="preloder">
        <div class="loader"></div>
    </div>
-->

    <!-- Checkout Section Begin -->
    <section class="checkout spad">
        <div class="container">
            <div class="checkout__form">
	                <h4>회원 정보 수정</h4>
	                <form action="MemberDetail_update.jsp">
	                    <div class="row">
	                        <div class="col-lg-8 col-md-6">
	                            <div class="row">
	                                <div class="col-lg-6">
	                                    <div class="checkout__input">
	                                        <p>휴대폰 번호<span>*</span></p>
	                                        <input name="phonenumber" type="text" value="<%=mem.getPhonenumber()%>" readonly >
	                                        <p>비밀 번호<span>*</span></p>
	                                        <input name="pwd" type="text" value="<%=mem.getPwd()%>">
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="checkout__input">
	                                <p>닉네임<span>*</span></p>
	                                <input name="nickname" type="text" value="<%=mem.getNickname()%>">
	                            </div>
	                            <div class="checkout__input">
	                                <p>내 동네 설정<span>*</span></p>
	                                <input name="location1" type="text" value="<%=mem.getLocation1()%>" placeholder="내 동네1" class="checkout__input__add">
	                                <input name="location2" type="text" value="<%=mem.getLocation2()%>" placeholder="내 동네2(필수아님)">
	                            </div>
	                            <div class="checkout__input">
	                                <p>프로필사진<span>*</span></p>
	                                <input name="profile" type="text" value="<%=mem.getProfile()%>">
	                                <div class="profile_div">
	                                	<img class="profile_pic" alt="" src="img/profile/<%=mem.getProfile()%>">
	                                </div>
	                                <p>*이미지는 200X200 사이즈로 고정됩니다</p>
	                       
	                            </div>

                        </div>
                        <div class="col-lg-4 col-md-6">
                            <div class="checkout__order">
                                <h4>내 등급</h4>
                                <div class="checkout__order__products"><%=mem.getGrade()%> </div>
                                <button type="submit" class="site-btn">정보 수정</button>
                                
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
    <!-- Checkout Section End -->
</body>
	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</html>