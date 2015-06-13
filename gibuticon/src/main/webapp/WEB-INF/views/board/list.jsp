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
<table align="center" border="1" cellpadding="1">
		<caption>목록</caption>
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="title">제목</th>
			<th class="date">작성일</th>
			<th class="hit">HIT</th>
			</tr>		
		</thead>	
		<tbody>
			<c:forEach items="${requestScope.lvo.list}" var="board">
				<tr><td>${board.boardNo}</td><td><a href="${initParam.root }getFreeBoardByNo.gibu?no=${board.boardNo}">${board.title}</a></td><td>${board.writeDate}</td><td>${board.hits}</td></tr>
			</c:forEach>
			<tr>
				<td colspan=5 align="center">
					<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
					<c:if test="${pb.previousPageGroup}">
						<a href="${initParam.root }getFreeBoardList.gibu?pageNo=${pb.startPageOfPageGroup-1}">◀</a> 
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<a href="${initParam.root }getFreeBoardList.gibu?pageNo=${i }">${i }</a>
					</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="${initParam.root }getFreeBoardList.gibu?pageNo=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</td>
			</tr>				
		</tbody>
	</table>
<br>
<a href="write.gibu">글쓰기</a>
</body>
</html>