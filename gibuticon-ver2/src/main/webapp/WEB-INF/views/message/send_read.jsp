<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
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
			<td><c:if test="${requestScope.msg.readTime==null }">
				읽지않음
			</c:if> <c:if test="${requestScope.msg.readTime!=null }">
				${requestScope.msg.readTime }
			</c:if></td>
		</tr>
		<tr>
			<td>내용</td>
			<td><pre>${requestScope.msg.content }</pre></td>
		</tr>
	</table>
	<hr>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<ul class="breadcrumb">
						<c:if test="${requestScope.msg.readTime==null }">
							<li><a onclick="cancelSend()">발송취소</a></li>
						</c:if>
						<li><a onclick="getList()">목록</a></li>
						<li><a onclick="closeWindow()">닫기</a></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<%-- 
<c:if test="${requestScope.msg.readTime==null }">
	<input type="button" value="발송취소" onclick="cancelSend()">
</c:if>
<input type="button" value="목록" onclick="getList()">
<input type="button" value="닫기" onclick="closeWindow()"> --%>
</body>
</html>