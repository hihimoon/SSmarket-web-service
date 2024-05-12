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
	
	<title>SSMarket_admin</title>
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
    <script src="${path}/a00_com/jquery.min.js"></script>
	<script src="${path}/a00_com/popper.min.js"></script>
	<script src="${path}/a00_com/bootstrap.min.js"></script>
	<script src="${path}/a00_com/jquery-ui.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
</head>
<%
	String pnoStr = request.getParameter("pno");
	int pno = 0;
	
	if(pnoStr != null || pnoStr.trim().equals("")){
		pno = Integer.parseInt(pnoStr);
		Admin_Dao dao = new Admin_Dao();
		session.setAttribute("product", dao.getProduct(pno));
	}
%>

<body>
    <!-- Header Section Begin -->
	<jsp:include page="admin-menu.jsp"></jsp:include>
    <!-- Header Section End -->
<div class="jumbotron text-center">
  <h2><b>${product.title}</b> 상품 정보</h2>

</div>
<div class="container">
   <table class="table table-hover table-striped">
   	<col width="50%">
   	<col width="50%">

    <thead>
    </thead>	
    <tbody>
    	<tr class="text-center">
    		<th class="table-success text-center">상품번호</th>
    		<td>${product.pno}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">카테고리</th>
    		<td>${product.category}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">제목</th>
    		<td>${product.title}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">내용</th>
    		<td>${product.pcontent}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">가격</th>
    		<td>${product.price}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">상품상태</th>
    		<td>${product.condition}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">거래방법</th>
    		<td>${product.transactionmethod}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">거래장소</th>
    		<td>${product.transactionlocation}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">작성일자</th>
    		<td>${product.writtendate}</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="text-right">
    			<button class="btn btn-info" onclick="location.href='adminProduct.jsp'">상품관리</button> 
    			<button class="btn btn-danger" onclick="deleteProduct(${product.pno})">삭제</button>
    		</td>
    	</tr>
    </tbody>
	</table>   
    
</div>
<script>
    function deleteProduct(pno) {
        var confirmed = confirm("상품을 삭제하시겠습니까?");

        if (confirmed) {
            window.location.href = "adminDeleteProduct.jsp?pno=" + pno;
        }
    }
</script>

</body>
</html>