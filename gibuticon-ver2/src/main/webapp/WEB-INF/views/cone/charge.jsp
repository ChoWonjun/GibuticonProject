<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						$("#coneInput").hide();
						$("#coneValSel")
								.change(
										function() {
											chargeCone.coneVal.value = "";
											chargeCone.payVal.value = "";
											$("#coneInput").hide();
											if ($("#coneValSel").val() == "") {
												alert("수량을 선택하세요!");
												return;
											} else if ($("#coneValSel").val() == "self") {
												$("#coneInput").show();
											} else {
												chargeCone.coneVal.value = $(
														"#coneValSel").val();
												chargeCone.payVal.value = chargeCone.coneVal.value * 100;
											}
										});
						$("#selfConeVal")
								.keyup(
										function() {
											if (isNaN($("#selfConeVal").val())) {
												$("#selfConeVal").val("");
												alert("숫자로만 입력하세요!");
											}
											chargeCone.coneVal.value = $(
													"#selfConeVal").val();
											chargeCone.payVal.value = chargeCone.coneVal.value * 100;
										});
						$("#chargeButton")
								.click(
										function() {
											if (chargeCone.payVal.value == "")
												alert("충전단위를 선택하세요!");
											else if (chargeCone.coneVal.value < 10)
												alert("충전단위를 10개 이상 입력해주세요!");
											else if ($("#chargeCone :radio[name=payment]:checked").length == 0) {
												alert("결제방식을 선택하세요!");
											} else
												location.href = "${initParam.root}cone/charge.gibu?id=${sessionScope.mvo.id }&point="
														+ chargeCone.coneVal.value
														+ "&paymentType="
														+ $(
																"#chargeCone :radio[name=payment]:checked")
																.val();
										});
					});
</script>
</head>
<body>

  <div class="section">
      <div class="container">
        <div class="row">
          <div style="color:white; background-color: navy; height: 60px; text-align:center; " class="col-md-5" >
	콘 충전하기
	</div>
        </div>
      </div>
    </div>

	
	<form name="chargeCone" id="chargeCone">
		<input type="hidden" name="point" value="50"> <input
			type="hidden" name="id" value="${sessionScope.mvo.id }"> 충전단위
		<select id="coneValSel">
			<option value="">-선택-</option>
			<option value="10">10cone</option>
			<option value="20">20cone</option>
			<option value="30">30cone</option>
			<option value="50">50cone</option>
			<option value="100">100cone</option>
			<option value="self">직접입력</option>
		</select> <span id="coneInput">직접입력 <input type=text id=selfConeVal>cone
		</span> <br>
		<hr>
		결제금액 <input type="text" disabled="disabled" name="coneVal"
			id="coneVal"> X100원=<input type="text" disabled="disabled"
			name="payVal">원
		<hr>
		결제수단 <input type="radio" name="payment" value="mobile"> 휴대폰 <input
			type="radio" name="payment" value="transfer"> 계좌이체 <input
			type="radio" name="payment" value="credit"> 신용카드
		<hr>
		<input class="btn btn-primary" type="button" value="충전" id="chargeButton"> <input
			class="btn btn-default" type="button" value="취소" onclick="javascript:window.close()">
	</form>
</body>
</html>