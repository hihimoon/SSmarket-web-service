<%@page import="javax.tools.DocumentationTool.Location"%>
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

String nickname1=request.getParameter("nickname1");
String nickname2=request.getParameter("nickname2");
String message=request.getParameter("message");
if(nickname1==null){nickname1="";}
if(nickname2==null){nickname2="";}
if(message==null){message="";}

Chat_SSMarketProjectDao dao=new Chat_SSMarketProjectDao();

boolean alreadyExist=dao.existing(nickname1, nickname2); // 기존 채팅이 존재한다면 새로운 채팅을 만들지 않고 기존 채팅을 열어야한다. 이거 위치 조정하자.

session.setAttribute("YesOrNo","");

if(alreadyExist)// 기존 두 사람의 채팅이 존재한다면 기존 채팅을 rightSide에 열어야한다.
{
	//이것은 SendingChat에서 메세지를 보내면 이미 DB에 존재한다면 자동으로 열린다. 신경 꺼도 된다.
	session.setAttribute("YesOrNo","Yes");
}
else // 기존 두 사람의 채팅이 존재하지 않는다면 새로운 채팅을 leftSide 채팅창에 추가해야 한다.
{
	//새로운 채팅이DB에 들어가며 자동으로 rightSide에는 열린다.
	//그러나 leftSide에 채팅항목을 추가해야하긴 한다.
	//이미 alreadyExist판정을 끝냈기 떄문에 여긴 채팅항목 추가만 하면 된다.

	session.setAttribute("YesOrNo","No");	//전송된 데이터를 동적배열에 추가하라는 의미
	session.setAttribute("nickname1FromSendingToLeftSide",nickname1);
	session.setAttribute("nickname2FromSendingToLeftSide",nickname2);

	//leftSide로 보내는 session scope 데이터는 어차피 한쌍(닉네임1, 닉네임2) 전송된다.
	//즉석에서 채팅목록에 추가하고 버릴수 도 있지만 혹시모를 재사용가능성을 고려해서 session scope 동적배열로 저장하고
	//반복문을 사용해서 채팅목록 구성하자.
}


if(!nickname1.equals("")&&!nickname2.equals(""))
{
	dao.insertChat(new Chat_SSMarketVO(nickname1,nickname2,message));
}


session.setAttribute("SendingToShowNickname1",nickname1);
session.setAttribute("SendingToShowNickname2",nickname2);

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
<div class="container">
	<form id="frm01" class="form"  method="get">
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	    <input type="text" value="<%=nickname1 %>" name="nickname1" class="form-control mr-sm-2" placeholder="닉네임1" size="80"/>
	    <input type="text" value="<%=nickname2 %>" name="nickname2" class="form-control mr-sm-2" placeholder="닉네임2" size="80"/>
	    <input type="text" name="message" class="form-control mr-sm-2" placeholder="메세지" />
	    <button class="btn btn-info" type="submit">채팅전송</button>
 	</nav>
	</form>
</div>

</body>
</html>