<%@page import="backendweb.z01_vo.Product"%>
<%@page import="backendweb.z01_vo.Member"%>
<%@page import="backendweb.d01_dao.ProductDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>페이지 제목</title>

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
    <!-- Header Section Begin -->
	<jsp:include page="menubar.jsp"></jsp:include>
    <!-- Header Section End -->
<%
	Member mem = (Member)session.getAttribute("member");	
	if (mem == null){
		mem = new Member();
	}
	ProductDao dao = new ProductDao();
	String nickname = mem.getNickname();
	
%>
    <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-section set-bg" data-setbg="img/breadcrumb.jpg">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <div class="breadcrumb__text">
                        <h2>내 상품 목록</h2>
                        <div class="breadcrumb__option">
	                     <a href="">Home</a><span>Shop</span>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

    <!-- Shoping Cart Section Begin -->
    <section class="shoping-cart spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__table">
                        <table>
                            <thead>
                                <tr>
                                    <th class="shoping__product">제목</th>
                                    <th>가격(원)</th>
                                    <th>날짜</th>
                                    <th>지역</th>
                                    <th>날짜</th>
                                </tr>
                            </thead>
                            <script>var cnt = 0; </script>
                            <tbody>
                            <%
                            for (Product prod : dao.getProductListByNickname(nickname)) {
                            %>
                                <tr>
                                    <td class="shoping__cart__item">
                                        <img class="product_pic" src="<%=prod.getProductimage()%>" alt="">
                                        <h5><%=prod.getTitle()%></h5>
                                    </td>
                                    <td class="shoping__cart__price">
                                        <%=prod.getPrice()%>
                                    </td>
                                    <td class="shoping__cart__quantity">
                                         <h5 id=date_h5></h5>										
                                    </td>
                                    <td class="shoping__cart__total">
                                        <%=prod.getTransactionlocation()%>
                                    </td>
                                    <td class="shoping__cart__item__close">
                                        <span class="icon_close"></span>
                                    </td>
                                </tr>
                                <script>
	                           		var dateb = document.getElementById("date_h5")
	                           		cnt++
		                            dateb.setAttribute("id", "date_h5"+cnt)
	                            	dateb = document.getElementById("date_h5"+cnt)
		                            var date = "<%=prod.getWrittendate()%>"
		                            date = date.substr(0, 10);
		                            dateb.innerText = date;
                            	</script>    
                                <%}%>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-12">
                    <div class="shoping__cart__btns">
                        <a href="productRegistration.jsp" class="primary-btn cart-btn">물건 등록하기</a>
                        <a href="#" class="primary-btn cart-btn cart-btn-right"><span class="icon_loading"></span>
                            Upadate Cart</a>
                    </div>
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