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
			<div class="col-md-29">
				<img src="${initParam.root }img\g_gibusite.jpg"
					class="img-responsive">
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</div>
<!-- 리스트 사진 시작 -->

<!-- 첫번째줄 (첫번째사연-세번째사연) -->
<div class="section">
	<div class="container">
		<div class="row">

			<!-- 첫번째 사연 -->

			<div class="col-md-4">
				<a
					href="${initParam.root }fund/showContent.gibu?no=${posting.fundNo }"><img
					src="${initParam.root}img\g_fundList_ex.jpg" class="img-responsive"
					onMouseOver="this.style.opacity='.6'; this.style.filter='alpha(opacity=60)'"
					onMouseOut="this.style.opacity='1.0'; this.style.filter='alpha(opacity=100)'" /></a>
				<h4>아이들에게 희망을</h4>
				<!-- progress bar -->
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="70"
						aria-valuemin="0" aria-valuemax="100" style="width: 70%">70%</div>
				</div>
			</div>


			<!-- 두번째 사연 -->
			<div class="col-md-4">
				<img
					src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
					class="img-responsive">
				<h2>A title</h2>
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="c 70"
						aria-valuemin="0" aria-valuemax="100"
						style="background-color: navy; width: 70%">70%</div>
				</div>
			</div>

			<!-- 세번째 사연 -->
			<div class="col-md-4">
				<img
					src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
					class="img-responsive">
				<h2>A title</h2>
				<div class="progress">
					<div class="progress-bar" role="progressbar" aria-valuenow="70"
						aria-valuemin="0" aria-valuemax="100" style="width: 70%">70%</div>
				</div>
			</div>
		</div>
	</div>

	<!-- 첫째줄 끝 -->

	<!-- 두번쨰줄 시작 -->
	<div class="section">
		<div class="container">
			<div class="row">

				<!-- 네번째 사연 -->
				<div class="col-md-4">
					<img
						src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
						class="img-responsive">
					<h2>A Title</h2>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="70"
							aria-valuemin="0" aria-valuemax="100" style="width: 70%">70%</div>
					</div>
				</div>

				<!-- 다섯번째 사연 -->
				<div class="col-md-4">
					<img
						src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
						class="img-responsive">
					<h2>A title</h2>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="70"
							aria-valuemin="0" aria-valuemax="100" style="width: 70%">70%</div>
					</div>
				</div>
				<!-- 여섯번째 사연 -->
				<div class="col-md-4">
					<img
						src="http://pingendo.github.io/pingendo-bootstrap/assets/placeholder.png"
						class="img-responsive">
					<h2>A title</h2>
					<div class="progress">
						<div class="progress-bar" role="progressbar" aria-valuenow="70"
							aria-valuemin="0" aria-valuemax="100" style="width: 70%">70%</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- <table class="table" style="font-family: &amp; amp;">
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
				</table> --%>
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
<br>
<br>


<div class="section">
	<div class="container">
		<div class="row"></div>
	</div>
</div>