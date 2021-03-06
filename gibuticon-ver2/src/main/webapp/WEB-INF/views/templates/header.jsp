<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">
<%--위에꺼 주석처리하면 로그인했을때랑 로그아웃했을때랑 글씨체가 달라져요.. 주석처리 하지 마세요 --%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<script type="text/javascript">
	function getGivenCone() {
		$.ajax({
			type : "post",
			url : "${initParam.root}member/getGivenCone.gibu",
			data : "id=${sessionScope.mvo.id}",
			success : function(result) {
				$("#givenCone").text(result);
			}//success
		});//ajax
		
		
	}
	function sendMessagePopup(receiverId) {
		var url = "${initParam.root}message/sendForm.gibu?receiverId="
				+ receiverId;
		window
				.open(url, "message",
						"width=420, height=460, teop=150, left=200");
	}

	$(document)
			.ready(
					function() {
						// 로그인 되어있을 때만 기부한 콘을 불러옴
						if("${sessionScope.mvo.id}")
							getGivenCone();
						
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
														success : function(
																message) {
															if (message == "ok") {
																var data = "충전이 완료되었습니다.";
																data += "<br>";
																data += "<input class='btn btn-default' type='button' value='닫기' data-dismiss='modal' onclick='javascript:location.reload()'>";
																$("#test")
																		.html(
																				data);
															} else if (message == "fail") {
																alert("Pin 번호를 확인하세요.");
																$("#1stPin")
																		.val("")
																		.focus();
																$("#2ndPin")
																		.val("");
																$("#3rdPin")
																		.val("");
															}

														}
													});

										});
					});

	function sendMessagePopup(receiverId) {
		var url = "${initParam.root}message/sendForm.gibu?receiverId="
				+ receiverId;
		window
				.open(url, "message",
						"width=420, height=460, teop=150, left=200");
	}
	function getMessageListPopup() {
		var url = "${initParam.root}message/getReceiveList.gibu";
		window
				.open(url, "message",
						"width=420, height=460, teop=150, left=200");
	}
	function giftPopup() {
		var url = "${initParam.root }cone/giftForm.gibu";
		window.open(url, "gift", "width=350, height=350, teop=150, left=200");
	}
</script>

