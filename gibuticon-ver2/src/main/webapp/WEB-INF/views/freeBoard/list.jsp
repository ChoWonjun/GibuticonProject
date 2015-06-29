<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
function getList(pageNo){
	var selectComp=document.getElementById("searchSelect").value;
	location.href="${initParam.root }notice/getList.gibu?pageNo="+pageNo+"&searchSelect="+ selectComp;
}
</script>
<link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">
<body data-spy="scroll">
	<div class="section">
		<div class="container">
			<div class="row"></div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-3">
					<div class="navi_ca_is"></div>
				</div>
				<div class="col-md-8">
					<div class="section">
						<div class="container">
							<div class="row">
								<div class="col-md-8">
									<img src="${initParam.root}img/freeBoardName.jpg" width="200">
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

					<div class="section">
						<form id="searchForm"
							action="${initParam.root }freeBoard/getList.gibu">
							<div class="container"></div>
							<div class="col-md-offset-6 col-md-6">
								<ul class="pagination">
									<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
									<c:if test="${pb.previousPageGroup}">
										<li>
										<a href="javascript:getList('${pb.startPageOfPageGroup-1}')">Prev</a>										
										<%-- <a href="${initParam.root }freeBoard/getList.gibu?pageNo=${pb.startPageOfPageGroup-1}">Prev</a> --%>
										</li>
									</c:if>
									<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<a href="javascript:getList('${i}')">${i}</a>
<%-- 										<a href="${initParam.root }freeBoard/getList.gibu?pageNo=${i }">${i }</a> --%>
										</c:forEach></li>
									<c:if test="${pb.nextPageGroup}">
										<li>
										<a href="javascript:getList('${pb.endPageOfPageGroup+1}')">Next</a>	
<%-- 									<a href="${initParam.root }freeBoard/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}">Next</a> --%>
										</li>
									</c:if>
								</ul>
							</div>

							<div class="col-md-5 text-right">
								<div class="btn-group btn-group-sm">
									<select class="selectpicker" name="searchSelect"
										id="searchSelect">
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
											name="input" id="input"> <span
											class="input-group-btn"> <input type="submit"
											class="btn btn-primary" value="검색">
										</span><span class="input-group-btn"> <a
											href="${initParam.root }freeBoard/writeForm.gibu"
											class="btn btn-primary" type="submit">글쓰기</a>
										</span>
									</div>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>




