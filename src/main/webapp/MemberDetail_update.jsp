<%@page import="backendweb.d01_dao.PreparedStmtDao_sj"%>
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
<html>
<head>
    <meta charset="UTF-8">
	<title>SSMarket_adimin</title>
	<%
	Member mem2 = (Member)session.getAttribute("member");
	if (mem2 == null){
		mem2 = new Member();
	}
	String phonenumber = mem2.getPhonenumber();
	String nickname = request.getParameter("nickname");
	String location1 = request.getParameter("location1");
	String location2 = request.getParameter("location2");
	String profile = request.getParameter("profile");
	String pwd = request.getParameter("pwd");
	
	mem2 = new Member(mem2.getPhonenumber(),nickname,profile,location1,location2, pwd);
	
	PreparedStmtDao_sj dao = new PreparedStmtDao_sj();
	int rs = 0;
	rs = dao.updateMember(mem2);
	%>
<script>
<%
	if (rs != 0) {
	    // 업데이트 성공
%>
	alert("수정 성공");
	window.location = "main.jsp";
<%
	} else {
	    // 업데이트 실패 처리
%>
	alert("업데이트 실패");
	history.back();
<%
	}
%>

</script>
</head>
<body>
</body>
	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</html>