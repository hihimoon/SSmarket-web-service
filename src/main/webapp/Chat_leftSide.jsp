<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    import="java.util.*"
    import="backendweb.z01_vo.*"
    import="JangSunWoong.*"
    %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%

//new ArrayList<String>이 반복되어서 문제가 되는것같다. 이거 단 한번만 수행되게 하자



session.setAttribute("YON",session.getAttribute("YesOrNo"));


if(
		session.getAttribute("YON").equals("No")&&
		!session.getAttribute("YON").equals("")&&
			(String)session.getAttribute("nickname1FromTempToLeftSi")!=null&&
					!(((String)(session.getAttribute("nickname1FromTempToLeftSi"))).equals(""))&&
						(String)session.getAttribute("nickname2FromTempToLeftSi")!=null&&
								!(((String)(session.getAttribute("nickname2FromTempToLeftSi"))).equals(""))
	)
{
	//ChatList.add(((String)session.getAttribute("nickname1FromTempToLeftSi"))); // 새로운 닉네임만 추가된다. 즉, 동적배열에 중복 대화는 없다.
	//ChatList.add(((String)session.getAttribute("nickname2FromTempToLeftSi")));
	
	//log("닉네임이 2개 들어와서 동적배열에 add되었을떄 ChatListSize의 수치 : "+ChatList.size());
}
%>

<c:set var="path" value="${pageContext.request.contextPath }"/>
<fmt:requestEncoding value="utf-8"/>     
<%--Chat_leftSide.jsp --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css" >
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css" >

<style>
	.hoverChat:hover {background-color:yellow;}
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

<h3>기존 대화 상대인가요? ${YesOrNo}</h3>
<h3>대화자1 ${nickname1FromTempToLeftSi}</h3>
<h3>대화자2 ${nickname2FromTempToLeftSi}</h3>

<%--
<%
체크용 코드 정상작동한다.
log("ChatList의 사이즈 : "+ChatList.size());
log("ChatList의 사이즈 : "+ChatList.get(0));
log("ChatList의 사이즈 : "+ChatList.get(1));
%>


	<td><%=ChatList.get(2*idx) %></td> 
	<td>그리고</td>
	<td><%=ChatList.get(2*idx+1) %></td> 
	
--%>


<%--
이 논리로 이미 존재할경우 YesOrNo가 Yes니까 걸러낼 수 있다.
<c:if test="${YesOrNo!='Yes'}">
<h3><%=ChatList.get(0) %></h3>
<h3><%=ChatList.get(1) %></h3>
</c:if>
--%>


<%--
이 방법도 같은 논리다.
<h3><%=session.getAttribute("YesOrNo")%></h3>
<h3><%=session.getAttribute("nickname1FromTempToLeftSi")%></h3>
<h3><%=session.getAttribute("nickname2FromTempToLeftSi")%></h3>
--%>






<%--
이 submit이용하는 방법은 이 페이지가 직접 변화되고, 요청값도 제대로 전송되지 않는다. 다른방법 우선 시도해보자.

1. leftSide파일에서 form 데이터를 submit하면 자기자신 화면이 action 속성 값으로 변화하고, 요청값 전달도 비정상적이다.

2. clicktoshow메소드에 alert가 정상동작하는걸 보면 click이벤트로 처리가 가능함이 분명하다.

3 .session.setAttribute("SendingToShowNickname1",nickname1);
session.setAttribute("SendingToShowNickname2",nickname2);
를 정의해서 sending에서 show로 세션데이터 전달하는것처럼 수행해보자.
그러면 show에서 해당 데이터를 받아서 자동으로 화면에 출력해줄것같다.
(sending에서 show로 보내는것도 이 방법이다.)


<%
Chat_SSMarketProjectDao daoLS=new Chat_SSMarketProjectDao();
for(Chat_SSMarketVO data:daoLS.makeList())
{
	%>
	<hr>
	<form id="frm" action="Chat_ShowList_Second.jsp">
	<p ondblclick="clicktoshow()" class="hoverChat" >
	<span>닉 네 임1 : <input type="text" name="nickname1" value="<%=data.getNickname()%>" readonly="readonly"/></span>
	<br>
	<span>닉 네 임2 : <input type="text" name="nickname2" value="<%=data.getNickname2()%>" readonly="readonly"/></span>
	<br>
	<span>최종 시간 : <%=data.getMytime()%></span>
	</p>
	</form>	
	<hr>
	<%
}
%>
--%>




<%
Chat_SSMarketProjectDao daoLS=new Chat_SSMarketProjectDao();
for(Chat_SSMarketVO data:daoLS.makeList())
{ %>

	<hr>
	<form id="frm" action="Chat_ShowList_Second.jsp">
	<p ondblclick="clicktoshow('<%=data.getNickname()%>','<%=data.getNickname2()%>')" class="hoverChat" >
	<span>닉 네 임1 : <input type="text" name="nickname1" value="<%=data.getNickname()%>" readonly="readonly"/></span>
	<br>
	<span>닉 네 임2 : <input type="text" name="nickname2" value="<%=data.getNickname2()%>" readonly="readonly"/></span>
	<br>
	<span>최종 시간 : <%=data.getMytime()%></span>
	</p>
	</form>	
	<hr>
	
	<%
}
%>

</body>
<script>

	function clicktoshow(nickname1, nickname2)
	{
		window.open("z01_session.jsp?nickname1="+nickname1+"&nickname2="+nickname2+"&dblclick=Y");
	}
	
</script>
</html>