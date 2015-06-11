<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="row clearfix">
	<div class="col-md-2">
		<h2>
			<a href="${initParam.root}home.gibu">GIBUTICON</a>
		</h2>
		<div class="col-md-2">
			<h2>
				<a href="${initParam.root}home.gibu">GIBUTICON</a>
			</h2>
		</div>
		<div class="col-md-7" align="center">
			<ul class="nav nav-tabs">
				<li><a href="#">사이트 소개</a></li>
				<li><a href="${initParam.root}getFundList.gibu">모금</a></li>
				<li><a href="#">모금현황</a></li>
				<li><a href="#">공지사항</a></li>
				<li><a href="#">자유게시판</a></li>
			</ul>
		</div>
		<div class="col-md-3">
			<ul class="breadcrumb">
				<c:choose>
					<c:when test="${sessionScope.mvo==null}">
						<span class="divider"><a href="loginView.gibu">로그인</a></span>&nbsp;&nbsp;
				<span class="divider"><a href="registerView.gibu">회원가입</a></span>
					</c:when>
					<c:otherwise>
						<span class="divider"><a href="logout.gibu">${sessionScope.mvo.name}</a></span>&nbsp;&nbsp;
				<span class="divider"><a href="logout.gibu">로그아웃</a></span>
					</c:otherwise>
				</c:choose>
			</ul>
		</div>
	</div>
</div>