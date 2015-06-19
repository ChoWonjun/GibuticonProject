<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<%-- <link rel="stylesheet" href="${initParam.root }css/board.css" type="text/css">
<script type="text/javascript"> --%>
<!-- $(document).ready(function(){
	$("#writeImg").click(function(){
		$("#write_form").submit();
	});
});
</script> -->
 <br>
 
 <form action="writeNotice.gibu" method="post" id="write_form">
 <table>
    <caption>글쓰기</caption>
    <tbody>
	 <tr>
		<td>제목</td>
		<td><input type="text" name="title" id="title"></td>
	 </tr>
	 <tr>
		<td>이름</td>
		<td>관리자</td>
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
 
