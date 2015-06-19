<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
 <script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		window.opener.location.reload();
	});
	
	function closeWindow(){
		window.close();
	}
</script>

</head>
<body>
기부해주셔서 감사합니다.<hr>

<form name="writeCommentForm" action="${initParam.root }fund/writeComment.gibu">
응원댓글 남기기<br>
${sessionScope.mvo.name }
<input type="text" name="text"><br>
<input type="hidden" name="fundNo" value="${param.fundNo }">
<input type="hidden" name="memberId" value="${sessionScope.mvo.id }">
<input type="submit" value="댓글달기">
<input type="button" value="닫기" onclick="closeWindow()"></form>
</body>
</html>