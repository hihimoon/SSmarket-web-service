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
	String memnoStr = request.getParameter("memno");
	int memno = 0;
	
	if(memnoStr != null || memnoStr.trim().equals("")){
		memno = Integer.parseInt(memnoStr);
		Admin_Dao dao = new Admin_Dao();
		request.setAttribute("member", dao.getMember(memno));
	}
%>

<body>
    <!-- Header Section Begin -->
	<jsp:include page="admin-menu.jsp"></jsp:include>
    <!-- Header Section End -->
<div class="jumbotron text-center">
  <h2><b>${member.nickname}</b>님의 정보</h2>

</div>
<div class="container">
   <table class="table table-hover table-striped">
   	<col width="50%">
   	<col width="50%">

    <thead>
    </thead>	
    <tbody>
    	<tr class="text-center">
    		<th class="table-success text-center">회원번호</th>
    		<td>${member.memno}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">닉네임</th>
    		<td>${member.nickname}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">핸드폰 번호</th>
    		<td>${member.phonenumber}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">주소1</th>
    		<td>${member.location1}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">주소2</th>
    		<td>${member.location2}</td>
    	</tr>
    	<tr class="text-center">
	        <th class="table-success text-center">등급</th>
    		<td>${member.grade}</td>
    	</tr>
    	<tr>
    		<td colspan="2" class="text-right">
    			<button class="btn btn-info" onclick="location.href='adminMember.jsp'">회원관리</button> 
    			<button class="btn btn-success" data-toggle="modal" data-target="#exampleModalCenter" type="button">수정</button>
    			<button class="btn btn-danger" onclick="deleteMember(${member.memno})">삭제</button>
    		</td>
    	</tr>
    </tbody>
	</table>   
    
</div>
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">회원 등급 변경</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
		<form id="frm02" class="form"  method="post" action="adminUpdateMember.jsp">
	     <div class="row">
	      <div class="col">
	      	<input type="hidden" name="memno" value="${member.memno}">
	        <input type="text" class="form-control" placeholder="회원 등급 입력" name="grade">
	      </div>
	     </div>
	    </form> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary" onclick='$("#frm02").submit();'>Save changes</button>
      </div>
    </div>
  </div>
</div>
<script>
    function deleteMember(memno) {
        var confirmed = confirm("회원을 삭제하시겠습니까?");

        if (confirmed) {
            window.location.href = "adminDeleteMember.jsp?memno=" + memno;
        }
    }
</script>

</body>
</html>