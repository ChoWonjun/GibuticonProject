<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="${initParam.root }css/board.css" type="text/css">
	
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
			<c:forEach var="posting" items="${requestScope.vo.list}">	
			<tr>
			    <td>${posting.noticeNo }</td>				
				<td><a href="${initParam.root }showNoticeContent.gibu?no=${posting.noticeNo }">
				${posting.title }</a></td>
				<td>${posting.writeDate }</td>
				<td>${posting.hits }</td>
			</tr>
	</c:forEach>
<%-- 	<c:forEach var="i" begin="1" end="${fn:length(requestScope.list)}">
	<c:set var="posting" value="${requestScope.list[i-1] }" ></c:set>	 --%>			
<%--			<tr>
			    <td>${posting.noticeNo }</td>				
				<td><a href="${initParam.root }showNoticeContent.gibu?no=${posting.noticeNo }">
				${posting.title }</a></td>
				<td>${posting.writeDate }</td>
				<td>${posting.hits }</td>
			</tr>
 	</c:forEach>	 --%>				
		</tbody>					
	</table><br></br>	
	<a href="writeNoticeView.gibu"><img  src="${initParam.root }img/write_btn.jpg" border="0"></a>
	<br><br>	