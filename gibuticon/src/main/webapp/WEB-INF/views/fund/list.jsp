<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
	
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div class="row">
					<div id="menu_example">
						<table border="1" pedding="5">
							<tr>
								<td><a href="#">기부사이트 보기</a></td>
							</tr>
							<tr>
								<td><a href="#">&nbsp;</a></td>
							</tr>
							<tr>
								<td><a href="#">아동</a></td>
							</tr>
							<tr>
								<td><a href="#">&nbsp;</a></td>
							</tr>
							<tr>
								<td><a href="#">어르신</a></td>
							</tr>
							<tr>
								<td><a href="#">&nbsp;</a></td>
							</tr>
							<tr>
								<td><a href="#">환경</a></td>
							</tr>
						</table>
					</div>
					<!--//menu-->
				</div>
			</div>
			<div class="col-md-10">
				<div id="carousel-example" data-interval="false"
					class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="item active">
							<img src="${initParam.root }img\모금함리스트_배너.jpg">
						</div>
					</div>
					<a class="left carousel-control" href="#carousel-example"
						data-slide="prev"><i class="icon-prev  fa fa-angle-left"></i></a>
					<a class="right carousel-control" href="#carousel-example"
						data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
				</div>
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<img src="${initParam.root }img\추천모금함.jpg" class="img-responsive">
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
						<c:forEach items="${requestScope.vo.list}" var="posting">
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
				<br></br>
				 <c:if test="${sessionScope.mvo.admin=='yes'}">
				 <a href="${initParam.root }fund/writeForm.gibu"><img
					src="${initParam.root }img/write_btn.jpg" border="0"></a> <br>
					</c:if>
				<br>
			</div>
		</div>
	</div>
	
	
	   <div class="section">
        <div class="container">
          <div class="row"></div>
        </div>
      </div>