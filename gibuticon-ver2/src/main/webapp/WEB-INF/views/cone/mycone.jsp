<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
 

<script
   src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
   src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
 <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
 <%--위에껏만 써야되야 부트스트랩 안그럼 헤더 내려오는거 안대요!!! --%>
  <link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	function getChargeHistory(){
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
	}

	$(document).ready(function(){
		getChargeHistory();
		
		// 다음으로 라디오 버튼에 click 이벤트 핸들러를 붙임!
		var radios = document.myCone["type"];
		for (var i = [0 ]; i < radios.length; i++) {
			radios[i].onclick = radioClicked;
		}
	});

	function radioClicked() {
		// 클릭한 라디오 버튼이 무엇인지 확인하고, 그에 따라
		// 알맞은 입력 요소를 사용 가능/불가능으로 전환!
		switch (this.value) {
		case "charge": {
			getChargeHistory();
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

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>

	<center>
		<img src="${initParam.root}img/g_mycone.jpg" width="300"> <br>

		<hr align="center" width="60%">
		<br>
		<h4>${sessionScope.mvo.name }님의콘충전/사용내역</h4>

		<form name=myCone>
			<input type="radio" name="type" value="charge" checked>
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
