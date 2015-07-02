<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$()
			.ready(
					function() {
						$("#findBtn")
								.click(
										function() {
											var name = $("#name").val().trim();
											var id = $("#mid").val().trim();
											var email = $("#email").val()
													.trim();
											$("#findPasswordResult").html("");
											$
													.ajax({
														type : "post",
														url : "findPassword.gibu?name="
																+ name
																+ "&id="
																+ id
																+ "&email="
																+ email,
														success : function(data) {
															if (data == "fail") {
																$(
																		"#findPasswordResult")
																		.html(
																				"일치하는 회원 정보가 존재하지 않습니다.")
																		.css(
																				"color",
																				"red");
															} else {
																if (data == "ok") {
																	$(
																			"#findPasswordResult")
																			.html(
																					"비밀번호 안내 메일을 발송했습니다.")
																			.css(
																					"color",
																					"green");
																} else if (data == "fail") {
																	$(
																			"#findPasswordResult")
																			.html(
																					"비밀번호 안내 메일을 발송하는데 실패했습니다.")
																			.css(
																					"color",
																					"red");
																}
															}
														}
													});
										});
					});
</script>

<div class="col-md-8 col-md-offset-4">
	<br>
	<br>
	<br>
	<br> <img src="${initParam.root}img\g_find_password.jpg"
		width="500"> <br>
	<br>
	<br> 회원가입시 입력하신 이름, 아이디, 이메일 주소를 입력하세요. <br>
	<br>
	<form action="member/findPassword.gibu" id="findPasswordForm"
		name="findPasswordForm">
		이름<br> <input style="width: 500px;" class="form-control col-md-3"
			type="text" id="name" name="name" placeholder="Name"><br>
		<br>
		<br> 아이디<br> <input style="width: 500px;"
			class="form-control col-md-3" type="text" id="mid" name="mid"
			placeholder="ID"><br>
		<br>
		<br> 이메일<br> <input style="width: 500px;"
			class="form-control col-md-3" type="email" id="email" name="email"
			placeholder="E-mail"><br>
		<br>
		<div id="findPasswordResult"></div>
		<br> <input type="button" class="btn btn-default" id="findBtn"
			name="findBtn" value="비밀번호 찾기">
	</form>
	<br> <a href="${initParam.root }member/loginModal.gibu">로그인</a>
</div>