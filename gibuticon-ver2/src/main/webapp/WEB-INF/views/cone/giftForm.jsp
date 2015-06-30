<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$().ready(function(){
		$("#giftBtn").click(function(){
			var price = $("input[name=price]:checked","#giftForm").val();
			var sender = $("#senderId").val();
			var reciever = $("#reciever").val();
			if(confirm(reciever+" 로 "+price+"콘을 선물하시겠습니까?")){
				$("#giftResult").html("");
				$.ajax({
					type : "post",
					url : "giftToNonMember.gibu?price="+price+"&sender="+sender+"&reciever="
							+reciever,
					success : function(data) {
						var result = data.split(" ",2);
						if(result[0] == "ok"){
							$("#giftResult").html("Gibuticon을 선물했습니다.").css("color", "green");
							$("#point").html(result[1]);
							$("#reciever").val("");
						}
					}
				});
			}
		});
	});			
</script>
<h2>Gibuticon 선물하기</h2>
<form action="cone/giftToNonMember.gibu" id="giftForm">
	내가 보유한 콘 : <span id="point">${sessionScope.mvo.point }</span>콘<br><br>
	선물하실 금액을 선택하세요.<br>
	50콘<input type="radio" id="price" name="price" value="50" checked="checked">&nbsp;
	100콘<input type="radio" id="price" name="price" value="100">&nbsp;
	200콘<input type="radio" id="price" name="price" value="200">&nbsp;<br>
	<input type="hidden" id="senderId" name="sender" value="${sessionScope.mvo.id }"><br>
	받는분의 이메일을 입력하세요.<br>
	<input type="email" id="reciever" name="reciever" placeholder="수신자 이메일" required><br>
	<input type="button" id="giftBtn" value="선물하기">
</form>
<div id="giftResult"></div>