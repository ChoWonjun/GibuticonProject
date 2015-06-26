<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:choose>
	<c:when test="${requestScope.friendlist.size()==0 }">
		<script>
			alert("먼저 친구를 추가하세요!");
			window.close();
		</script>
	</c:when>
	<c:otherwise>
<h3>쪽지 보내기</h3>

<form name="multiform" id="multiform" enctype="multipart/form-data" method="post" action="${initParam.root }fund/write.gibu">
보낸이 : ${sessionScope.mvo.name }<br>
받는이 : 
		<select id="receiver">
			<option value="">-선택-</option>
			<c:forEach items="${requestScope.friendlist }" var="list">
			<option value="${list.friend.id }">${list.friend.name}(${list.friend.id })</option>
			</c:forEach>
		</select>
	</c:otherwise>
</c:choose>

<br><br>
제목 : <input type="text"><br>
내용 : <br>
<textarea cols="53" rows="15" name="content"></textarea>

<br><br><input type="submit" value="전송"> <input type="button" value="취소">

</body>
</html>