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
	window.onload = function() {
	    // 다음으로 라디오 버튼에 click 이벤트 핸들러를 붙임!
	    var radios = document.forms[0].elements["type"];
	    for (var i=[0]; i < radios.length; i++) {
	        radios[i].onclick = radioClicked;
	    }
	}
	
	function radioClicked() {
	    // 클릭한 라디오 버튼이 무엇인지 확인하고, 그에 따라
	    // 알맞은 입력 요소를 사용 가능/불가능으로 전환!
	    switch (this.value) {
	        case "charge" : {
				$.ajax({
					type:"post",
					url:"${initParam.root}history/getChargeHistory.gibu",
					data:"memberId=${sessionScope.mvo.id}",
					success:function(history){	
						var table="<table border=1><tr><td>충전일자</td><td>충전방식</td><td>충전포인트</td>";
						for(var i=0;i<history.length;i++) {
							table+="<tr>";
							table+="<td>"+history[i].chargeTime+"</td>";
							table+="<td>"+history[i].paymentType+"</td>";
							table+="<td>"+history[i].amount+"</td></tr>";
						}
						table+="</table>";
						$("#resultView").html(table);
					}//success
				});//ajax
	            break;
	        }
	        case "gibu" : {
				$.ajax({
					type:"post",
					url:"${initParam.root}history/getGibuHistory.gibu",
					data:"memberId=${sessionScope.mvo.id}",
					success:function(history){	
						var table="<table border=1><tr><td>충전일자</td><td>충전방식</td><td>충전포인트</td>";
						for(var i=0;i<history.length;i++) {
							table+="<tr>";
							table+="<td>"+history[i].chargeTime+"</td>";
							table+="<td>"+history[i].paymentType+"</td>";
							table+="<td>"+history[i].amount+"</td></tr>";
						}
						table+="</table>";
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
<h3>마이콘</h3>
${sessionScope.mvo.name }님의 콘 충전/사용내역<br><br>

<form id=myCone>
<input type="radio" name="type" value="charge"> 충전내역&nbsp;&nbsp;
<input type="radio" name="type" value="gibu"> 사용내역<br>
<div id="resultView"></div></form>
</html>