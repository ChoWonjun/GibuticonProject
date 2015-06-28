<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">

<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,700">



<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div id="container">
					<ul>
						<li class="clearfix"><span class="entypo-inbox"></span> <a
							href="#">Inbox</a></li>
						<li class="clearfix"><span class="entypo-star"></span> <a
							href="#">Favorites</a></li>
						<li class="clearfix"><span class="entypo-paper-plane"></span>
							<a href="#">Sent</a></li>
						<li class="clearfix"><span class="entypo-flag"></span> <a
							href="#">Flagged</a></li>
						<li class="clearfix"><span class="entypo-trash"></span> <a
							href="#">Deleted</a></li>
					</ul>
				</div>
			</div>

<body data-spy="scroll">


			<div class="col-md-9">
				<div class="section">


					<div class="container">
						<div class="row">
							<div class="col-md-offset-2 col-md-8">
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
										<c:forEach items="${requestScope.nlvo.list}" var="noticeboard">

				<div class="col-md-9">
					<div class="section">


						<div class="container">
							<div class="row">
								<div class="col-md-offset-2 col-md-8">
									<br> <br>
									<table class="type09" style="font-family: &amp; amp;">
										<thead>

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
				<div class="col-md-offset-6 col-md-6">
					<ul class="pagination">
						<c:set var="pb" value="${requestScope.nlvo.pagingBean}"></c:set>
						<c:if test="${pb.previousPageGroup}">
							<li><a
								href="${initParam.root }notice/getList.gibu?pageNo=${pb.startPageOfPageGroup-1}">Prev</a>
							</li>
						</c:if>
						<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
								end="${pb.endPageOfPageGroup}">
								<a href="${initParam.root }notice/getList.gibu?pageNo=${i }">${i }</a>
							</c:forEach></li>
						<c:if test="${pb.nextPageGroup}">
							<li><a
								href="${initParam.root }notice/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
				<div class="col-md-3 text-right">
					<div class="btn-group btn-group-sm">
						<a class="active btn btn-default dropdown-toggle"
							data-toggle="dropdown">검색 조건 <span class="fa fa-caret-down"></span></a>
						<ul class="dropdown-menu" role="menu">
							<li><a href="#">제목+내용</a></li>
							<li><a href="#">제목만</a></li>
							<li><a href="#">내용만</a></li>
							<li><a href="#">작성자</a></li>
						</ul>
					</div>
				</div>
				<div class="col-md-6 text-left">
					<form role="form">
						<div class="form-group">
							<div class="input-group">
								<input type="text" class="form-control" placeholder="검색어입력">
								<span class="input-group-btn"> <a class="btn btn-primary"
									type="submit">검색</a>
								</span>
								<c:if test="${sessionScope.mvo.admin=='yes'}">
									<span class="input-group-btn"> <a href="writeForm.gibu"
										class="btn btn-primary" type="submit">글쓰기</a>
									</span>
				</c:if>

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

</body>


