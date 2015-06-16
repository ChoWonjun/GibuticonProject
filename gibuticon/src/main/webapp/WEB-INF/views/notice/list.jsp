<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

	<body>
	<table class="list">
		<caption>공지사항</caption>
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="title">제목</th>
			<th class="date">작성일</th>
			<th class="hit">HIT</th>
			</tr>
		</thead>
		<tbody>			
			<c:forEach items="${requestScope.lvo.list}" var="noticeboard" >	
			<tr>
			    <td>${noticeboard.noticeNo }</td>				
				<td><a href="${initParam.root}showNoticeContent.gibu?noticeNo=${noticeboard.noticeNo }">
				${noticeboard.title }</a></td>
				<td>${noticeboard.writeDate }</td>
				<td>${noticeboard.hits }</td>
			</tr>
	</c:forEach>
			<tr>
				<td colspan=5 align="center">
					<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
					<c:if test="${pb.previousPageGroup}">
						<a href="${initParam.root }getNoticeList.gibu?pageNo=${pb.startPageOfPageGroup-1}">◀</a> 
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<a href="${initParam.root }getNoticeList.gibu?pageNo=${i }">${i }</a>
					</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="${initParam.root }getNoticeList.gibu?pageNo=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</td>
			</tr>				
		</tbody>
	</table>
<br>
<a href="writeNoticeView.gibu">글쓰기</a>
</body>


