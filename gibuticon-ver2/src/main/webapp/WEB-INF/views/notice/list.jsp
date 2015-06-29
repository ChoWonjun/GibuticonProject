<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$('.selectpicker').selectpicker({
		style : 'btn-info',
		size : 4
	});
	
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
				<div class="col-md-2">
					<div class="navi_ca_is"></div>
					<div id="container">
						<div class="snb_v1">
							<dl class="menu">
								<dt class="s_intro">
									<br> <br> <span style="font-family: &amp; amp;">서비스
										소개</span> <br>
									<hr>
								</dt>
								<dd>
									<ul>
										<li><a href="${initParam.root }introduce_gibuticon.gibu"
											class="u_txt1"> <span style="font-family: &amp; amp;">기부티콘이란</span></a>
										</li>
									</ul>
								</dd>
								<dt class="s_srch">
									<br> <br> <span style="font-family: &amp; amp;">이용안내</span>
									<br>
									<hr>
								</dt>
								<dd>
									<ul>
										<li><a
											href="${initParam.root }introduce_what_is_cone.gibu"
											class="sr_txt5"> <span style="font-family: &amp; amp;">콘
													안내</span></a></li>
										<li><a href="#"><span style="font-family: &amp; amp;">콘받기
													안내</span></a></li>
										<li><a href="${initParam.root }introduce_howtogibu.gibu"
											class="sr_txt5"> <span style="font-family: &amp; amp;">기부방법
													안내</span></a></li>
										<!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
									</ul>
								</dd>
								<dd></dd>
								<dt class="s_srch">
									<br> <br> <span style="font-family: &amp; amp;">친구
										안내</span> <br>
									<hr>
								</dt>
								<dd>
									<ul>
										<li><a href="#" class="sr_txt5"> <span
												style="font-family: &amp; amp;">콘 친구란?</span></a></li>
										<li><a href="#" class="sr_txt5"> <span
												style="font-family: &amp; amp;">친구 등록</span></a></li>
									</ul>
								</dd>
							</dl>
							<ul class="snb_btn"></ul>
						</div>
					</div>
				</div>
				<div class="col-md-9">
					<div class="section">


						<div class="container">
							<div class="row">
								<div class="col-md-offset-2 col-md-8">
									<img src="${initParam.root}img/g_notice.jpg" width="200">
									<br> <br>
									<table class="type09" style="font-family: &amp; amp;">
										<thead>
											<tr>
												<th width="100">NO</th>
												<th width="800">제목</th>
												<th width="300">작성일</th>
												<th width="300">조회수</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${requestScope.nlvo.list}"
												var="noticeboard">
												<tr>
													<td>${noticeboard.noticeNo}</td>
													<td><a
														href="${initParam.root}notice/showContent.gibu?noticeNo=${noticeboard.noticeNo}">
															${noticeboard.title }</a></td>
													<td>${noticeboard.writeDate }</td>
													<td>${noticeboard.hits }</td>
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
							<div class="col-md-7"></div>
						</div>
					</div>
					<form id="searchForm" action="${initParam.root }notice/getList.gibu">
						<div class="col-md-offset-6 col-md-6">
							<ul class="pagination">
								<c:set var="pb" value="${requestScope.nlvo.pagingBean}"></c:set>
								<c:if test="${pb.previousPageGroup}">
									<li>
									<a href="javascript:getList('${pb.startPageOfPageGroup-1}')">Prev</a>
									<%-- <a href="${initParam.root }notice/getList.gibu?pageNo=${pb.startPageOfPageGroup-1}&searchSelect=${}">Prev</a> --%>
									</li>
								</c:if>
								<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
										<a href="javascript:getList('${i}')">${i}</a>
										<%-- <a href="${initParam.root }notice/getList.gibu?pageNo=${i}&searchSelect=${}">${i}</a> --%>
									</c:forEach></li>
								<c:if test="${pb.nextPageGroup}">
									<li>
									<a href="javascript:getList('${pb.endPageOfPageGroup+1}')">Next</a>									
 									<%--<a href="${initParam.root }notice/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}&searchSelect=${}">Next</a> --%>
									</li>
								</c:if>
							</ul>
						</div>
						<div class="col-md-3 text-right">
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
										name="input" id="input"> <span class="input-group-btn">
										<input type="submit" class="btn btn-primary" value="검색">
									</span>
									<c:if test="${sessionScope.mvo.admin=='yes'}">
										<span class="input-group-btn"> <a
											href="${initParam.root }notice/writeForm.gibu"
											class="btn btn-primary" type="submit">글쓰기</a>
										</span>
									</c:if>
								</div>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

