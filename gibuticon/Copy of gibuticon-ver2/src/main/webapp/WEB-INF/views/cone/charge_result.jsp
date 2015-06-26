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
	$(document).ready(function() {
		window.opener.location.reload();
	});

	function closeWindow() {
		window.close();
	}
</script>
</head>
<body>
	충전이 완료되었습니다.
	<br>
	<input type="button" value="닫기" onclick="closeWindow()">
</body>
</html>