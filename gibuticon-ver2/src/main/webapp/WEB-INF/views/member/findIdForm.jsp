<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$().ready(
			function() {
				$("#findBtn").click(
						function() {
							var name = $("#name").val().trim();
							var email = $("#email").val().trim();
							$("#findIdResult").html("");
							$.ajax({
								type : "post",
								url : "findId.gibu?name=" + name + "&email="
										+ email,
								success : function(data) {
									if (data == "fail to find id") {
										$("#findIdResult").html(
												"일치하는 회원 정보가 존재하지 않습니다.").css(
												"color", "red");
									} else {
										$("#findIdResult").html(
												name + "님의 아이디는 " + data
														+ " 입니다.").css("color",
												"green");
									}
								}
							});
						});
			});
</script>
<div class="col-md-8 col-md-offset-3">
	<h2>아이디 찾기</h2>
	회원가입시 입력하신 이름과 이메일 주소를 입력하세요.



	<form action="member/findId.gibu" id="findIdForm" name="findIdForm">
		 이름 <br>
		<input style="width: 500px;" type="text" class="form-control col-md-3"
			id="name" name="name" placeholder="Name"> <br>
		
		이메일<br>
		<input style="width: 500px;" type="email" class="form-control"
			id="email" name="email" placeholder="E-mail">
		
		 <input type="button" id="findBtn" name="findBtn" value="아이디 찾기">
	</form>
	<div id="findIdResult"></div>
	<br> <a href="${initParam.root }member/loginModal.gibu">로그인</a>
</div>

<%-- 
	<form action="member/findId.gibu" id="findIdForm" name="findIdForm">

		이름 <input type="text" class="form-control col-md-3"  id="name" name="name" placeholder="Name"><br>
		이메일 <input type="email" class="form-control" id="email" name="email" placeholder="E-mail">
		<input type="button" id="findBtn" name="findBtn" value="아이디 찾기">
	</form>
	<div id="findIdResult"></div>
	<br> <a href="${initParam.root }member/loginModal.gibu">로그인</a> --%>


