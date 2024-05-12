<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>   
<!DOCTYPE html>
<%--


 --%>
<html>
<%
Member mem = (Member)session.getAttribute("member");	
if (mem == null){
	mem = new Member();
}
%>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	
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
</head>

<body>
	<!-- Header Section Begin -->
    <header class="header">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="header__logo">

                        <a href="./main.jsp"><img src="img/logo_2.png" alt=""></a>
                    </div>
                </div>
                <div class="col-lg-5">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./adminDashBoard.jsp">DashBoard</a></li>
                            <li><a href="./adminMember.jsp">회원관리</a></li>
                            <li><a href="./adminProduct.jsp">상품관리</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-3">
                    <div class="header__cart">
                        <div class="header__cart__price"><span id="nick_span"></span></div>  
                    </div>
                </div>
                <div class="col-lg-1">
                	<div class="header__login">
                		<a id="login_a" href="./login.jsp" class="primary-btn">Login</a>
                	</div>
                </div>
            </div>
        </div>
    </header>
    <!-- Header Section End -->
</body>
<script>
	    var nickb = document.getElementById("nick_span")
	    var loginb = document.getElementById("login_a")
	    var nickname = "<%=mem.getNickname()%>"
		if(nickname == "운영자"){
			loginb.innerText = "LogOut"
			loginb.href="./logout.jsp"
		}
		else{
			alert("운영자만 접속할 수 있습니다.");
			location.href="main.jsp";		
		}
        nickb.innerText = nickname;		
</script>
</html>