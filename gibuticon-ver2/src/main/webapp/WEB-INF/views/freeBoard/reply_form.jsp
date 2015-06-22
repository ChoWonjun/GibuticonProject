<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글입력</title>
<link rel="stylesheet" href="${initParam.root}/css/board.css"
	type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#answerImg").click(function() {
			if ($("#title").val() == "") {
				alert("제목을 입력하세요!");
				return;
			} else if ($("#writer").val() == "") {
				alert("작성자 이름을 입력하세요!");
				return;
			} else if ($("#password").val() == "") {
				alert("패스워드를 입력하세요!");
				return;
			} else if ($("#content").val() == "") {
				alert("본문 내용을 입력하세요!");
				return;
			}
			$("#writeForm").submit();
		});
	});
</script>
</head>
<form action="${initParam.root}freeBoard/reply.gibu" method="post" id="writeForm">
	<input type="hidden" name="ref" value="${requestScope.fvo.ref}">
	<input type="hidden" name="restep" value="${requestScope.fvo.restep}">
	<input type="hidden" name="relevel" value="${requestScope.fvo.relevel}">
	<input type="hidden" name="boardNo"
		value="${ requestScope.fvo.boardNo}">
	<table class="inputForm">
		<caption>답변글쓰기</caption>
		<tbody>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"
					value="RE:${requestScope.fvo.title}"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input readonly type="text" name="id" id="writer"
					value="${sessionScope.mvo.id}"></td>
			</tr>
			<tr>
				<td colspan=2><textarea cols="32" rows="10" name="content"
						id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan=2><img id="answerImg"
					src="${initParam.root}/img/answer_btn.jpg" /></td>
			</tr>
		</tbody>
	</table>
</form>
</body>
</html>