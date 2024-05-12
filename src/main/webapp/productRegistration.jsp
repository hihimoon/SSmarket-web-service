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
<title>SSMarket-상품등록</title>

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

<script src="productRegistraionScript.js"></script>
</head>
<body>

	<!-- Header Section Begin -->
	<jsp:include page="menubar.jsp"></jsp:include>

	<!-- Header Section End -->
	<section class="main spad">
		<div class="container">
			<div class="checkout__form productRegistration">
				<%-- <p class="stitle">${member.nickname}님 반가워요 :)</p> --%>
				<h4>상품등록하기</h4>
				<form method="post" action="productRegistrationAction.jsp">
					<!-- <div class="checkout__file">
						<p>
							상품 이미지 등록<span></span>
						</p>
						<input type="file" id="myFile" name="productimage">
					</div> -->
					<div class="checkout__form">
						<p>
							상품 상태<span>*</span>
						</p>
						<div class="form-check">

							<input class="form-check-input" type="radio"
								id="flexRadioDefault1" checked name="condition" value="중고제품"
								required> <label class="form-check-label"
								for="flexRadioDefault1"> 중고 제품 </label>

						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								id="flexRadioDefault2" name="condition" value="신규제품" required>
							<label class="form-check-label" for="flexRadioDefault2">
								신규 제품 </label>
						</div>
					</div>
					<div class="checkout__input">
						<p>
							카테고리/제목<span>*</span>
						</p>
						<select class="formStyle form-control" name="category" required>
							<option value="" disabled hidden selected>카테고리 선택</option>
							<option value="운동기구">운동기구</option>
							<option value="옷">옷</option>
							<option value="신발">신발</option>
							<option value="전자기기">전자기기</option>
						</select> <input type="text" class="form-control" placeholder="제목을 입력해 주세요"
							name="title" maxlength="50" required>
					</div>

					<div class="checkout__input">
						<p>
							가격 설정<span>*</span>
						</p>
						<input type="text" class="form-control" placeholder="가격을 입력해주세요"
							name="price" required onkeyup="inputNumberFormat(this);"
							maxlength="20">

						<!-- <input type="number" class="form-control" placeholder="가격을 입력해주세요"
							name="price" required  maxlength="20"> -->


					</div>

					<div class="checkout__input">
						<p>
							상세 내용 입력<span>*</span>
						</p>
						<textarea rows="50" cols="50" class="form-control"
							placeholder="상세내용을 입력해주세요" maxlength="4000" class="formStyle"
							name="pcontent" required></textarea>
					</div>



					<div class="checkout__form">
						<p>
							거래 유형<span>*</span>
						</p>
						<div class="form-check">

							<input class="form-check-input" type="radio"
								id="flexRadioDefault1" checked name="transactionmethod"
								value="직거래" required> <label class="form-check-label"
								for="flexRadioDefault1"> 직거래 </label>

						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio"
								id="flexRadioDefault2" name="transactionmethod" value="택배거래"
								required> <label class="form-check-label"
								for="flexRadioDefault2"> 택배거래 </label>
						</div>
					</div>

					<div class="checkout__input">
						<p>
							거래할 동네<span>*</span>
						</p>
						<select class="formStyle form-control" name="location" required>
							<option value="${member.location1}" selected>${member.location1}</option>
							<option value="${member.location2}">${member.location2}</option>
						</select>
					</div>



					<div class="checkout__input">
						<p>
							거래 희망 장소<span></span>
						</p>
						<input type="text" class="formStyle form-control"
							placeholder="거래 희망 장소를 입력해주세요" name="transactionlocation">
					</div>





					<input type="submit" class="site-btn" value="상품등록하기"></input>
				</form>
			</div>
		</div>
	</section>
</body>

</html>
