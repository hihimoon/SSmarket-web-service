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
		<h2>회원관리</h2>
	</div>
</div>
<div class="container">
<%
	String memnoStr = request.getParameter("memno");
	if(memnoStr == null || memnoStr.trim().equals("")) memnoStr = "0";
	int memno = 0;
	memno = Integer.parseInt(memnoStr);
	String nickname = request.getParameter("nickname");
	if(nickname == null) nickname = "";
	Admin_Dao dao = new Admin_Dao();
	session.setAttribute("memberList", dao.getMemberList(new Member(memno, nickname)));
%>
	<form id="frm01" class="form"  method="post">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input name="memno" type="number" class="form-control mr-sm-2" placeholder="회원 번호" value="${param.memno}"/>
	    <input name="nickname" type="text" class="form-control mr-sm-2" placeholder="닉네임" value="${param.nickname}"/>
	    <button class="btn btn-info" type="submit">Search</button>
 	</nav>
	</form>
	<p/>
   <table class="table table-hover table-striped">
   	<col width="10%">
   	<col width="15%">
   	<col width="20%">
   	<col width="15%">
   	<col width="15%">
   	<col width="10%">
   	<col width="20%">
    <thead>
    
      <tr class="table-success text-center">
        <th>회원번호</th>
        <th>닉네임</th>
        <th>핸드폰 번호</th>
        <th>주소1</th>
        <th>주소2</th>
        <th>등급</th>
        <th></th>
      </tr>
    </thead>	
    <tbody>
    	<c:forEach var="member" items="${memberList}">
    	<tr class="text-center">
    		<td>${member.memno}</td>
    		<td>${member.nickname}</td>
    		<td>${member.phonenumber}</td>
    		<td>${member.location1}</td>
    		<td>${member.location2}</td>
    		<td>${member.grade}</td>
    		<td><button class="btn btn-success" onclick="goPage('${member.memno}')">상세보기</button></td>
    	</tr>
    	</c:forEach>
    </tbody>
	</table>
   	<br><br><br>
</div>
<script type="text/javascript">
	$(document).ready( function(){
		var memno = "<%=memno%>";
        if (memno !== "0") {
            $("[name=memno]").val(memno);
        }
	})
	function goPage(memno){
		location.href="adminMemberDetail.jsp?memno=" + memno;
	}
</script>
</body>
</html>