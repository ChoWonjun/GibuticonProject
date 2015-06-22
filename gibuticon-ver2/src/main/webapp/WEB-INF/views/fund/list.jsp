<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <link rel="stylesheet" href="${initParam.root }css/board.css"
	type="text/css"> --%>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<img src="${initParam.root }img\모금함리스트_사이트배너.jpg"
					class="img-responsive">
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<img src="${initParam.root }img\기부사이트 전체모금함.jpg">
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-20">
				<table class="table" style="font-family: &amp; amp;">
					<thead>
						<tr>
							<th width="100">NO</th>
							<th width="500">제목</th>
							<th width="500">목적</th>
							<th width="300">기한</th>
							<th width="100">HIT</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.vo.list}"  var="posting">
							<tr>
								<td>${posting.fundNo }</td>
								<td><a
									href="${initParam.root }fund/showContent.gibu?no=${posting.fundNo }">
										${posting.fundName }</a></td>
								<td>${posting.proposal }</td>
								<td>${posting.dueDate }</td>
								<td>${posting.hits }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="section">
						<div class="container"></div>
						<div class="col-md-offset-6 col-md-6">
							<ul class="pagination">
								<c:set var="pb" value="${requestScope.vo.pagingBean}"></c:set>
								<c:if test="${pb.previousPageGroup}">
									<li><a
										href="${initParam.root }fund/getList.gibu?pageNo=${pb.startPageOfPageGroup-1}">Prev</a>
									</li>
								</c:if>
								<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
										end="${pb.endPageOfPageGroup}">
										<a href="${initParam.root }fund/getList.gibu?pageNo=${i }">${i }</a>
									</c:forEach></li>
								<c:if test="${pb.nextPageGroup}">
									<li><a
										href="${initParam.root }fund/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}">Next</a>
									</li>
								</c:if>
							</ul>
						</div>
					</div>
				<br></br> 
				<c:if test="${sessionScope.mvo.admin=='yes'}">
				<a href="${initParam.root }fund/writeForm.gibu"> <input
					class="btn btn-default" type="submit" value="글쓰기"></a>
					</c:if>
				<br> <br>
			</div>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row"></div>
	</div>
</div>