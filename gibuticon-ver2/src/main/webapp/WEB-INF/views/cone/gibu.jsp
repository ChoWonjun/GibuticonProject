<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function gibuCone(){
		location.href="${initParam.root}cone/gibu.gibu?fundNo=${param.fundNo}&point="+coneForm.coneCount.value;
	}
</script>
</head>
<body>
<form name="coneForm">
기부하시겠습니까?<br>
기부할 콘 : <input type="text" name="coneCount">cone / 보유콘 : ${sessionScope.mvo.point }<br>
</form>

<input type="button" value="기부" onclick="gibuCone()"> <input type="button" value="취소">
</body>
</html>