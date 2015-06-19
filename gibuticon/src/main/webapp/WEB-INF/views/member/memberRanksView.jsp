<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<h3>기부액별 순위</h3>

				<table class="table" style="font-family: &amp; amp;">
					<thead>
						<tr>
							<th width="100">RANK</th>
							<th width="500">아이디</th>
							<th width="500">총기부액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.rank1}" var="posting">
							<tr>
								<td>${posting.rank }</td>
								<td>${posting.memberId }</td>
								<td>${posting.rankVal }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				
<h3>기부함 수 순위</h3>

				<table class="table" style="font-family: &amp; amp;">
					<thead>
						<tr>
							<th width="100">RANK</th>
							<th width="500">아이디</th>
							<th width="500">기부함수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.rank2}" var="posting">
							<tr>
								<td>${posting.rank }</td>
								<td>${posting.memberId }</td>
								<td>${posting.rankVal }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>