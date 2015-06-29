<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function getList() {
		location.href = "${initParam.root}message/getSendList.gibu";
	}
	function closeWindow() {
		window.close();
	}
	function cancelSend(){
		if(confirm("정말로 취소하시겠습니까?")) {
			location.href="${initParam.root}message/delete.gibu?retLocation=send&no=${requestScope.msg.no}";
		}
	}
</script>

</head>
<body>

<h3>보낸 쪽지</h3>
<hr>
<table border=0>
	<tr>
		<td width=100>받는이</td>
		<td width=300>${requestScope.msg.receiverId}</td>
	</tr>
	<tr>
		<td>제목</td>
		<td>${requestScope.msg.title }</td>
	</tr>
	<tr>
		<td>보낸시간</td>
		<td>${requestScope.msg.sendTime }</td>
	</tr>
	<tr>
		<td>읽은시간</td>
		<td>
			<c:if test="${requestScope.msg.readTime==null }">
				읽지않음
			</c:if>
			<c:if test="${requestScope.msg.readTime!=null }">
				${requestScope.msg.readTime }
			</c:if>
		</td>
	</tr>
	<tr>
		<td>내용</td>
		<td><pre>${requestScope.msg.content }</pre></td>
	</tr>
</table>
<hr>
<c:if test="${requestScope.msg.readTime==null }">
	<input type="button" value="발송취소" onclick="cancelSend()">
</c:if>
<input type="button" value="목록" onclick="getList()">
<input type="button" value="닫기" onclick="closeWindow()">
</body>
</html>