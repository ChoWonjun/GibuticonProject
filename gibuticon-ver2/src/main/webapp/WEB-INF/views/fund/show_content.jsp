<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Cycle2 (슬라이드쇼) -->
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script type="text/javascript">
	function gibuCone() {
		location.href = "${initParam.root}cone/gibu.gibu?fundNo=${requestScope.posting.fundNo}&point="
				+ coneForm.coneCount.value;
	}
	$().ready(function() {
		var imgHeight = $("#imgTile").width() * 0.705;
		$("img[name=fundPhoto]").height(imgHeight);
	});
</script>

<style type="text/css">
/* set border-box so that percents can be used for width, padding, etc (personal preference) */
.cycle-slideshow,.cycle-slideshow * {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.cycle-slideshow {
	width: 100%;
	min-width: 200px;
	max-width: 390px;
	/* margin: 10px auto; */
	padding: 0;
	position: relative;
	background: url(http://malsup.github.com/images/spinner.gif) 50% 50%
		no-repeat;
}

/* slideshow images (for most of the demos, these are the actual "slides") */
.cycle-slideshow img {
	/* 
    some of these styles will be set by the plugin (by default) but setting them here
    helps avoid flash-of-unstyled-content
    */
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	padding: 0;
	display: block;
}

/* in case script does not load */
.cycle-slideshow img:first-child {
	position: static;
	z-index: 100;
}

/* pager */
.cycle-pager {
	text-align: center;
	width: 100%;
	z-index: 500;
	position: absolute;
	top: 10px;
	overflow: hidden;
}

.cycle-pager span {
	font-family: arial;
	font-size: 50px;
	width: 16px;
	height: 16px;
	display: inline-block;
	color: #ddd;
	cursor: pointer;
}

.cycle-pager span.cycle-pager-active {
	color: #337cbb;
}

.cycle-pager>* {
	cursor: pointer;
}
</style>
<c:set value="${requestScope.posting }" var="fund"></c:set>
<c:set value="${requestScope.posting.photoList }" var="photoList"></c:set>

<div class="section">
	<div class="container">
		<div class="row" align="center" style="font-family: &amp; amp;">
			<h1>${fund.fundName}</h1>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<br>
			<div class="col-md-6">
				<div class="cycle-slideshow" data-cycle-fx="scrollHorz"
					data-cycle-pause-on-hover="true" data-cycle-speed="500"
					data-cycle-loader="wait" data-cycle-timeout="5000"
					data-cycle-easing="linear">
					<!-- empty element for pager links -->
					<div class="cycle-pager"></div>
					<c:forEach items="${photoList}" var="photo" varStatus="i">
						<img id="fundPhoto" src="${initParam.root }/upload/${photo.realName}">
					</c:forEach>
				</div>
			</div>
			<div class="col-md-6" align="center">
				<h4>
					<span style="font-family: &amp; amp;"><br><strong>모금세부 정보</strong></span>
				</h4>
				<table style="font-family: &amp; amp;" class="table">
					<tbody>
						<tr>
							<th><font size="3">목표액</font></th>
							<td><font size="3">${fund.goalSum } 원</font></td>
						</tr>

						<tr>
							<th><font size="3">현재 모금액</font></th>
							<td><font size="3">${fund.curSum } 원</font></td>
						</tr>

						<tr>
							<th colspan="1"><font size="3">집행시기</font></th>
							<td colspan="3"><font size="3">${fund.startDate } ~
									${fund.dueDate }</font></td>
						</tr>

						<tr>
							<th colspan="1"><font size="3">주관기관</font></th>
							<td colspan="3"><font size="3">${fund.proposal }</font></td>
						</tr>

						<tr>
							<th colspan="1"><font size="3">관련링크</font></th>
							<td colspan="3"><a href="${fund.homepage }"><font
									size="3">${fund.homepage }</font></a></td>
						</tr>
					</tbody>
					<tfoot>
						<tr align="center">
							<td colspan="1">
								<link rel="stylesheet"
									href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
								<a id="modal-755773" href="#modal-container-755773" role="button"
								class="btn btn-default" data-toggle="modal">기부하기</a>
								<div class="modal fade" id="modal-container-755773" role="dialog"
									aria-labelledby="myModalLabel" aria-hidden="true">
									<div class="modal-dialog">
										<div class="modal-content">
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal"
													aria-hidden="true">×</button>

												<h4 class="modal-title" id="myModalLabel">기부하기</h4>

											</div>
											<div class="modal-body">

												<form name="coneForm">
													기부하시겠습니까?<br> 기부할 콘 : <input type="text"
														name="coneCount" size="10" maxlength="8">cone <br>보유콘
													: ${sessionScope.mvo.point }<br>
												</form>

											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">취소</button>
												<button onclick="gibuCone()" type="button"
													class="btn btn-default">기부</button>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td colspan="2"><a class="btn btn-default" type="submit">즐겨찾기</a></td>
							<td colspan="2"><a class="btn btn-default"
								href="${initParam.root }fund/getList.gibu?no=${requestScope.posting.fundNo}">목록보기</a></td>
							<td></td>
						</tr>
					</tfoot>
				</table>
			</div>
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
							<div class="col-md-offset-2 col-md-8 col-md-offset-2">
								<table class="table" style="font-family: &amp; amp;">
									<thead>
										<tr>
											<th width="100">NO</th>
											<th width="1000">comment</th>
											<th width="200">작성일</th>
											<th width="200">작성자</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="comment" items="${requestScope.comment.list}">
											<tr>
												<td>${comment.commentNo }</td>
												<td>${comment.text }</td>
												<td>${comment.commentTime }</td>
												<td>${comment.memberVO.id }</td>
												<td><c:if
														test="${comment.memberVO.id==sessionScope.mvo.id }">
														<input class="btn btn-default" value="삭제하기" type="button"
															onclick="deleteComment(${comment.commentNo}, ${requestScope.fvo.boardNo} )">
													</c:if></td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-offset-6 col-md-2 col-md-offset-4">
								<ul class="pagination">
									<c:set var="pb" value="${requestScope.comment.pagingBean}"></c:set>
									<c:if test="${pb.previousPageGroup}">
										<li><a
											href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${pb.startPageOfPageGroup-1}">◀</a>
										</li>
									</c:if>
									<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<a
												href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${i }">${i }</a>
										</c:forEach></li>
									<c:if test="${pb.nextPageGroup}">
										<li><a
											href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${pb.endPageOfPageGroup+1}">▶</a>
										</li>
									</c:if>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
