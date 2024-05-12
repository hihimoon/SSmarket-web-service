<%@page import="backendweb.d01_dao.ProductDao"
	import="backendweb.z01_vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SSMarket</title>

<!-- Google Font -->
<link
	href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
	rel="stylesheet">

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
	<div class="jumbotron text-center">
		<h2 data-toggle="modal" data-target="#exampleModalCenter">중고상품
			리스트</h2>

	</div>
	<%
	ProductDao dao = new ProductDao();
	/* 	request.setAttribute("productList", dao.getProductList(title,price));
		
		
		
		
		List<Product> plist = dao.getEmpList(new Emp(ename, job, deptno)); */
	%>
	<script type="text/javascript">
		$(document).ready(function() {

		});
	</script>
	<div class="container">

		<table class="table table-hover table-striped">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<col width="20%">
			<thead>

				<tr class="table-success text-center">
					<th>사원번호</th>
					<th>사원명</th>
					<th>직책</th>
					<th>급여</th>
					<th>부서번호</th>
				</tr>
			</thead>
			<tbody>
				<%
				for (Product prod : dao.getProductList(new Product())) {
				%>
					<td><%=prod.getTitle()%></td>
					<td><%=prod.getPrice()%></td>
				</tr>
				<%
				}
				%>
			</tbody>
		</table>

	</div>
</body>

</html>