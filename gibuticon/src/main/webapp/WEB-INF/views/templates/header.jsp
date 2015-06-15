<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="navbar navbar-default navbar-static-top">
	<div class="container">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#navbar-ex-collapse">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${initParam.root}home.gibu"><span>Gibuticon</span></a>
		</div>
		<div class="collapse navbar-collapse" id="navbar-ex-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#">사이트소개</a></li>
				<li><a href="${initParam.root}getNoticeList.gibu">공지사항</a></li>
				<li><a href="${initParam.root}getFundList.gibu">모금</a></li>
				<li><a href="#">모금현황</a></li>
				<li><a href="${initParam.root}getFreeBoardList.gibu">자유게시판</a>
				</li>
				<li><c:choose>
						<c:when test="${sessionScope.mvo==null}">
							<a href="loginView.gibu">로그인</a>
						</c:when>
						<c:otherwise>
							<a href="member_mypage.gibu">${sessionScope.mvo.name}</a>
						</c:otherwise>
					</c:choose></li>
			</ul>
		</div>
	</div>
</div>
