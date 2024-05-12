<%@page import="backendweb.z01_vo.Product"%>
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
    <script src="jquery-3.1.1.js"></script>
</head>
<body>
    <!-- Header Section Begin -->
	<jsp:include page="admin-menu.jsp"></jsp:include>
    <!-- Header Section End -->
<div class="jumbotron text-center">
	<div class="hero__text">
		<h2>상품관리</h2>
	</div>
</div>
<div class="container">
<%
	String pnoStr = request.getParameter("pno");
	if(pnoStr == null || pnoStr.trim().equals("")) pnoStr = "0";
	int pno = 0;
	pno = Integer.parseInt(pnoStr);
	String category = request.getParameter("category");
	if(category == null) category = "";
	String title = request.getParameter("title");
	if(title == null) title = "";
	Admin_Dao dao = new Admin_Dao();
	session.setAttribute("productList", dao.getProductList(new Product(pno, category, title)));
%>
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="pno" type="number" class="form-control mr-sm-2" placeholder="상품 번호" value="${param.pno}"/>
	    <select name="category" class="form-control mr-sm-2">
			<option value="" <%if (category.equals("")) {%> selected <%}%>>전체검색</option>
			<option value="신발" <%if (category.equals("신발")) {%> selected <%}%>>신발</option>
			<option value="운동기구" <%if (category.equals("운동기구")) {%> selected <%}%>>운동기구</option>
			<option value="옷" <%if (category.equals("옷")) {%> selected <%}%>>옷</option>
			<option value="전자기기" <%if (category.equals("전자기기")) {%> selected <%}%>>전자기기</option>
		</select>
	    <input name="title" type="text" class="form-control mr-sm-2" placeholder="제목" value="${param.title}"/>
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
	<p/>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="15%">
   	<col width="20%">
   	<col width="10%">
   	<col width="10%">
   	<col width="15%">
   	<col width="20%">
    <thead>
    
      <tr class="table-success text-center">
        <th>상품번호</th>
        <th>분류</th>
        <th>제목</th>
        <th>가격</th>
        <th>작성자</th>
        <th>작성일</th>
        <th></th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="product" items="${productList}">
    	<tr class="text-center">
    		<td>${product.pno}</td>
    		<td>${product.category}</td>
    		<td>${product.title}</td>
    		<td>${product.price}</td>
    		<td>${product.nickname}</td>
    		<td>${product.writtendate}</td>
    		<td><button class="btn btn-success" onclick="goPage('${product.pno}')">상세보기</button></td>
    	</tr>
    	</c:forEach>
    </tbody>
	</table>    
	<br><br><br>
</div>
<script type="text/javascript">
	$(document).ready( function(){
		var pno = "<%=pno%>";
        if (pno !== "0") {
            $("[name=pno]").val(pno);
        }
	})
	function goPage(pno){
		location.href="adminProductDetail.jsp?pno=" + pno;
	}
</script>
</body>
</html>