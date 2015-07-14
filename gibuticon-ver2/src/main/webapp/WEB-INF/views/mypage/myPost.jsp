<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#coneInput").hide();
						$("#coneValSel")
								.change(
										function() {
											chargeCone.coneVal.value = "";
											chargeCone.payVal.value = "";
											$("#coneInput").hide();
											if ($("#coneValSel").val() == "") {
												alert("수량을 선택하세요!");
												return;
											} else if ($("#coneValSel").val() == "self") {
												$("#coneInput").show();
											} else {
												chargeCone.coneVal.value = $(
														"#coneValSel").val();
												chargeCone.payVal.value = chargeCone.coneVal.value * 100;
											}
										});
						$("#selfConeVal")
								.keyup(
										function() {
											if (isNaN($("#selfConeVal").val())) {
												$("#selfConeVal").val("");
												alert("숫자로만 입력하세요!");
											}
											chargeCone.coneVal.value = $(
													"#selfConeVal").val();
											chargeCone.payVal.value = chargeCone.coneVal.value * 100;
										});
						$("#chargeButton")
								.click(
										function() {
											if (chargeCone.payVal.value == "")
												alert("충전단위를 선택하세요!");
											else if (chargeCone.coneVal.value < 10)
												alert("충전단위를 10개 이상 입력해주세요!");
											else if ($("#chargeCone :radio[name=payment]:checked").length == 0) {
												alert("결제방식을 선택하세요!");
											} else {
												$
														.ajax({
															type : "get",
															url : "${initParam.root}cone/charge.gibu",
															data : "id=${sessionScope.mvo.id }&point="
																	+ chargeCone.coneVal.value
																	+ "&paymentType="
																	+ $(
																			"#chargeCone :radio[name=payment]:checked")
																			.val(),
															success : function() {
																var data = "충전이 완료되었습니다.";
																data += "<br>";
																data += "<input class='btn btn-default' type='button' value='취소' data-dismiss='modal' onclick='javascript:location.reload()'>";
																$("#test")
																		.html(
																				data);
															}
														});
											}
										});
					});
	$(document)
			.ready(
					function() {
						$("#coneInput").hide();
						$("#charge2").hide();
						$("input[name=payment]", "#chargeCone")
								.change(
										function() {
											if ($(
													"input[name=payment]:checked",
													"#chargeCone").val() == "gibuticon") {
												$("#charge1").hide();
												$("#charge2").show();
											} else {
												$("#charge1").show();
												$("#charge2").hide();
											}
										});
						$("#1stPin").keyup(function() {
							if ($("#1stPin").val().length == 5)
								$("#2ndPin").focus();
						});
						$("#2ndPin").keyup(function() {
							if ($("#2ndPin").val().length == 5)
								$("#3rdPin").focus();
						});
						$("#coneValSel")
								.change(
										function() {
											chargeCone.coneVal.value = "";
											chargeCone.payVal.value = "";
											$("#coneInput").hide();
											if ($("#coneValSel").val() == "") {
												alert("수량을 선택하세요!");
												return;
											} else if ($("#coneValSel").val() == "self") {
												$("#coneInput").show();
											} else {
												chargeCone.coneVal.value = $(
														"#coneValSel").val();
												chargeCone.payVal.value = chargeCone.coneVal.value * 100;
											}
										});
						$("#selfConeVal")
								.keyup(
										function() {
											if (isNaN($("#selfConeVal").val())) {
												$("#selfConeVal").val("");
												alert("숫자로만 입력하세요!");
											}
											chargeCone.coneVal.value = $(
													"#selfConeVal").val();
											chargeCone.payVal.value = chargeCone.coneVal.value * 100;
										});
						$("#chargeButton")
								.click(
										function() {
											if ($(
													"input[name=payment]:checked",
													"#chargeCone").val() != "gibuticon") {
												if (chargeCone.payVal.value == "") {
													alert("충전단위를 선택하세요!");
													return false;
												} else if (chargeCone.coneVal.value < 10) {
													alert("충전단위를 10개 이상 입력해주세요!");
													return false;
												} else if ($("#chargeCone :radio[name=payment]:checked").length == 0) {
													alert("결제방식을 선택하세요!");
													return false;
												}
											} else if ($(
													"input[name=payment]:checked",
													"#chargeCone").val() == "gibuticon") {
												if ($("#1stPin").val() == ""
														|| $("#2ndPin").val() == ""
														|| $("#3rdPin").val() == "") {
													alert("Pin NO를 확인해주세요");
													return false;
												}
											}
											$
													.ajax({
														type : "get",
														url : "${initParam.root}cone/charge.gibu",
														data : "id=${sessionScope.mvo.id }&point="
																+ chargeCone.coneVal.value
																+ "&paymentType="
																+ $(
																		"#chargeCone :radio[name=payment]:checked")
																		.val()
																+ "&pinNo="
																+ $("#1stPin")
																		.val()
																+ $("#2ndPin")
																		.val()
																+ $("#3rdPin")
																		.val(),
														success : function(data) {
															data = "충전이 완료되었습니다.";
															data += "<br>";
															data += "<input class='btn btn-default' type='button' value='닫기' data-dismiss='modal' onclick='javascript:location.reload()'>";
															$("#test").html(
																	data);
														}
													});

										});
					});
</script>
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">

<div class="row">
	<div class="col-md-8 col-md-offset-1">
		<table class="type09" style="font-family: &amp; amp;">
			<thead>
				<tr>
					<th width="100">NO</th>
					<th width="800">제목</th>
					<th width="300">작성일</th>
					<th width="300">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:choose>
					<c:when test="${sessionScope.mvo!=null}">
						<c:forEach items="${requestScope.lvo.list}" var="board">
							<tr>
								<td>${board.boardNo}</td>
								<td><a
									href="${initParam.root }freeBoard/showContent.gibu?no=${board.boardNo}&id=${sessionScope.mvo.id}">${board.title}</a></td>
								<td>${board.writeDate}</td>
								<td>${board.hits}</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<c:forEach items="${requestScope.lvo.list}" var="board">
							<tr>
								<td>${board.boardNo}</td>
								<td>${board.title}</td>
								<td>${board.writeDate}</td>
								<td>${board.memberVO.name}</td>
								<td>${board.hits}</td>
							</tr>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		<div class="col-md-offset-3 col-md-6 col-md-offset-3" align="center">
			<ul class="pagination">
				<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
				<c:if test="${pb.previousPageGroup}">

					<li><a
						href="${initParam.root }freeBoard/myPost.gibu?pageNo=${pb.startPageOfPageGroup-1}&myId=${sessionScope.mvo.id}">Prev</a>
					</li>
				</c:if>
				<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<a
							href="${initParam.root }freeBoard/myPost.gibu?pageNo=${i}&myId=${sessionScope.mvo.id}">${i}</a>
					</c:forEach></li>
				<c:if test="${pb.nextPageGroup}">
					<li><a
						href="${initParam.root }freeBoard/myPost.gibu?pageNo=${pb.endPageOfPageGroup+1}&myId=${sessionScope.mvo.id}">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
