<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Bootstrap 3, from LayoutIt!</title>
 <script type="text/javascript" src="${initParam.root }layoutit/src/js/jquery-1.11.3.min.js"></script>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- <script type="text/javascript">
	function login(){
		location.href="login.gibu";
	}
</script> -->
</head>
<body>
<div class="container">
	<div class="row clearfix">
		<div class="col-md-4 column">
		</div>
		<div class="col-md-4 column">
			<h3 class="text-center">
				Gibuticon.
			</h3>
			<form class="form-horizontal" action="${initParam.root }login.gibu">
			<input type="hidden" name="type" value="${requestScope.type }">
				<div class="form-group">
					 <label for="inputEmail3" class="col-sm-2 control-label">Email</label>
					<div class="col-sm-10">
						<input type="text" class="form-control" name="id" id="inputEmail3">
					</div>
				</div>
				<div class="form-group">
					 <label for="inputPassword3" class="col-sm-2 control-label">Password</label>
					<div class="col-sm-10">
						<input type="password" class="form-control" name="password" id="inputPassword3">
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						<div class="checkbox">
							 <label><input type="checkbox"> 아이디 저장하기</label>
						</div>
					</div>
				</div>
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">
						 <input type="submit" class="btn btn-default" value="로그인">
					</div>
				</div>
			</form>
			 <span class="label label-default"><a href="#">아이디 찾기</a></span> <span class="label label-default"><a href="#">비밀번호 찾기</a></span> <span class="label label-default"><a href="#">회원가입</a></span>
		</div>
		<div class="col-md-4 column">
		</div>
	</div>
	<div class="row clearfix">
		<div class="col-md-12 column" align="center">
			<ul class="breadcrumb">
				<li>
					<a href="#">이용약관</a> <span class="divider">/</span>
				</li>
				<li>
					<a href="#">개인정보 취급방침</a> <span class="divider">/</span>
				</li>
				<li>
					<a href="#">회원정보 고객센터</a>
				</li>
			</ul>
		</div>
	</div>
</div>
</body>
</html>