<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="backendweb.d01_dao.*"
    
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>
<%
String nickname1FromSession = request.getParameter("nickname1");
String nickname2FromSession = request.getParameter("nickname2");
String dblclickFromSession = request.getParameter("dblclick");
session.setAttribute("nickname1FromSession", nickname1FromSession);
session.setAttribute("nickname2FromSession", nickname2FromSession);
session.setAttribute("dblclickFromSession", dblclickFromSession);
%>
<script>
	this.close();
</script>
 