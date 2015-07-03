<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function getCommentList(commentPage){
		$.ajax({
			type : "post",
			url : "${initParam.root}freeComment/getCommentList.gibu",
			data : "no=${requestScope.fvo.boardNo}&commentPage="+commentPage,
			success : function(comment) {
				var table="";
				for(var i=0;i<comment.list.length;i++){
					table+="<tr>";
					
					table+="<td>"+comment.list[i].commentNo+"</td>";
					table+="<td>"+comment.list[i].comment+"</td>";
					table+="<td>"+comment.list[i].writeDate+"</td>";
					table+="<td>"+comment.list[i].memberVO.name+"<br>("+comment.list[i].memberVO.id+")</td>";
					if(comment.list[i].memberVO.id=="${sessionScope.mvo.id }"){
						table+="<td><input class='btn btn-default' value='삭제하기' type='button'"+
						"onclick='deleteComment("+comment.list[i].commentNo+","+commentPage+")'>";
					}
					table+="</tr>";
				}
				
				$("#commentView").html(table);
				
				table="";

				if(comment.pagingBean.previousPageGroup){
					table+="<li>";
					table+="<a href='javascript:getCommentList("+comment.pagingBean.startPageOfPageGroup-1+")'>◀</a>";
					table+="</li>";
				}
				
				table+="<li>";
				for(var i=comment.pagingBean.startPageOfPageGroup;i<=comment.pagingBean.endPageOfPageGroup;i++){
					table+="<a href='javascript:getCommentList("+i+")'>"+i+"</a>";
				}
				table+="</li>";
				
				if(comment.pagingBean.nextPageGroup){
					table+="<li>";
					table+="<a href='javascript:getCommentList("+comment.pagingBean.endPageOfPageGroup+1+")'>▶</a>";
					table+="</li>";
				}

				$("#commentPageView").html(table);
			}
		})
	}
	function deleteComment(commentNo, commentPage){
		if(confirm("삭제하시겠습니까?")){
			$.ajax({
				type: "post",
				url: "${initParam.root}freeComment/delete.gibu",
				data:"commentNo="+commentNo,
				success : function(){
					getCommentList(commentPage);
				}
			})
		}else{
				return false;
		} 
	}
	$(document).ready(function(){
		getCommentList(1);
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
								<!-- <th width="300">추천수</th> -->
							</tr>
						</thead>
						<tbody id="commentView">
							
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
					<ul class="pagination" id="commentPageView">
						
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>
