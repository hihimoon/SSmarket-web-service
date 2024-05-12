
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>






<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<%--Chat_mainPage.jsp --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="description" content="Ogani Template">
    <meta name="keywords" content="Ogani, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>채팅 메인 페이지</title>
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
    <style>
    <%--css로 화면 배치 --%>
    .leftTop{border:1px solid black; position:absolute; top:1%; left:1%; width:100px; height:100px;}
    .rightTop{border:1px solid black; position:absolute; top:1%; right:10%; width:100px; height:100px;}
    .rightTop2{ position:absolute; top:1%; right:1%; width:150px; height:90px;}
    .leftSide{border:1px solid black; position:absolute; top:15%; left:1%; width:400px; height:800px;}
    .rightSide{border:1px solid black; position:absolute; top:15%; right:10%;}
    .rightSideDown{border:1px solid black; position:absolute; top:80%; right:1%; max-width:1400px; width:600x; height:60px;}
    </style>
</head>
<body> 
<jsp:include page="menubar.jsp"></jsp:include>
<img onclick="goToMainPage()" src="https://edudonga.com/data/article/2012/1935588662_elm7kz2x.jpg" 
alt="쌍용마켓" height="100" width="100" class="leftTop">
<img onclick="clickMyPicture()" 
src="https://t3.gstatic.com/licensed-image?q=tbn:ANd9GcRoT6NNDUONDQmlthWrqIi_frTjsjQT4UZtsJsuxqxLiaFGNl5s3_pBIVxS6-VsFUP_" 
alt="나의프로필" height="100" width="100" class="rightTop">
<details id="detailed" class="rightTop2"><summary>나의 닉네임</summary>
<p>채팅알림<input type="checkbox" name="alarmForChat"></p><p>로그아웃</p><</details>
<iframe class="leftSide" height="600" width="1400" src=Chat_temporary.jsp></iframe>
<iframe class="rightSide" height="600" width="1200" src=Chat_ShowList.jsp></iframe>
<div class="rightSideDown"> <%--채팅입력창을 나타낸다. --%>
	<jsp:include page="Chat_SendingChat.jsp"/>
</div>

<a href="Chat_deletingChat.jsp">채팅삭제로 이동하기</a>
</body>


<script>
	function clickMyPicture()
	{	
		if(document.querySelector("#detailed").open==true)
		{
			document.querySelector("#detailed").open=false;
		}
		else
		{
			document.querySelector("#detailed").open=true;	
		}
	}
	
	function goToMainPage()
	{
		location.href="mainPage.jsp";
	}
</script>
</html>