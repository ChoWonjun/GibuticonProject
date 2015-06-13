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
		$("#updateImg").click(function(){
				if(confirm("수정하시겠습니까?")){
					location.href="${initParam.root}update.gibu?no=${requestScope.fvo.boardNo}";
				}else{
					return false;
				} 
			});
		$("#delImg").click(function(){
				if(confirm("삭제하시겠습니까?")){
							location.href="deleteFreeBoard.gibu?no=${requestScope.fvo.boardNo}";
				}else{
					return false;
				} 
			});
		});

</script>
</head>
<body>
<table class="content">
					<tr>
						<td><b>${requestScope.fvo.title}</b>
						</td>
					</tr>
					<tr>
						<td><font size="2">
							|	조회수: ${requestScope.fvo.hits } 
							|	${requestScope.fvo.writeDate}</font></td>
					</tr>
					<tr>
						<td><textarea cols="40" rows="10" name="content"
								readonly="readonly">${requestScope.fvo.content }</textarea></td>
					</tr>
					<tr>
						<td valign="middle"><a
							href="${initParam.root}getFreeBoardList.gibu?no=${requestScope.fvo.boardNo}"><img
								src="${initParam.root}/layoutit/src/img/list_btn.jpg"></a> <img
							id="updateImg" src="${initParam.root}/layoutit/src/img/modify_btn.jpg">
							<img id="delImg" src="${initParam.root}/layoutit/src/img/delete_btn.jpg"></td>
					</tr>
					<tr>
						<td><span id="inputPass"></span></td>
					</tr>
				</table>


</body>
</html>