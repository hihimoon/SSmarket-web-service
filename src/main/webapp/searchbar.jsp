<%-- <%@page import="backendweb.z01_vo.Member"%> --%>


<%@page import="backendweb.d01_dao.ProductDao"
	import="backendweb.z01_vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


 --%>
<html>
<%-- <%
Member mem = (Member)session.getAttribute("member");	
if (mem == null){
	mem = new Member();
}
%> --%>




<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">

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
<link rel="stylesheet" href="css/style3.css" type="text/css">
</head>
<%
/* String str = request.getParameter("str"); if(str == null || str.trim().equals("")){ str = "0"; }  */

String category = request.getParameter("category");
if (category == null)
	category = "";

String title = request.getParameter("title");
if (title == null || title.trim().equals(""))
	title = "";

ProductDao dao = new ProductDao();

request.setAttribute("productList", dao.getProductListBySearch(new Product(category, title)));
%>
<body>
	<!-- Search Section Begin -->
	<section class="hero">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="hero__search">
						<div class="hero__search__form">
							<form action="shop-grid.jsp">

								<div class="filter__sort">

									<select name="category">
										<option value="" <%if (category.equals("")) {%> selected <%}%>>전체검색</option>
										<option value="신발" <%if (category.equals("신발")) {%> selected
											<%}%>>신발</option>
										<option value="운동기구" <%if (category.equals("운동기구")) {%>
											selected <%}%>>운동기구</option>
										<option value="옷" <%if (category.equals("옷")) {%> selected
											<%}%>>옷</option>
										<option value="전자기기" <%if (category.equals("전자기기")) {%>
											selected <%}%>>전자기기</option>
									</select>

								</div>
									
									<input type="text" placeholder="검색어를 입력해주세요" name="title"
									value="${param.title}">
								<button type="submit" class="site-btn">검색</button>


							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Search Section End -->
</body>
<script>
	  <%--   var nickb = document.getElementById("nick_span")
	    var loginb = document.getElementById("login_a")
	    var nickname = "<%=mem.getNickname()%>"
		if(nickname == "null"){
			nickname=""
			
		}
		else{
			loginb.innerText = "LogOut"
			loginb.href="./logout.jsp"
		}
        nickb.innerText = nickname;		 --%>
</script>
</html>