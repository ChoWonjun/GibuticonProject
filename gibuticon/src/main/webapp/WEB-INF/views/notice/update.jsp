<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" href="${initParam.root}/css/board.css"
	type="text/css">

<%-- 	<c:import url="/template/header.jsp"></c:import>
 --%>	<form method=post action="updateNotice.gibu" name="update_form">
		<input type="hidden" name="noticeNo" value="${requestScope.nvo.noticeNo }">

		<table class="content">
			<tr>
				<td><b>글번호: <input type=text name=no value=${nvo.noticeNo }
						readonly></input> | 타이틀:<input type=text name=title
						value=${nvo.title }></input></b></td>
			</tr>
			<tr>
				<td><font size="2">작성자: 관리자 | 작성일시:${requestScope.nvo.writeDate }
				</font></td>
			</tr>
			<tr>
				<td><textarea rows="5" cols="75" name="content">${requestScope.nvo.content }</textarea>
				</td>
			</tr>
			<tr>
				<td valign="middle"><input type="submit" value="수정하기"></input>
				</td>
			</tr>
		</table>

	</form>










