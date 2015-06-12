<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>title: </title>
<link rel="stylesheet" href="${initParam.root}/css/board.css" type="text/css">
</head>
<body><c:import url="/template/header.jsp"></c:import>	
<form method=post action="updateBoard.do">


			<table class="content">
				<tr>
					<td>
					<b>글번호: <input type=text name=no value=${bvo.no } readonly></input>
					| 타이틀:<input type=text name=title value=${bvo.title }></input></b>
					</td></tr><tr>	<td>
						<font size="2">작성자: <input type=text name=writer 
						value=${bvo.writer }></input>| 
						작성일시:${bvo.writeDate } 
					</font>
					</td>
				</tr>
				<tr>
					<td>						
	<textarea rows="15" cols="75" name="content">${bvo.content }</textarea>
					</td>
				</tr>
				<tr>
					<td valign="middle">						
					<input type="submit" value="수정하기"	></input>			
					</td>				
				</tr>
			</table>
	
</form>	
</body>
</html>














