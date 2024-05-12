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
    <title>프로필설정</title>

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
String nickname = request.getParameter("nickname");
String pwd = request.getParameter("pwd");
String phonenumber = request.getParameter("phonenumber");
String src_loc = request.getParameter("src_loc");
String loc2 = request.getParameter("loc2");

//System.out.print(nickname);
String notNull;

if(nickname != null && !nickname.equals("") ){
	PreparedStmtDao_sj dao = new PreparedStmtDao_sj();
	notNull = "Y";
	int tmp = dao.newMember(new Member(phonenumber,nickname,src_loc,loc2, pwd));
}
else{
	notNull = "N";
}

%>
<script type="text/javascript">

	function goNext() {
		alert("메인화면으로 돌아갑니다")
		location.href='main.jsp'

	}
	
</script>
    <!-- Header Section Begin -->
   	<jsp:include page="menubar.jsp"></jsp:include>
    <!-- Header Section End -->  
	<section class="main spad">
		<div class="container">
			<div class ="checkout__form login">
	        	<h4>쌍용마켓 회원가입</h4>
	            <form name="last" action="#">
	            	<div class="row cen">
	                        <div class="col-lg-8 col-md-6">
	                            <div class="row cen">
	                                <div class="new1">
	                                    <div class="checkout__input">
	                                        <p>휴대폰번호<span>*</span></p>	                                       
	                                        <input name="phonenumber" type="text" value="${sessionScope.phonenumber}" placeholder="${sessionScope.phonenumber}">	                                    
	                                        <p>비밀번호<span>*</span></p>	                                       
	                                        <input name="pwd" type="text" value="${sessionScope.pwd}" placeholder="${sessionScope.pwd}">	                                    
	                                        <p>주소1<span>*</span></p>
	                                        <input name="src_loc" type="text" value="${mem.location1}" placeholder="${mem.location1}">	                                    
	                                        <p>주소2<span></span></p>
	                                        <input name="loc2" type="text" value="${mem.location2}" placeholder="${mem.location2}">	                                    
	                                        <p>닉네임<span>*</span></p>
	                                        <input name="nickname" type="text" placeholder="입력하세요">
	       	                                <h5>내 닉네임: ${param.nickname}</h5>
	                                    </div>
					                      <button type="submit" class="site-btn">가입 완료</button>
	                                </div>
	                            </div>
	                            
                            </div> 
                	</div>
                </form>
            <div class="row">
            	<button onclick="goNext()" class="site_btn2 yoyo1 new4">나가기</button>
            </div>                                      	
            </div>
        </div>
    </section>
	<!-- Js Plugins -->
	<script src="js/jquery-3.3.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery-ui.min.js"></script>
	<script src="js/jquery.slicknav.js"></script>
	<script src="js/mixitup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/main.js"></script>
</body>
</html>