<%@page import="backendweb.z01_vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.d01_dao.*"
    %>
    <!--    import="backendweb.z01_vo.*"  -->
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
    <title>회원가입</title>

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
</head>
<body>
<%
String phonenumber = request.getParameter("phoneNo");
String pwd = request.getParameter("pwd");
//System.out.print(phonenumber);
String notNull;
if(phonenumber != null && !phonenumber.equals("") && pwd !=null && !pwd.equals("") ){
	notNull = "Y";
	session.setAttribute("phonenumber", phonenumber);
	session.setAttribute("pwd", pwd);
}
else{
	notNull = "N";
}
%>
<script type="text/javascript">
	function goNext() {
		var notNull = "<%=notNull%>"
		alert(notNull)
		if (notNull == "Y"){
			location.href='sign_up.jsp'
		}
		else if (notNull == "N"){
			alert("입력하지 않은 항목이있습니다")	
		}
	}
</script>
    <!-- Header Section Begin -->
   	<jsp:include page="menubar.jsp"></jsp:include>
    <!-- Header Section End -->
	<section class="main spad">
		<div class="container">
			<div class ="checkout__form login">
	        	<h4>쌍용마켓 회원가입</h4>
	            <form action="#">
	            	<div class="row cen">
	                        <div class="col-lg-8 col-md-6">
	                            <div class="row cen">
	                                <div class="new1">
	                                    <div class="checkout__input">
	                                        <p>휴대폰번호<span>*</span></p>
	                                        <input name="phoneNo" type="text" placeholder="입력하세요">
	                                        <p>비밀번호<span>*</span></p>
	                                        <input name="pwd" type="text" placeholder="입력하세요">
	       	                                <h5>입력된번호: ${param.phoneNo}</h5>
	                                    </div>
					                      <button type="submit" class="site-btn">휴대폰 인증하기</button>
	                                </div>
	                            </div>
	                            
                            </div> 
                	</div>
                </form>
            <div class="row">
            	<button onclick="goNext()" class="site_btn2 yoyo1 new4">다음 단계</button>
            </div>                                      	
            </div>
        </div>
    </section>
	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>