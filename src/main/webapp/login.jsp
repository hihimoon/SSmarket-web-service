<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.d01_dao.PreparedStmtDao_sj"
    import="backendweb.z01_vo.Member"
    %>
    <!--    import="backendweb.z01_vo.*"  -->
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
    <title>로그인페이지</title>

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
    <link rel="stylesheet" href="css/style2.css" type="text/css">
</head>
<body>
<%
String phonenumber = request.getParameter("phoneNo");
String pwd = request.getParameter("pwd");
String logSuc ="";
if(phonenumber != null){
	PreparedStmtDao_sj dao = new PreparedStmtDao_sj();
	Member mem = dao.login(phonenumber,pwd);
	System.out.print(mem.getNickname());
	if(mem.getNickname() != null){
		logSuc = "Y";
		session.setAttribute("member", mem);   //로그인성공시 멤버 객체 세션으로
	}else{
		logSuc = "N";
	}
}
Member mem = (Member)session.getAttribute("member");
if (mem == null){
	mem = new Member();
}
%>
<script type="text/javascript">
	var nick = "<%=mem.getNickname()%>"
	var logSuc = "<%=logSuc%>"
	if(logSuc=="Y"){
		if (nick =="운영자"){
			alert("관리자페이지로 이동")
			location.href="adminDashBoard.jsp"
		}
		else{
			alert("로그인 성공")
			location.href="main.jsp";			
		}
	}
	if(logSuc=="N"){
		alert("로그인 실패\n다시 로그인 하세요!");
	}
</script>
    <!-- Header Section Begin -->
   	<jsp:include page="menubar.jsp"></jsp:include>
    <!-- Header Section End -->
	<section class="main spad">
		<div class="container">
			<div class ="checkout__form login">
	        	<h4>로그인</h4>
	            <form action="#">
	            	<div class="row cen">
	                        <div class="col-lg-8 col-md-6">
	                            <div class="row cen">
	                                <div class="new1">
	                                    <div class="checkout__input">
	                                        <p>휴대폰번호<span>*</span></p>
	                                        <input name="phoneNo" type="text" placeholder="휴대폰번호를 입력하세요">
	                                        <p>비밀번호<span>*</span></p>
	                                        <input name="pwd" type="text" placeholder="비밀번호를 입력하세요">
	                                    </div>
					                      <button type="submit" class="site-btn">로그인 시도</button>
										<h5>아이디가 없으신가요?<span onclick="location.href='sign_up0.jsp'">회원가입</span></h5>
	                                </div>
	                            </div>
                            </div>
                	</div>
                </form>                         	
            </div>
        </div>
    </section>
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
<script>
</script>
</html>