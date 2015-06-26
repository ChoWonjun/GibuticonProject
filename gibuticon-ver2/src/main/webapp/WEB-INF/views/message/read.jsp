<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<h3>쪽지 읽기</h3>
보낸이 : ${requestScope.msg.sender.name }<br>
보낸시간 : ${requestScope.msg.sendTime }<br>
읽은시간 : ${requestScope.msg.readTime }<br>
제목 : ${requestScope.msg.title }<br>
내용 : ${requestScope.msg.content }<br><br>
<input type="button" value="목록"> <input type="button" value="답장"> <input type="button" value="닫기">
</body>
</html>