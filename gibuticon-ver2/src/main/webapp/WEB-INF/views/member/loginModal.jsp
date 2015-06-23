<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<style>
.modal-header,h4,.close {
	background-color: #5cb85c;
	color: white !important;
	text-align: center;
	font-size: 30px;
}

.modal-footer {
	background-color: #f9f9f9;
}
</style>
<script>
	$(document).ready(function() {
		$("#myBtn").click(function() {
			$("#myModal").modal();
		});
	});
</script>

<div class="modal-body" style="padding: 40px 50px;">
	<form role="form">
		<div class="form-group">
			<label for="usrname"><span class="glyphicon glyphicon-user"></span>
				Username</label> <input type="text" class="form-control" id="usrname"
				placeholder="Enter email">
		</div>
		<div class="form-group">
			<label for="psw"><span class="glyphicon glyphicon-eye-open"></span>
				Password</label> <input type="text" class="form-control" id="psw"
				placeholder="Enter password">
		</div>
		<div class="checkbox">
			<label><input type="checkbox" value="" checked>Remember
				me</label>
		</div>
		<button type="submit" class="btn btn-success btn-block">
			<span class="glyphicon glyphicon-off"></span> Login
		</button>
	</form>
</div>
<div class="modal-footer">
	<button type="submit" class="btn btn-danger btn-default pull-left"
		data-dismiss="modal">
		<span class="glyphicon glyphicon-remove"></span> Cancel
	</button>
	<p>
		Not a member? <a href="#">Sign Up</a>
	</p>
	<p>
		Forgot <a href="#">Password?</a>
	</p>
</div>
