<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    import ="JangSunWoong.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String message=request.getParameter("message");

if(message==null){message="";}

Chat_SSMarketProjectDao dao=new Chat_SSMarketProjectDao();
if(!message.equals(""))
{
	dao.deleteChat(message);
}
%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >
<style>
	td{text-align:center;}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function(){

	});
</script>
</head>

<body>
<div class="jumbotron text-center">
  <h2>채팅삭제</h2>

</div>
<div class="container">
	<form id="frm01" class="form"  method="get">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input type="text" name="message" class="form-control mr-sm-2" placeholder="메세지" />
	    <button class="btn btn-info" type="submit">채팅삭제</button>
 	</nav>
	</form>
</div>
<a href="Chat_mainPage.jsp">메인화면으로 돌아가기</a>
</body>
</html>