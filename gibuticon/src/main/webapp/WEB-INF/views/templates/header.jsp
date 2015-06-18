<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	function chargePopup() {
		var url = "${initParam.root }cone/chargeView.gibu";
		window.open(url, "notice", "width=520,height=280,teop=150,left=200");
	}
</script>

<body data-spy="scroll">
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
					<li><a href="${initParam.root}fund/getList.gibu">모금</a></li>
					<li><a href="#">모금현황</a></li>
					<li><a href="${initParam.root}getFreeBoardList.gibu">자유게시판</a></li>
					<c:choose>
						<c:when test="${sessionScope.mvo==null}">
							<li><a href="${initParam.root }loginView.gibu">로그인</a></li>
						</c:when>
						<c:otherwise>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-hover="dropdown" data-toggle="dropdown" data-delay="1000">
									${sessionScope.mvo.id }님<b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li><a tabindex="-1" href="${initParam.root }logout.gibu"><strong>&nbsp;&nbsp;&nbsp;로그아웃</strong></a></li>
									<li class="divider"></li>
									<li><a tabindex="-1" href="#"><strong>&nbsp;&nbsp;&nbsp;총
												기부액</strong> 0원</a></li>
									<li><a tabindex="-1" href="#"><strong>&nbsp;&nbsp;&nbsp;보유한
												콘</strong> ${sessionScope.mvo.point }개 </a></li>
									<li class="divider"></li>
									<li><a tabindex="-1" href="#"><strong>&nbsp;&nbsp;&nbsp;친구목록
												보기</strong></a></li>
									<li class="divider"></li>
									<li><a tabindex="-1" href="${initParam.root }mypage.gibu"><strong>&nbsp;&nbsp;&nbsp;MY
												기부티콘</strong></a></li>
								</ul></li>
							<li><a href="#">충전하기</a></li>
						</c:otherwise>
					</c:choose>
				</ul>
			</div>
		</div>
	</div>