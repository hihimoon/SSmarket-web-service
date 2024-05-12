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
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		
		String memnoStr = request.getParameter("memno");
		String grade = request.getParameter("grade");
		int memno = 0;
		try {
		    memno = Integer.parseInt(memnoStr);
		} catch (NumberFormatException e) {
		    // memno 파싱 실패 시 오류 처리
		}
		
		Member member = new Member();
		member.setMemno(memno);
		member.setGrade(grade);
		
		Admin_Dao dao = new Admin_Dao();
		int result = dao.updateMember(member);
	%>
	<script>
	<%
		if (result != 0) {
		    // 업데이트 성공
	%>
		alert("수정 성공");
		window.location = "adminMemberDetail.jsp?memno=<%= memno %>";
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
</html>
