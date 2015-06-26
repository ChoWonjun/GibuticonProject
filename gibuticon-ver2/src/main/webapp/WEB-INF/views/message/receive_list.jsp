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
<h3>쪽지 목록(${sessionScope.mvo.name })</h3>

<!-- 보낸시간 제목 보낸이(아이디) -->
		<c:forEach var="msg" items="${requestScope.list}">	
			${msg.sendTime }, ${msg.sender.name }, <a href="${initParam.root}message/read.gibu?no=${msg.no }">${msg.title }</a><br>
		</c:forEach>

</body>
</html>