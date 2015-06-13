<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h3>콘 충전하기 (${sessionScope.mvo.name })</h3>
<form name="chargeCorn">
충전단위 <input type="radio"> 10cone <input type="radio"> 30cone <input type="radio"> 50cone<br>
<input type="radio"> 직접입력 <input type="text">cone<hr>
결제금액 <input type="text" disabled="disabled">X100원=<input type="text" disabled="disabled">원<hr>
결제수단 <input type="radio" name="payment"> 휴대폰 <input type="radio" name="payment"> 계좌이체 <input type="radio" name="payment"> 신용카드<hr>
<input type="submit" value="충전"> <input type="button" value="취소">
</form>
</body>
</html>