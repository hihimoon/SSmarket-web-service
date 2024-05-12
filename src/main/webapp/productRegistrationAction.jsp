
<%@page import="backendweb.d01_dao.*"
	import="backendweb.z01_vo.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 이미지 추가를 위한 패키지 작성 -->
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />


<%
String pnoStr = request.getParameter("pno");
String category = request.getParameter("category");
String title = request.getParameter("title");
String priceStr = request.getParameter("price");
String pcontent = request.getParameter("pcontent");
String condition = request.getParameter("condition");
String transactionmethod = request.getParameter("transactionmethod");
String transactionlocation = request.getParameter("transactionlocation");
String writtendate = request.getParameter("writtendate");
String productimage = request.getParameter("productimage");
String pavailableStr = request.getParameter("pavailable");
String location = request.getParameter("location");

Member member = (Member) session.getAttribute("member");

String nickname = member.getNickname();

if (pnoStr == null)
	pnoStr = "0"; 
int pno = Integer.parseInt(pnoStr); 

/* if (priceStr != null) */
	priceStr = priceStr.replaceAll(",", "");
int price = Integer.parseInt(priceStr);

if (pavailableStr == null)
	pavailableStr = "0";
int pavailable = Integer.parseInt(pavailableStr); 

boolean isInsert = false;
// 입력값이 있을 때..
if (nickname != null) {
	ProductDao dao = new ProductDao();
	dao.insertProduct(new Product(pno, nickname, category, title, price, pcontent, condition, transactionmethod,
	transactionlocation, writtendate, pavailable, location));
	isInsert = true;
}

/*  if (category.trim().equals(""))
	category = ""; */
/* 
if (title.trim().equals(""))
	title = ""; */

/* if (pcontent == null)
	pcontent = "";

if (transactionmethod.trim().equals(""))
	transactionmethod = "";

if (transactionlocation.trim().equals(""))
	transactionlocation = ""; */

/* if (writtendate == null)
	writtendate = ""; */
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="description" content="Ogani Template">
<meta name="keywords" content="Ogani, unica, creative, html">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>SSMarket-상품등록</title>
<script src="/frontweb/com/jquery-3.6.0.js"></script>
<script>
	var isInsert =
<%=isInsert%>
	;

	if (isInsert) {
		if (!confirm("등록 성공\n계속 등록하시겠습니까?")) {
			location.href = "main.jsp";
		} else {

			location.href = "productRegistration.jsp";
		}
	}
</script>






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
<body>

</body>
</html>


<%-- <%
/* String productimage=""; */
String realFolder="C:\\upload";	//웹애플리케이션상의 절대 경로
int maxSize = 5* 1024* 1024;	//최대 업로드 파일의 크기 5MG
String encType = "utf-8";	//인코딩 유형

MultipartRequest multi = new MultipartRequest(request, realFolder,
		maxSize, encType, new DefaultFileRenamePolicy());
        
String pnoStr = multi.getParameter("pno");
String category = multi.getParameter("category");
String title = multi.getParameter("title");
String priceStr = multi.getParameter("price");
String pcontent = multi.getParameter("pcontent");
String condition = multi.getParameter("condition");
String transactionmethod = multi.getParameter("transactionmethod");
String transactionlocation = multi.getParameter("transactionlocation");
String writtendate = multi.getParameter("writtendate");
String pavailableStr = multi.getParameter("pavailable");
/* String productimage = multi.getParameter("productimage"); */

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

String productimage= fileName;
%>
 --%>