<div class="navbar navbar-default">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-ex-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${initParam.root}home.gibu"><span>Gibuticon</span></a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-ex-collapse">
			<ul class="nav navbar-nav navbar-left">
				<li><a href="${initParam.root}introduce_gibuticon.gibu">사이트소개</a></li>
				<li><a href="${initParam.root}notice/getList.gibu">공지사항</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-hover="dropdown" data-delay="1000" data-close-others="false"
					data-toggle="dropdown"> 모금함 <b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1"
							href="${initParam.root}fund/getList.gibu"><strong>전체보기</strong></a>
						</li>
						<li class="divider"></li>
						<li><a tabindex="-1"
							href="${initParam.root }fund/getList.gibu?&category=어린이"><strong>어린이</strong></a></li>
						<li><a tabindex="-1"
							href="${initParam.root }fund/getList.gibu?&category=어르신"><strong>어르신</strong></a></li>
						<li><a tabindex="-1"
							href="${initParam.root }fund/getList.gibu?&category=장애인"><strong>장애인</strong></a></li>
						<li><a tabindex="-1"
							href="${initParam.root }fund/getList.gibu?&category=캠페인"><strong>캠페인</strong></a></li>
						<c:if test="${sessionScope.mvo.admin=='yes'}">
							<li class="divider"></li>
							<li><a tabindex="-1"
								href="${initParam.root }fund/writeForm.gibu"><strong>모금
										등록</strong></a></li>
						</c:if>
					</ul></li>
				<li><a href="${initParam.root }fund/currentState.gibu">모금현황</a></li>
				<li><a href="${initParam.root}freeBoard/getList.gibu">자유게시판</a></li>
			</ul>
			<c:choose>
				<c:when test="${sessionScope.mvo==null}">
					<ul class="nav navbar-nav navbar-right">
						<li><a id="modal-755773" href="#modal-container-755773"
							data-toggle="modal">로그인</a></li>
					</ul>
					<div class="modal fade" id="modal-container-755773" role="dialog">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">&nbsp;LogIn</h4>
								</div>
								<div class="modal-body">
									<div class="section text-center">
										<a href="${initParam.root}home.gibu"> <img
											src="${initParam.root }img\g_cone.png"
											class="center-block img-responsive img-thumbnail"
											height="100" width="100"></a><br>
										<form class="form-horizontal"
											action="${initParam.root}member/login.gibu" method="post">
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<input type="text" class="form-control input-lg" id="id"
														name="id" placeholder="User Name" path="id" />
													<p class="help-block">
														<errors path="id" />
													</p>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<input type="password" class="form-control input-lg"
														id="password" name="password" placeholder="Password"
														path="password" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<div class="checkbox">
														<label> <input type="checkbox">Remember me
														</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<input type="hidden" id="prev" name="prev"
														value="${param.prev }">
													<button type="submit" class="btn btn-default"
														id="loginForm">LogIn</button>
												</div>
												<br> <br> <a
													href="${initParam.root }member/findIdForm.gibu">아이디찾기 |
												</a> <a href="${initParam.root }member/findPasswordForm.gibu">비밀번호찾기
													| </a> <a
													href="${initParam.root}member/registerMemberForm.gibu">회원가입</a>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<%--로그인 했을때 보이는 헤더--%>
				<c:otherwise>
					<link rel="stylesheet"
						href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-hover="dropdown" data-toggle="dropdown" data-delay="1000">
								${sessionScope.mvo.id }님<b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1"
									href="${initParam.root }member/mypage.gibu"><strong>&nbsp;&nbsp;&nbsp;마이페이지</strong></a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="#"><strong>&nbsp;&nbsp;&nbsp;기부한콘</strong>
										<span id="givenCone"></span>개</a></li>
								<li><a tabindex="-1"
									href="${initParam.root }cone/mycone.gibu"><strong>&nbsp;&nbsp;&nbsp;보유한콘</strong>
										${sessionScope.mvo.point }개 </a></li>
								<li class="divider"></li>
								<li><a tabindex="-1"
									href="${initParam.root }friend/friendlist.gibu?myId=${sessionScope.mvo.id}"><strong>&nbsp;&nbsp;&nbsp;친구목록</strong></a></li>
								<li><a tabindex="-1"
									href="javascript:getMessageListPopup()"><strong>&nbsp;&nbsp;&nbsp;쪽지목록</strong></a></li>
								<li><a tabindex="-1" href="javascript:sendMessagePopup()"><strong>&nbsp;&nbsp;&nbsp;쪽지보내기</strong></a></li>
								<li class="divider"></li>
								<li><a tabindex="-1"
									href="${initParam.root }member/logout.gibu"><strong>&nbsp;&nbsp;&nbsp;로그아웃</strong></a></li>
							</ul></li>

						<li><a href="javascript:giftPopup()">선물하기</a></li>
						<li><a id="modal-755774" href="#modal-container-755774"
							data-toggle="modal">충전하기</a></li>
						<div class="modal fade" id="modal-container-755774" role="dialog"
							aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal"
											aria-hidden="true">×</button>
										<h2 class="modal-title" id="myModalLabel">충전하기</h2>
									</div>
									<div class="modal-body">
										<div class="section text-center" id="test">
											<form name="chargeCone" id="chargeCone">
												결제수단 <input type="radio" name="payment" value="mobile">
												휴대폰 <input type="radio" name="payment" value="transfer">
												계좌이체 <input type="radio" name="payment" value="credit">
												신용카드 <input type="radio" name="payment" value="gibuticon">
												기부티콘
												<hr>
												<div id="charge1">
													충전단위 <select id="coneValSel">
														<option value="">-선택-</option>
														<option value="10">10cone</option>
														<option value="20">20cone</option>
														<option value="30">30cone</option>
														<option value="50">50cone</option>
														<option value="100">100cone</option>
														<option value="self">직접입력</option>
													</select> <span id="coneInput">직접입력 <input type=text
														id=selfConeVal>cone
													</span> <br> <br> 결제금액 <input type="text"
														disabled="disabled" name="coneVal" id="coneVal" value="0">
													X100원=<input type="text" disabled="disabled" name="payVal">원
												</div>
												<div id="charge2">
													<span>Pin NO <input size="5" type=text id=1stPin>-<input
														size="5" type=text id=2ndPin>-<input type=text
														size="5" id=3rdPin>
													</span>
												</div>
												<hr>
												<input class="btn btn-primary" type="button" value="충전"
													id="chargeButton"> <input class="btn btn-default"
													type="button" value="취소" data-dismiss="modal">
											</form>
										</div>
									</div>
								</div>
							</div>
						</div>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
</div>
