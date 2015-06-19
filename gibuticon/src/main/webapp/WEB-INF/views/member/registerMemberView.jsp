<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$("#registerBtn").click(function() {
			if ($("#password").val() != $("#passwordCheck").val()) {
				$("#passCheckM").html("패스워드가 일치하지 않습니다.");
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
												<span style="font-family: &amp; quot;">회원가입</span>
											</h1>
										</div>
										<br> <br>
										<form:form class="form-horizontal" name="registerForm"
											action="registerMember.gibu" commandName="memberVO"
											method="post" id="registForm">
											<div class="form-group">
												<label for="inputId" class="col-sm-2 control-label">아이디</label>
												<div class="col-sm-6">
													<form:input type="text" class="form-control" id="id"
														name="id" placeholder="id" path="id" />
													<p class="help-block">
														<form:errors path="id" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputPassword" class="col-sm-2 control-label">비밀번호</label>
												<div class="col-sm-6">
													<form:input type="password" class="form-control"
														id="password" name="password" placeholder="password"
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
													<input type="password" class="form-control"
														id="passwordCheck" name="passwordCheck"
														placeholder="password check">
													<p class="help-block" id="passCheckM"></p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputName" class="col-sm-2 control-label">이름</label>
												<div class="col-sm-6">
													<form:input type="text" class="form-control" id="name"
														name="name" placeholder="name" path="name" />
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
														name="address" placeholder="address" path="address" />
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
														name="tel" placeholder="tel" path="tel" />
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
														name="birth" placeholder="birth" path="birth" />
													<p class="help-block">
														<form:errors path="birth" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<label for="inputEmail" class="col-sm-2 control-label">이메일</label>
												<div class="col-sm-6">
													<form:input type="email" class="form-control" id="email"
														name="email" placeholder="e-mail" path="email" />
													<p class="help-block">
														<form:errors path="email" />
													</p>
												</div>
											</div>
											<br>
											<div class="form-group">
												<div class="col-sm-6">
													<a href="${initParam.root}registerResult.gibu"> <input
														class="btn btn-default"
														type="submit" value="회원가입 "></a>
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