<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>글보기 : ${requestScope.bvo.no }번글</title>
<link rel="stylesheet" href="${initParam.root}/css/board.css"
	type="text/css">
<script type="text/javascript"
	src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script type="text/javascript">
	$(document)
			.ready(
					function() {
						var type = "";
						var dynaBtn = "<input type='password' id='pass'><input type='button' name='checkBtn' value=패스워드확인>";
						$("#delImg").click(function() {
							type = "delete";
							$("#inputPass").html(dynaBtn);
						});
						$("#updateImg").click(function() {
							type = "update";
							$("#inputPass").html(dynaBtn);
						});
						// 동적으로 생성되는 요소는 on 으로 이벤트 처리 
						$("#inputPass")
								.on(
										"click",
										":button[name=checkBtn]",
										function() {
											if (confirm(type + " 하시겠습니까?") == false) {
												$("#inputPass").html("");
												return;
											}
											$
													.ajax({
														type : "POST",
														url : "checkPass.do",
														dataType : "json",
														data : "no=${requestScope.bvo.no }&pass="
																+ $("#pass")
																		.val(),
														success : function(flag) {
															if (flag) {
																if (type == 'delete')
																	location.href = "deleteBoard.do?no=${requestScope.bvo.no }";
																else
																	location.href = "updateView.do?no=${requestScope.bvo.no }";
															} else {
																alert("비밀번호가 다릅니다!");
																$("#inputPass")
																		.html(
																				"");
															}
														}//callback
													});//ajax
										});//click		
					});//ready
</script>
</head>
<body>
	<c:import url="/template/header.jsp"></c:import>
	<table class="content">
		<tr>
			<td><b>${requestScope.bvo.no }-${requestScope.bvo.title}</b></td>
		</tr>
		<tr>
			<td><font size="2">글쓴이: ${requestScope.bvo.writer } |
					조회수: ${requestScope.bvo.viewCount } | ${requestScope.bvo.writeDate}</font></td>
		</tr>
		<tr>
			<td><textarea cols="40" rows="10" name="content"
					readonly="readonly">${requestScope.bvo.content }</textarea></td>
		</tr>
		<tr>
			<td valign="middle">
				<%-- <a
							href=""><img
								src="${initParam.root}/img/answer_btn.jpg"></a>--%> <a
				href="list.do"> <img src="${initParam.root}/img/list_btn.jpg"></a>
				<img id="updateImg" src="${initParam.root}/img/modify_btn.jpg">
				<img id="delImg" src="${initParam.root}/img/delete_btn.jpg">
			</td>
		</tr>
		<tr>
			<td><span id="inputPass"></span></td>
		</tr>
	</table>
</body>
</html>