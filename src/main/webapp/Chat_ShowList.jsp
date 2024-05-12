<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import ="backendweb.d01_dao.*"
    import ="JangSunWoong.*"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%
String nickname1=(String)session.getAttribute("SendingToShowNickname1"); // sending 파일로부터 닉네임1을 받아온다.
String nickname2=(String)session.getAttribute("SendingToShowNickname2");// sending 파일로부터 닉네임2을 받아온다.

if(nickname1==null){nickname1="";}
if(nickname2==null){nickname2="";}

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


<%

if(session.getAttribute("nickname1FromSession")!=null 
&&!session.getAttribute("nickname1FromSession").equals("")
&&session.getAttribute("dblclickFromSession").equals("Y"))
{
	String nickname1FromSession=(String)session.getAttribute("nickname1FromSession"); 
	String nickname2FromSession=(String)session.getAttribute("nickname2FromSession");

	if(nickname1FromSession==null){nickname1FromSession="";}
	if(nickname2FromSession==null){nickname2FromSession="";}

	nickname1=nickname1FromSession;
	nickname2=nickname2FromSession;
}


%>

	
	
setInterval(function(){
	$("form").attr("action","Chat_ShowList_Second.jsp").submit();
},1000)

	$(document).ready(function(){
		$("#renewDBBtn").click(function(){
			$("form").attr("action","Chat_ShowList_Second.jsp").submit();
		})
		
	});
</script>
</head>
<%
Chat_SSMarketProjectDao dao=new Chat_SSMarketProjectDao();
%>
<body>
<div class="jumbotron text-center">
  <h2><%=nickname1%>님과 <%=nickname2%>님의 채팅</h2>
  
</div>
<div class="container">

	<form id="frm01" class="form"  method="get">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input type="text" name="nickname1" value="<%=nickname1%>" class="form-control mr-sm-2" placeholder="닉네임1" />
	    <input type="text" name="nickname2" value="<%=nickname2%>" class="form-control mr-sm-2" placeholder="닉네임2" />
	    <button class="btn btn-info" name="searchByPeopleNames" type="submit">검색</button>
 	</nav>
	</form>
	
   <table border class="table table-hover table-striped">
   	<col width="12%">
   	<col width="12%">
   	<col width="12%">
   	<col width="12%">
   	<col width="4%">
   	<col width="12%">
   	<col width="12%">
   	<col width="12%">
   	<col width="12%">

    <thead>
      <tr class="table-success text-center">
        <th>닉네임1</th>
        <th>닉네임2</th>
        <th>메세지</th>
        <th>송수신시간</th>
        <th style="background:black";></th>
        <th>닉네임1</th>
        <th>닉네임2</th>
        <th>메세지</th>
        <th>송수신시간</th>
      </tr>
    </thead>	
    <tbody>
    
    
    <%
            for(Chat_SSMarketVO data:dao.getChatListByNickname(nickname1,nickname2)) 
                { 
            		if(data.getNickname().equals(nickname1))
            		{
            %>
		<tr>
    	<td><%=data.getNickname() %></td>
    	<td><%=data.getNickname2() %></td>
    	<td><%=data.getMymessage() %></td>
    	<td><%=data.getMytime() %></td>
    	<td style="background:black";></td>
    	<td>                       </td>
    	<td>                       </td>
    	<td>                       </td>
    	<td>                       </td>
    	</tr>
			<% 
		}
		else if(data.getNickname().equals(nickname2))
		{
			%>
		<tr>
		<td>                       </td>
    	<td>                       </td>
    	<td>                       </td>
    	<td>                       </td>
    	<td style="background:black";></td>
    	<td><%=data.getNickname() %></td>
    	<td><%=data.getNickname2() %></td>
    	<td><%=data.getMymessage() %></td>
    	<td><%=data.getMytime() %></td>
    	</tr>
			<% 
		}
	} 
    %>

    </tbody>
	</table>    
    
</div>

</body>



</html>