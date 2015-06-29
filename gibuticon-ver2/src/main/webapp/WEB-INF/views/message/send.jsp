<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function closeWindow(){
		window.close();
	}
</script>
</head>
<body>

<h3>쪽지 보내기</h3>

<form name="messageForm" method="post" action="${initParam.root }message/send.gibu">
<input type="hidden" name="sender.id" value="${sessionScope.mvo.id }">
보낸이 : ${sessionScope.mvo.name }<br>
받는이 : 
	<c:if test="${requestScope.receiver!=null }">
		<input type="hidden" name="receiverId" value="${requestScope.receiver.id }">
		${requestScope.receiver.name }(${requestScope.receiver.id })
	</c:if>
	<c:if test="${requestScope.receiver==null }">
		<select name="receiverId">
			<option value="">-선택-</option>
			<option value="${sessionScope.mvo.id }">나에게</option>
			<c:forEach items="${requestScope.friendlist }" var="list">
			<option value="${list.friend.id }">${list.friend.name}(${list.friend.id })</option>
			</c:forEach>
		</select>
	</c:if>
<br><br>
제목 : <input type="text" name="title"><br>
내용 : <br>
<textarea cols="53" rows="15" name="content"></textarea>

<br><br><input type="submit" value="전송"> <input type="button" value="취소" onclick="closeWindow()">
</form>

</body>
</html>