<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">

<link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">
<br>
<br>
<br>
<br>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-offset-2 col-md-8">
				<img src="${initParam.root}img/freeBoardName.jpg" width="200">
				<br> <br> <br> <br>
				<table class="type09" style="font-family: &amp; amp;">
					<thead>
						<tr>
							<th width="100">NO</th>
							<th width="800">제목</th>
							<th width="300">작성일</th>
							<th width="300">작성자</th>
							<th width="300">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${sessionScope.mvo!=null}">
								<c:forEach items="${requestScope.lvo.list}" var="board">
									<tr>
										<td>${board.boardNo}</td>
										<%-- boardvo에 relevel이 0이 아니면 답변글이므로 relevel만큼 공백으로 제목을 밀어준다  --%>
										<td class="titleView">
											 <a	href="${initParam.root }freeBoard/showContent.gibu?no=${board.boardNo}&id=${sessionScope.mvo.id}">
											<c:if test="${board.relevel!=0}">
												<c:forEach step="1" begin="0" end="${board.relevel}">&nbsp;&nbsp;</c:forEach> 
												<img src="${initParam.root }img/reply.jpg"></c:if>
												${board.title}</a></td>
										<td>${board.writeDate}</td>
										<td>${board.memberVO.name}</td>
										<td>${board.hits}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.lvo.list}" var="board">
									<tr>
										<td>${board.boardNo}</td>
										<td>${board.title}</td>
										<td>${board.writeDate}</td>
										<td>${board.memberVO.name}</td>
										<td>${board.hits}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>
<!--  Paging  -->

<div class="section">
	<div class="container">
		<div class="col-md-offset-5 col-md-6">
			<ul class="pagination">
				<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
				<c:if test="${pb.previousPageGroup}">
					<li><a
						href="${initParam.root }freeBoard/getList.gibu?pageNo=${pb.endPageOfPageGroup-1}&searchSelect=${param.searchSelect}&input=${param.input}">Prev</a>
					</li>
				</c:if>
				<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<a
							href="${initParam.root }freeBoard/getList.gibu?pageNo=${i}&searchSelect=${param.searchSelect}&input=${param.input}">${i}</a>

					</c:forEach></li>
				<c:if test="${pb.nextPageGroup}">
					<li><a
						href="${initParam.root }freeBoard/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}&searchSelect=${param.searchSelect}&input=${param.input}">Next</a>

					</li>
				</c:if>
			</ul>
		</div>
	</div>
</div>
<!--  ----------------- -->
<!--  검색기능
			  검색 디자인 바꿀 때 
			  검색이 되는지 안되는지 확인하고 푸쉬 하세요.
		 -->

<form id="searchForm" action="${initParam.root }freeBoard/getList.gibu">
	<div class="section">
		<div class="container">
			<div class="col-md-offset-2 col-md-2 text-right">
				<div class="btn-group btn-group-sm">
					<select class="selectpicker" name="searchSelect" id="searchSelect">
						<option value="">검색조건</option>
						<option value="0">제목만</option>
						<option value="1">내용만</option>
						<option value="2">제목+내용</option>
					</select>
				</div>
			</div>
			<div class="col-md-6 text-left">
				<div class="form-group">
					<div class="input-group">
						<input type="text" class="form-control" placeholder="검색어입력"
							name="input" id="input"> <span class="input-group-btn">
							<input type="submit" class="btn btn-primary" value="검색">
						</span> <span class="input-group-btn"> <a
							href="${initParam.root }freeBoard/writeForm.gibu"
							class="btn btn-primary" type="submit">글쓰기</a>
						</span>
					</div>
				</div>
			</div>
		</div>
	</div>
</form>