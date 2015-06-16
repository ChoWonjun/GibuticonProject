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
						<td>${sessionScope.mvo.id}</td>
					</tr>
					<tr>
						<td valign="middle">
						<a href="replyView.gibu?no=${requestScope.fvo.boardNo }"><img
								src="${initParam.root}layoutit/src/img/answer_btn.jpg"></a>
						<a href="${initParam.root}getFreeBoardList.gibu?no=${requestScope.fvo.boardNo}"><img
								src="${initParam.root}layoutit/src/img/list_btn.jpg"></a> <img
							id="updateImg" src="${initParam.root}layoutit/src/img/modify_btn.jpg">
							<img id="delImg" src="${initParam.root}layoutit/src/img/delete_btn.jpg"></td>
					</tr>
					<tr>
						<td><form action="">
						댓글<input type="text" name="comment">
						<input type="submit" value="댓글등록">
						<input type="hidden" name="id" value="${requestScope.fvo.id}">
						</form></td>
					</tr>
				</table>
				
				<table  border="1" cellpadding="1">
		<caption>목록</caption>
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="title">comment</th>
			<th class="date">작성일</th>
			<th class="writer">작성자</th>
			<th class="hit">HIT</th>
			</tr>		
		</thead>	
		<tbody>
			<c:forEach items="${requestScope.clist}" var="comment">
				<tr><td>${comment.commentNo}</td><td>${comment.comment}</td><td>${comment.writeDate}</td><td>${comment.memberVO.name }</<td>${comment.hits}</td></tr>
			</c:forEach>
			<tr>
				<td colspan=5 align="center">
					<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
					<c:if test="${pb.previousPageGroup}">
						<a href="${initParam.root }getFreeBoardList.gibu?pageNo=${pb.startPageOfPageGroup-1}">◀</a> 
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<a href="${initParam.root }getFreeBoardList.gibu?pageNo=${i }">${i }</a>
					</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="${initParam.root }getFreeBoardList.gibu?pageNo=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</td>
			</tr>				
		</tbody>
	</table>


</body>
</html>