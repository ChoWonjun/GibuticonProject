<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>받은 쪽지 목록</h3>
<p><b>받은 쪽지 목록</b> l <a href="${initParam.root }message/getSendList.gibu">보낸 쪽지 목록</a></p>

<table border=1>
<tr>
	<td width=220px>제목</td>
	<td width=130px>보낸이</td>
	<td width=60px>날짜</td>
</tr>
		<c:forEach var="msg" items="${requestScope.list.list}">	
			<tr>
			<c:if test="${msg.readTime==null }">
			<!-- 읽지않은쪽지 -->
				<td><a href="${initParam.root}message/read.gibu?no=${msg.no }"><b>${msg.title }</b></a></td>
			</c:if>
			<c:if test="${msg.readTime!=null }">
			<!-- 읽은쪽지 -->
				<td><a href="${initParam.root}message/read.gibu?no=${msg.no }">${msg.title }</a></td>
			</c:if>
				<td><a href="${initParam.root}message/sendForm.gibu?receiverId=${msg.sender.id }">${msg.sender.name }(${msg.sender.id })</a></td>
				<td>${msg.sendTime }</td>
			</tr>
		</c:forEach>
		
		<tr>
			<td colspan="3" align="center">
					<c:set var="pb" value="${requestScope.list.pagingBean}"></c:set>
					<c:if test="${pb.previousPageGroup}">
						<a href="${initParam.root}message/getReceiveList.gibu?page=${pb.startPageOfPageGroup-1}">◀</a> 
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<a href="${initParam.root}message/getReceiveList.gibu?page=${i }">${i }</a>
					</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="${initParam.root}message/getReceiveList.gibu?page=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
			</td>
		</tr>
</table>
</body>
</html>