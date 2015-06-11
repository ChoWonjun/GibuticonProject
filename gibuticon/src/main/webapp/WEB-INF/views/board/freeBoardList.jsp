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
<table align="center">
		<caption>목록</caption>
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="title">제목</th>
			<th class="name">이름</th>
			<th class="date">작성일</th>
			<th class="hit">HIT</th>
			</tr>		
		</thead>	
		<tbody>
			<c:forEach items="${requestScope.list}" var="board">
				<tr><td>${board.boardNo}</td><td><a href="board/findbyno.do?no=${board.boardNo}">${board.title}</a></td><td>${board.writeDate}</td><td>${board.content}</td></tr>
			</c:forEach>
		</tbody>
	</table>
<br>
<a href="write.gibu">글쓰기</a>
</body>
</html>