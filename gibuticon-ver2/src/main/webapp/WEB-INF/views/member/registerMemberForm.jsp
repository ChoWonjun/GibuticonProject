<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#passwordCheck").keyup(function() {
					if ($("#passwordCheck").val() == $("#password").val()) {
						$("#passCheckM").text("");
					}
					if ($("#passwordCheck").val() != $("#password").val()) {
						$("#passCheckM").text("패스워드가 일치하지 않습니다.");
					}
				});

				$("#mId").keyup(
						function() {
							var memberId = $("#mId").val().trim();
							//trim() : 공란제거
							$("#idCheckForm").text("");
							$.ajax({
								type : "post",
								url : "idCheck.gibu?id=" + memberId,
								success : function(data) {
									if (data == "fail") {
										$("#idCheckForm")
												.text("이미 존재하는 id입니다.").css(
														"color", "red");
									}
								}
							});
						});

				$("#email").keyup(
						function() {
							var memberEmail = $("#email").val().trim();
							//trim() : 공란제거
							$("#emailCheckForm").text("");
							$.ajax({
								type : "post",
								url : "emailCheck.gibu?email=" + memberEmail,
								success : function(data) {
									if (data == "fail") {
										$("#emailCheckForm").text(
												"이미 등록된 e-mail입니다.").css(
												"color", "red");
									}
								}
							});
						});
				$("#registerBtn").click(function() {
					if ($("#passCheckM").text() != "") {
						$("#passwordCheck").focus();
						return false;
					} else if ($("#idCheckForm").text() != "") {
						$("#mId").focus();
						return false;
					} else if ($("#emailCheckForm").text() != "") {
						$("#email").focus();
						return false;
					} else {
						$("#registForm").submit();
					}
				});

			});
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-12">
								<div class="contentwrap">
									<article class="container">
										<div class="page-header">
											<h1>
												<span style="font-family: &amp; amp;">회원가입</span>
											</h1>
										</div>
										<br> <br>
										<form:form class="form-horizontal" name="registerForm"
											action="${initParam.root }member/registerMember.gibu"
											commandName="memberVO" method="post" id="registForm">
											<div class="form-group">
												<label for="inputId" class="col-sm-2 control-label">아이디</label>
												<div class="col-sm-6">
													<p id="idCheckForm"></p>
													<form:input type="text" class="form-control" id="mId"
														name="mId" placeholder="User Name" path="id" />
													<p class="help-block">
														<form:errors path="id" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputEmail" class="col-sm-2 control-label">이메일</label>
												<div class="col-sm-6">
													<p id="emailCheckForm"></p>
													<form:input type="email" class="form-control" id="email"
														name="email" placeholder="E-mail" path="email" />
													<p class="help-block">
														<form:errors path="email" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
												<div class="col-sm-6">
													<form:input type="password" class="form-control"
														id="password" name="password" placeholder="Password"
														path="password" />
													<p class="help-block">
														<form:errors path="password" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputPasswordCheck"
													class="col-sm-2 control-label">비밀번호 확인</label>
												<div class="col-sm-6">
													<p id="passCheckM"></p>
													<input type="password" class="form-control"
														id="passwordCheck" name="passwordCheck"
														placeholder="Password Check">
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputName" class="col-sm-2 control-label">이름</label>
												<div class="col-sm-6">
													<form:input type="text" class="form-control" id="name"
														name="name" placeholder="Name" path="name" />
													<p class="help-block">
														<form:errors path="name" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputAddress" class="col-sm-2 control-label">주소</label>
												<div class="col-sm-6">
													<form:input type="text" class="form-control" id="address"
														name="address" placeholder="Address" path="address" />
													<p class="help-block">
														<form:errors path="address" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputNumber" class="col-sm-2 control-label">휴대폰번호</label>
												<div class="col-sm-6">
													<form:input type="text" class="form-control" id="tel"
														name="tel" placeholder="Tel" path="tel" />
													<p class="help-block">
														<form:errors path="tel" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputBirth" class="col-sm-2 control-label">생년월일</label>
												<div class="col-sm-6">
													<form:input type="date" class="form-control" id="birth"
														name="birth" placeholder="Birth" path="birth" />
													<p class="help-block">
														<form:errors path="birth" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<div class="col-sm-6">
													<a href="#"> <input id="registerBtn"
														class="btn btn-default" type="button" value="회원가입 "></a>
												</div>
											</div>
										</form:form>
									</article>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>