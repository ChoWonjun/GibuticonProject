<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
</head>

<body>
	<div class="navbar navbar-default navbar-static-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#navbar-ex-collapse">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="home.gibu">Gibuticon</a>
			</div>
			<div class="collapse navbar-collapse" id="navbar-ex-collapse">
				<ul class="nav navbar-nav navbar-right">
					<li class="active"><a href="home.gibu">Home</a></li>
					<li><a href="#">Contacts</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="section text-left" id="registerMemberForm">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-success">
						<div class="panel-heading">
							<h5 class="panel-title" contenteditable="true">회원가입</h5>
						</div>
						<div class="panel-body">
							<p>회원정보는 기부티콘 &nbsp;이외의 어떠한 서비스에도 공유하지 않고 보호됩니다.</p>
						</div>
					</div>
					<form:form name="registerForm" action="registerMember.gibu"
						commandName="memberVO" method="post">
						<div class="form-group has-feedback" id="id">
							<label class="control-label" for="exampleInputEmail1">아이디</label>
							<form:input class="form-control" id="id" placeholder="ID"
								type="text" name="id" path="id" />
							<p class="help-block">
								<form:errors path="id" />
							</p>
						</div>
						<div class="form-group" id="password">
							<label class="control-label" for="exampleInputPassword1">비밀번호</label>
							<form:input class="form-control" id="password"
								placeholder="Password" type="password" name="password"
								path="password" />
							<p class="help-block">
								<form:errors path="password" />
							</p>
						</div>
						<div class="form-group" id="name">
							<label class="control-label">이름</label> <input
								class="form-control" type="text" placeholder="Name" name="name" />
							<p class="help-block">
								<form:errors path="name" />
							</p>
						</div>
						<div class="form-group" id="address">
							<label class="control-label">주소</label>
							<form:input class="form-control" type="text"
								placeholder="Address" name="address" id="address" path="address" />
							<p class="help-block">
								<form:errors path="address" />
							</p>
						</div>
						<div class="form-group" id="tel">
							<label class="control-label">전화번호</label>
							<form:input class="form-control" type="text" placeholder="Tel"
								name="tel" id="tel" path="tel" />
							<p class="help-block">
								<form:errors path="tel" />
							</p>
						</div>
						<div class="form-group" id="birth">
							<label class="control-label">생년월일</label>
							<form:input class="form-control" type="date" placeholder="Birth"
								name="birth" id="birth" path="birth" />
							<p class="help-block">
								<form:errors path="birth" />
							</p>
						</div>
						<div class="form-group" id="email">
							<label class="control-label">이메일</label>
							<form:input class="form-control" type="email"
								placeholder="E-mail" name="email" id="email" path="email" />
							<p class="help-block">
								<form:errors path="email" />
							</p>
						</div>
						<div class="row">
							<div class="col-md-12">
								<input type="submit" class="btn btn-success" value="회원가입">
							</div>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
	<footer class="section section-success">
		<div class="container">
			<div class="row">
				<div class="col-sm-6">
					<h1>Gibuticon</h1>
					<p>Kosta 94기 끝까지가조 final project</p>
				</div>
				<div class="col-sm-6">
					<p class="text-info text-right">
						<br> <br>
					</p>
					<div class="row">
						<div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
							<a href="#"><i
								class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a> <a
								href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
							<a href="#"><i
								class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a> <a href="#"><i
								class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
						</div>
					</div>
					<div class="row">
						<div class="col-md-12 hidden-xs text-right">
							<a href="#"><i
								class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a> <a
								href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
							<a href="#"><i
								class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a> <a href="#"><i
								class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>

</html>