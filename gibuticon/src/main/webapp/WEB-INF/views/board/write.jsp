<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="${initParam.root}layoutit/src/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#writeImg").click(function(){
			$("#writeForm").submit();
		});
	});
</script>
</head>
<body>
<form action="writeFreeBoard.gibu" method="post" id="writeForm">
 <table>
    <caption>글쓰기</caption>
    <tbody>
	 <tr>
		<td>제목</td>
		<td><input type="text" name="title" id="title"></td>
	 </tr>
	 <tr>
		<td>이름</td>
		<td><input type="text" name="writer" id="writer"></td>
	 </tr>
	 <tr>
		<td colspan=2><textarea cols="32" rows="10" name="content" id="content"></textarea></td>
	 </tr>
	 <tr>
	 	<td  colspan=2 >
	 		<input type="button" id="writeImg" value="글쓰기">
	 	</td>
	 </tr>
	 </tbody>
 </table> 
 </form>
</body>
</html>