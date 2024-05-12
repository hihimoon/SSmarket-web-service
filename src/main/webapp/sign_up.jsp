<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
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
    <title>회원가입</title>

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
    <!-- Header Section Begin -->
   	<jsp:include page="menubar.jsp"></jsp:include>
    <!-- Header Section End -->
	<section class="지도">

<!-- 

String location1= request.getParameter("location1");
if (location1 == null) location1 = "";
String location2= request.getParameter("location2");
if (location2 == null) location2 = "";
session.setAttribute("location2", location2); 
String notNull;
if(location1 != null && !location1.equals("")){
	notNull="Y";
}
else{
	notNull = "N";
}
-->


<%
String src_loc= request.getParameter("src_loc");
System.out.print(src_loc);
if (src_loc == null) src_loc = "";
session.setAttribute("src_loc", src_loc);
%>

<div class="map" id="map" style="width:60%;height:350px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=1704ca0beb28c96aa1d447413535c934&libraries=services"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다

geocoder.addressSearch("<%=src_loc%>", function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            map: map,
            position: coords
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div id="popup" style="width:150px;text-align:center;padding:6px 0;">현재위치</div>'
        });
        infowindow.open(map, marker);
        var pb = document.querySelector("#popup");
        pb.innerHTML = src_loc;
        

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } 
});
/*
 * 
 */
</script>
<script type="text/javascript">

</script>   
    <jsp:useBean id="mem" class="backendweb.z01_vo.Member" scope="session"/>
    <jsp:setProperty property="location1" name="mem"/>
    <jsp:setProperty property="location2" name="mem"/>
     
    <div class="contact-form spad">
        <div class="container">
            	<form name="loc" action="#">
            	 <div class="row">
	                <div class=" new5 col-md-6">
	                    <input name="location1" type="text" value="${src_loc}" placeholder="첫번째 동네(필수)">
	                </div>           	
	                <div class="new5 col-md-6">
	                    <input name="location2" type="text" placeholder="두번째 동네(필수X)">
	                </div>
                	<button type="submit" class="site-btn">내 동네 등록</button>  
                </div>
         
                </form>   	
                   
            <div class="row">
                <div class="new2">
                    <div class="contact__form__title">
                        <h2>내 동네 선택</h2>
                    </div>
                </div>
            </div>
            <form name="sch" action="#">
                <div class="row">
                    <div class="new3 col-md-6">
                        <input name="src_loc" type="text" placeholder="주소를 입력하세요">
                    </div>
                    <div class="new3 text-center" >
                      <button type="submit()" class="site-btn">내 동네 검색하기</button>
                    </div>
                </div>
            </form>
        </div>
            <div class="row">
            	<button onclick="location.href='sign_up2.jsp'" class="site_btn2 yoyo1 new4">다음단계로</button>
            </div>  
    </div> 
	</section>
</body>
</html>