<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<script type="text/javascript"
	src="${initParam.root }layoutit/src/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
<div class="section text-center">
	<div class="container">
		<div class="row text-center">
			<div class="col-md-1\2">
				<a href="home.gibu"> <img
					src="file:///C:/Users/SooHyun/Desktop/콩.png"
					class="center-block img-responsive img-thumbnail" height="100"
					width="100"></a>
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<form:form class="form-horizontal" role="form" action="login.gibu"
					commandName="loginForm" method="post">
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputEmail3" class="control-label">User Name</label>
						</div>
						<div class="col-sm-10">
							<form:input type="text" class="form-control input-lg" id="id"
								name="id" placeholder="User Name" path="id" />
							<p class="help-block">
								<form:errors path="id" />
							</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-2">
							<label for="inputPassword3" class="control-label">Password</label>
						</div>
						<div class="col-sm-10">
							<form:input type="password" class="form-control input-lg"
								id="password" name="password" placeholder="Password"
								path="password" />
							<p class="help-block">
								<form:errors path="password" />
							</p>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<div class="checkbox">
								<label> <input type="checkbox">Remember me
								</label>
							</div>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-offset-2 col-sm-10">
							<button type="submit" class="btn btn-default">Login</button>
						</div>
					</div>
				</form:form>
				<br>
				<div class="col-sm-offset-2 col-sm-100">
					<a href="#">아이디찾기 | </a> <a href="#">비밀번호찾기 | </a> <a
						href="registerMemberView.gibu">회원가입</a>
				</div>
			</div>
		</div>
	</div>
</div>