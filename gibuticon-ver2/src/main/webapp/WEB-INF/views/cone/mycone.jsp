<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>
<!--  -->
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!--  -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">
<body>

 <script type="text/javascript">
	window.onload = function() {
		// 다음으로 라디오 버튼에 click 이벤트 핸들러를 붙임!
		var radios = document.forms[0].elements["type"];
		for (var i = [ 0 ]; i < radios.length; i++) {
			radios[i].onclick = radioClicked;
		}
	}

	function radioClicked() {
		// 클릭한 라디오 버튼이 무엇인지 확인하고, 그에 따라
		// 알맞은 입력 요소를 사용 가능/불가능으로 전환!
		switch (this.value) {
		case "charge": {
			$.ajax({
						type : "post",
						url : "${initParam.root}history/getChargeHistory.gibu",
						data : "memberId=${sessionScope.mvo.id}",
						success : function(history) {

							var table = "<table class='type09'><thead><tr> <th scope='cols'>충전일자</th><th scope='cols'>충전방식</th><th scope='cols'>충전포인트</th></tr></thead>";
							for (var i = 0; i < history.length; i++) {
								table += "<tbody><tr>"
								table += "<td>" + history[i].chargeTime
										+ "</td>";
								table += "<td>" + history[i].paymentType
										+ "</td>";
								table += "<td>" + history[i].amount
										+ "</td></tbody></tr>";
							}

							table += "</table>";
							$("#resultView").html(table);
						}//success
					});//ajax
			break;
		}
		case "gibu": {
			$.ajax({
						type : "post",
						url : "${initParam.root}history/getGibuHistory.gibu",
						data : "memberId=${sessionScope.mvo.id}",
						success : function(history) {
							var table = "<table class='type09'><thead><tr> <th scope='cols'>기부일자</th><th scope='cols'>기부함번호</th><th scope='cols'>기부포인트</th></tr></thead>";

							for (var i = 0; i < history.length; i++) {
								table += "<tbody><tr>";
								table += "<td>" + history[i].donationTime+ "</td>";
								table += "<td><a href=${initParam.root}fund/showContent.gibu?no="+ history[i].fundNo+ ">"+ history[i].fundNo + "</a></td>"
								table+="<td>"+history[i].amount+"</td></tbody></tr>";
							}
							table += "</table>";
							$("#resultView").html(table);

						}//success
					});//ajax
			break;
		}
	}
}
</script>

</head>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>

	<center>
		<img src="${initParam.root}img\마이콘.jpg" width="300"> <br>

		<hr align="center" width="60%">
		<br>
		<h4>${sessionScope.mvo.name }님의콘충전/사용내역</h4>

		<form id=myCone>
			<input type="radio" name="type" value="charge">
			충전내역&nbsp;&nbsp; <input type="radio" name="type" value="gibu">
			사용내역<br> <br> <br> <br>
			<div id="resultView"></div>
		</form>

	</center>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>

	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div> 