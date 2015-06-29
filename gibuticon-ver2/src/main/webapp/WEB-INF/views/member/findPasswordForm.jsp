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
							var id = $("#mid").val().trim();
							var email = $("#email").val().trim();
							$("#findPasswordResult").html("");
							$.ajax({
								type : "post",
								url : "findPassword.gibu?name=" + name + "&id=" + id + "&email="
										+ email,
								success : function(data) {
									if (data == "fail") {
										$("#findPasswordResult").html(
												"일치하는 회원 정보가 존재하지 않습니다.").css(
												"color", "red");
									} else {
										$("#findPasswordResult").html(
												data).css("color",
												"green");
									}
								}
							});
						});
			});
</script>
<h2>비밀번호 찾기</h2>
회원가입시 입력하신 이름, 아이디, 이메일 주소를 입력하세요.
<form action="member/findPassword.gibu" id="findPasswordForm"
	name="findPasswordForm">
	이름 <input type="text" id="name" name="name" placeholder="Name"><br>
	아이디 <input type="text" id="mid" name="mid" placeholder="ID"><br>
	이메일 <input type="email" id="email" name="email" placeholder="E-mail"><br>
	<input type="button" id="findBtn" name="findBtn" value="비밀번호 찾기">
</form>
<div id="findPasswordResult"></div>
<br>
<a href="${initParam.root }member/loginModal.gibu">로그인</a>