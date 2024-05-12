<%@page import="backendweb.d01_dao.ProductDao"%>
<%@page import="backendweb.z01_vo.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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
                <div class="col-lg-6">
                    <nav class="header__menu">
                        <ul>
                            <li class="active"><a href="./main.jsp">Home</a></li>
                            <li><a href="./shop-grid.jsp">Shop</a></li>
                            <li><a href="./productRegistration.jsp">Register</a></li>
                            <li><a href="./Chat_mainPage.jsp">Chat</a></li>
                            <li><a id="admin_a" href="./adminDashBoard.jsp">Admin</a></li>
                        </ul>
                    </nav>
                </div>
                <div class="col-lg-2">
                    <div class="header__cart" id="shoppingCart">
                        <ul>
                            <li><a href="shopping-cart.jsp"><i class="fa fa-shopping-bag"></i> <span id="myShop_cnt">3</span></a></li>
                        </ul>
                        <div class="header__cart__price pointer"><span onclick="location.href='MemberDetail.jsp'" id="nick_span"></span></div>  
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
		<%
		ProductDao dao = new ProductDao();
		int myShop_cnt = 0;
		String nickname = mem.getNickname();
		myShop_cnt = dao.cntProductListByNickname(nickname);
		%>
	    var nickb = document.getElementById("nick_span")
	    var loginb = document.getElementById("login_a")
	    var myShopb = document.getElementById("myShop_cnt")
	    var nickname = "<%=nickname%>"
	    var myShop_cnt = <%=myShop_cnt%>
	    var shoppingCart = document.getElementById("shoppingCart")

		if(nickname == "null"){
			nickname=""
			loginb.innerText = "LogIn"
			loginb.href="./login.jsp"						
			shoppingCart.style.display = 'none'
		}
		else{
			loginb.innerText = "LogOut"
			loginb.href="./logout.jsp"
			shoppingCart.style.display = 'block'
		}
        nickb.innerText = nickname;
        myShopb.innerText = myShop_cnt;
        
        const admin_a = document.getElementById("admin_a");
        if(nickname == "운영자"){
        	admin_a.style.display = 'block';
        } else{
        	admin_a.style.display = 'none';
        }
</script>
</html>