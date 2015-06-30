<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">


</head>

<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<h1>보낸 쪽지함</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="btn-group">
						<a href="${initParam.root }message/getReceiveList.gibu"
							class="btn btn-default">받은 쪽지함</a> <a href="#"
							class="btn btn-default">보낸 쪽지함</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<table class="table">
						<thead>
							<tr>
								<th class="active">제목</th>
								<th class="active">받는이</th>
								<th class="active">작성일</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach var="msg" items="${requestScope.list.list}">
								<tr>
									<c:if test="${msg.readTime==null }">
										<!-- 읽지않은쪽지 -->
										<td><a
											href="${initParam.root}message/sendRead.gibu?no=${msg.no }"><b>${msg.title }</b></a></td>
									</c:if>
									<c:if test="${msg.readTime!=null }">
										<!-- 읽은쪽지 -->
										<td><a
											href="${initParam.root}message/sendRead.gibu?no=${msg.no }">${msg.title }</a></td>
									</c:if>
									<td><a
										href="${initParam.root}message/sendForm.gibu?receiverId=${msg.receiverId }">${msg.sender.name }(${msg.receiverId }</a>)</td>
									<td>${msg.sendTime }</td>
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
				<div class="col-md-12">
					<ul class="pagination">
						<c:set var="pb" value="${requestScope.list.pagingBean}"></c:set>
						<c:if test="${pb.previousPageGroup}">
							<li><a
								href="${initParam.root}message/getSendList.gibu?page=${pb.startPageOfPageGroup-1}">Prev</a>
							</li>
						</c:if>
						<c:forEach var="i" begin="${pb.startPageOfPageGroup}"
							end="${pb.endPageOfPageGroup}">
							<li><a
								href="${initParam.root}message/getSendList.gibu?page=${i }">${i }</a>
							</li>
						</c:forEach>
						<c:if test="${pb.nextPageGroup}">
							<li><a
								href="${initParam.root}message/getSendList.gibu?page=${pb.endPageOfPageGroup+1}">Next</a>
							</li>
						</c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</body>

</html>