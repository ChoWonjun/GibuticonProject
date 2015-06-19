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
						<c:forEach items="${requestScope.vo.list}">
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
						<tr>
							<td colspan=5 align="center"><c:set var="pb"
									value="${requestScope.vo.pagingBean}"></c:set> <c:if
									test="${pb.previousPageGroup}">
									<a
										href="${initParam.root }fund/getList.gibu?pageNo=${pb.startPageOfPageGroup-1}">◀</a>
								</c:if> <c:forEach var="i" begin="${pb.startPageOfPageGroup}"
									end="${pb.endPageOfPageGroup}">
									<a href="${initParam.root }fund/getList.gibu?pageNo=${i }">${i }</a>
								</c:forEach> <c:if test="${pb.nextPageGroup}">
									<a
										href="${initParam.root }fund/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}">▶</a>
								</c:if></td>
						</tr>
					</tbody>
				</table>
				<br></br> <a href="${initParam.root }fund/writeForm.gibu"> <input
					class="btn_charity btn_record" type="submit" name="" value="글쓰기"></a>
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