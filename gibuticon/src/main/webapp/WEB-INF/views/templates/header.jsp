<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript">
	function chargePopup(){
		var url="${initParam.root }cone/chargeView.gibu";
		window.open(url,"notice",
	   				"width=520,height=280,teop=150,left=200");
	}
</script>


<div class="row clearfix">
	<div class="col-md-2">
		<h2>
			<a href="${initParam.root}home.gibu">GIBUTICON</a>
		</h2>
	</div>
	<div class="col-md-7" align="center">
		<ul class="nav nav-tabs">
			<li><a href="#">사이트 소개</a></li>
			<li><a href="${initParam.root}fund/getList.gibu">모금</a></li>
			<li><a href="#">모금현황</a></li>
			<li><a href="${initParam.root}getNoticeList.gibu">공지사항</a></li>
			<li><a href="${initParam.root}getFreeBoardList.gibu">자유게시판</a></li>
		</ul>
	</div>
	<div class="col-md-3">
		<ul class="breadcrumb">
			<c:choose>
				<c:when test="${sessionScope.mvo==null}">
					<span class="divider"><a href="${initParam.root }loginView.gibu">로그인</a></span>&nbsp;&nbsp;
				<span class="divider"><a href="${initParam.root }registerView.gibu">회원가입</a></span>
				</c:when>
				<c:otherwise>
					<span class="divider"><a href="${initParam.root }member_mypage.gibu">${sessionScope.mvo.name}</a></span>&nbsp;&nbsp;
					<span class="divider"><a href="${initParam.root }logout.gibu">로그아웃</a></span><br>
					<span class="divider">보유콘 : <a href="${initParam.root }cone/mycone.gibu">${sessionScope.mvo.point }개</a>
					<input type="button" value="충전" onclick="chargePopup()"></span>
				</c:otherwise>
			</c:choose>
		</ul>
	</div>
</div>
