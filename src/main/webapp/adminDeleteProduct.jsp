<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    import="java.io.IOException"
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%
    String pnoStr = request.getParameter("pno");
    int pno = Integer.parseInt(pnoStr);

    Admin_Dao dao = new Admin_Dao();
    int result = dao.deleteProduct(pno);
%>
	<script>
	<%
		if (result != 0) {
		    // 삭제 성공
	%>
		alert("상품이 삭제되었습니다.");
		window.location = "adminProduct.jsp";
	<%
		} else {
		    // 삭제 실패 처리
	%>
		alert("삭제 실패");
		history.back();
	<%
		}
	%>
</script>
</head>
<body>
</body>
</html>
