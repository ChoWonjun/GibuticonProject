<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="${initParam.root }css/board.css" type="text/css">
	
	<table class="list">
		<caption>모금목록</caption>
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="title">제목</th>
			<th class="name">목적</th>
			<th class="date">기한</th>
			<th class="hit">HIT</th>
			</tr>
		</thead>
		<tbody>			
	<c:forEach var="i" begin="1" end="${fn:length(requestScope.list)}">
	<c:set var="posting" value="${requestScope.list[i-1] }" ></c:set>				
			<tr>
			    <td>${posting.fundNo }</td>				
				<td><a href="${initParam.root }showFundContent.gibu?no=${posting.fundNo }">
				${posting.fundName }</a></td>
				<td>${posting.proposal }</td>
				<td>${posting.dueDate }</td>
				<td>${posting.hits }</td>
			</tr>
	</c:forEach>					
		</tbody>					
	</table><br></br>	
	<a href="fundWriteForm.gibu"><img  src="${initParam.root }img/write_btn.jpg" border="0"></a>
	<br><br>	