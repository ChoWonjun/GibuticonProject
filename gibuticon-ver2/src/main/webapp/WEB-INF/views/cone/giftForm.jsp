<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$().ready(
			function() {
				var radios = document.selectTargetForm["target"];
				for (var i = [ 0 ]; i < radios.length; i++) {
					radios[i].onclick = radioClicked;
				}

				$("#giftToNonMemberDiv").hide();
				$("#giftToMemberDiv").hide();
				$("#giftBtn").click(
						function() {
							var price = $("input[name=price]:checked",
									"#giftForm").val();
							var sender = $("#senderId").val();
							var reciever = $("#reciever").val();
							if (confirm(reciever + " 로 " + price
									+ "콘을 선물하시겠습니까?")) {
								$("#giftResult").html("");
								$.ajax({
									type : "post",
									url : "giftToNonMember.gibu?price=" + price
											+ "&sender=" + sender
											+ "&reciever=" + reciever,
									success : function(data) {
										var result = data.split(" ", 2);
										if (result[0] == "ok") {
											$("#giftResult").html(
													"Gibuticon을 선물했습니다.").css(
													"color", "green");
											$("#point").html(result[1]);
											$("#reciever").val("");
										}
									}
								});
							}
						});
			});

	function radioClicked() {
		// 클릭한 라디오 버튼이 무엇인지 확인하고, 그에 따라
		// 알맞은 입력 요소를 사용 가능/불가능으로 전환!
		switch (this.value) {
		case "friend": {
			$("#giftToNonMemberDiv").hide();
			$("#giftToMemberDiv").show();
			break;
		}
		case "nonmem": {
			$("#giftToNonMemberDiv").show();
			$("#giftToMemberDiv").hide();
			break;
		}
		}
	}
</script>

</head>
<body>
	<h2>Gibuticon 선물하기</h2>
	내가 보유한 콘 :
	<span id="point">${sessionScope.mvo.point }</span>콘
	<br>
	<br>
	<form name="selectTargetForm">
		선물대상 <input type="radio" name="target" value="friend"> 친구 <input
			type="radio" name="target" value="nonmem"> 비회원<br> <br>
	</form>
	<div id="giftToNonMemberDiv">
		<form action="${initParam.root }cone/giftToNonMember.gibu"
			id="giftForm">
			선물하실 금액을 선택하세요.<br> 50콘<input type="radio" id="price"
				name="price" value="50" checked="checked">&nbsp; 100콘<input
				type="radio" id="price" name="price" value="100">&nbsp; 200콘<input
				type="radio" id="price" name="price" value="200">&nbsp;<br>
			<input type="hidden" id="senderId" name="sender"
				value="${sessionScope.mvo.id }"><br> 받는분의 이메일을 입력하세요.<br>
			<input type="email" id="reciever" name="reciever"
				placeholder="수신자 이메일" required><br> <input
				type="button" id="giftBtn" value="선물하기">
		</form>
	</div>

	<div id="giftToMemberDiv">
		<form action="${initParam.root }cone/giftToMember.gibu" id="giftForm">
			선물하실 금액을 선택하세요.<br> 50콘<input type="radio" name="price"
				value="50" checked="checked">&nbsp; 100콘<input type="radio"
				name="price" value="100">&nbsp; 200콘<input type="radio"
				name="price" value="200">&nbsp;<br> <input
				type="hidden" name="senderId" value="${sessionScope.mvo.id }"><br>
			친구를 선택하세요.<br> <select name="receiverId">
				<option value="">-선택-</option>
				<c:forEach items="${requestScope.friendlist }" var="list">
					<option value="${list.friend.id }">${list.friend.name}(${list.friend.id })</option>
				</c:forEach>
			</select><br> <input type="submit" value="선물하기">
		</form>
	</div>
	<div id="giftResult"></div>
</body>
</html>