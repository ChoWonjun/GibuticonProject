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
<script type="text/javascript">
	function getList(pageNo) {
		var selectComp = document.getElementById("searchSelect").value;
		location.href = "${initParam.root }freeBoard/getList.gibu?pageNo="
				+ pageNo + "&searchSelect=" + selectComp;
	}
</script>
<link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">
<br>
<br>
<br>
<br>
<div class="section" align="center">
	<div class="container" align="center">
		<div class="row" align="center">
			<div class="col-md-8" align="center">
				<img src="${initParam.root}img/freeBoardName.jpg" width="200">
				<br> <br> <br> <br>
				<table class="type09" align="center" style="font-family: &amp; amp;">
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
										<td><a
											href="${initParam.root }freeBoard/showContent.gibu?no=${board.boardNo}&id=${sessionScope.mvo.id}">${board.title}</a></td>
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
	<form id="searchForm" action="${initParam.root }freeBoard/getList.gibu">
		<div class="container"></div>
		<div class="col-md-offset-6 col-md-6">
			<ul class="pagination">
				<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
				<c:if test="${pb.previousPageGroup}">
					<li><a
						href="javascript:getList('${pb.startPageOfPageGroup-1}')">Prev</a>
					</li>
				</c:if>
				<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
						end="${pb.endPageOfPageGroup}">
						<a href="javascript:getList('${i}')">${i}</a>
					</c:forEach></li>
				<c:if test="${pb.nextPageGroup}">
					<li><a href="javascript:getList('${pb.endPageOfPageGroup+1}')">Next</a>
					</li>
				</c:if>
			</ul>
		</div>
		
		<!--  ----------------- -->
		<!--  검색기능
			  검색 디자인 바꿀 때 
			  검색이 되는지 안되는지 확인하고 푸쉬 하세요.
		 -->
		
		<div class="col-md-3 text-right">
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
					</span><span class="input-group-btn"> <a
						href="${initParam.root }freeBoard/writeForm.gibu"
						class="btn btn-primary" type="submit">글쓰기</a>
					</span>

				</div>
			</div>
		</div>
	</form>
</div>



