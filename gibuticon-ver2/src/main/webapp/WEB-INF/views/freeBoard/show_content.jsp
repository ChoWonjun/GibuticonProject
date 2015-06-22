<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function deleteComment(commentNo, no){
		if(confirm("삭제하시겠습니까?")){
			location.href="${initParam.root}freeComment/delete.gibu?commentNo="+commentNo+"&no="+no;
		}else{
				return false;
		} 
	}
	$(document).ready(function(){
		$("#updateImg").click(function(){
				if(confirm("수정하시겠습니까?")){
					location.href="${initParam.root}freeBoard/updateForm.gibu?no=${requestScope.fvo.boardNo}";
				}else{
					return false;
				} 
			});
		$("#delImg").click(function(){
				if(confirm("삭제하시겠습니까?")){
							location.href="${initParam.root}freeBoard/delete.gibu?no=${requestScope.fvo.boardNo}";
				}else{
					return false;
				} 
			});
		$("#commentRegister").click(function(){
			if(confirm("댓글을 등록하시겠습니까?")){
				$("#commentForm").submit();
	}else{
		return false;
	} 
		});
	});
</script>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="content" width="1200" height="200"
						style="word-break: break-all; word-wrap: break-word">
						<tbody>
							<tr>
								<td>글번호 : ${requestScope.fvo.boardNo}</td>
								<td colspan="2">제목 : ${requestScope.fvo.title}</td>
							</tr>
							<tr>
								<td>작성자 : ${requestScope.fvo.memberVO.name}</td>
								<td>작성일 : ${requestScope.fvo.writeDate}</td>
								<td>조회수 : ${requestScope.fvo.hits}</td>
							</tr>
							<tr>
								<td colspan="3"><pre>${requestScope.fvo.content}</pre></td>
							</tr>
							<tr>
								<td valign="middle" align="center" colspan="3 "><a
									href="${initParam.root}freeBoard/replyForm.gibu?no=${requestScope.fvo.boardNo }">
										<input class="btn btn-default" type="submit" value="답글">
								</a> <a
									href="${initParam.root}freeBoard/getList.gibu?no=${requestScope.fvo.boardNo}">
										<input class="btn btn-default" type="submit" value="목록">
								</a> <input class="btn btn-default " type="submit" value="삭제"
									id="delImg"> <input class="btn btn-default"
									type="submit" value="수정" id="updateImg"></td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<div class="section">
		<div class="container">
			<div class="row">
				<c:if test="${sessionScope.mvo!=null }">
					<div class="col-md-offset-2 col-md-8 col-md-offset-2">
						<div class="btn-group btn-group-sm">
							<form role="form" id="commentForm"
								action="${initParam.root}freeComment/write.gibu">
								<div class="form-group">
									<div class="input-group">
										<input type="hidden" name="id" value="${sessionScope.mvo.id}">
										<input type="hidden" name="boardNo"
											value="${requestScope.fvo.boardNo}"> <input
											type="hidden" name="name" value="${sessionScope.mvo.name}">
										<input type="text" name="comment" class="form-control"
											placeholder="댓글입력"> <span class="input-group-btn">
											<input id="commentRegister" class="btn btn-primary"
											type="submit" value="댓글등록">
										</span>
									</div>
								</div>
							</form>
						</div>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-2 col-md-8 col-md-offset-2">
					<table class="table" style="font-family: &amp; amp;">
						<thead>
							<tr>
								<th width="100">NO</th>
								<th width="1000">comment</th>
								<th width="200">작성일</th>
								<th width="300">작성자</th>
								<th width="300">추천수</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${requestScope.flist.list}" var="comment">
								<tr>
									<td>${comment.commentNo}</td>
									<td>${comment.comment}</td>
									<td>${comment.writeDate}</td>
									<td>${comment.memberVO.name}</td>
									<td>${comment.hits}</td>
									<td><c:if test="${comment.id==sessionScope.mvo.id }">
											<input class="btn btn-default" value="삭제하기" type="button"
												onclick="deleteComment(${comment.commentNo}, ${requestScope.fvo.boardNo} )">
										</c:if></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-offset-6 col-md-2 col-md-offset-4">
					<ul class="pagination">
						<c:set var="pb" value="${requestScope.flist.pagingBean}"></c:set>
						<c:if test="${pb.previousPageGroup}">
							<li><a
								href="${initParam.root }freeBoard/showContent.gibu?no=${requestScope.fvo.boardNo}&pageNo=${pb.startPageOfPageGroup-1}">Prev</a>
							</li>
						</c:if>
						<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
								end="${pb.endPageOfPageGroup}">
								<a
									href="${initParam.root }freeBoard/showContent.gibu?no=${requestScope.fvo.boardNo}&pageNo=${i}">${i }</a>
							</c:forEach></li>
						<c:if test="${pb.nextPageGroup}">
							<li><a
								href="${initParam.root }freeBoard/showContent.gibu?no=${requestScope.fvo.boardNo}&pageNo=${pb.endPageOfPageGroup+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
