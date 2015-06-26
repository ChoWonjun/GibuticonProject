<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script
	src="http:////cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>

<script type="text/javascript">
	/* $(document).ready(function(){
	
	 }); */
	function chargePopup() {
		var url = "${initParam.root }cone/chargeView.gibu";
		window.open(url, "notice", "width=520,height=280,teop=150,left=200");
	}
	
	function sendMessagePopup() {
		var url = "${initParam.root}message/sendForm.gibu";
		window.open(url, "message", "width=420, height=460, teop=150, left=200");
	}
</script>

<div class="navbar navbar-default">
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
			<ul class="nav navbar-nav navbar-left">
				<li><a href="${initParam.root}introduce_gibuticon.gibu">사이트소개</a></li>
				<li><a href="${initParam.root}notice/getList.gibu">공지사항</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-hover="dropdown" data-delay="1000" data-close-others="false"
					data-toggle="dropdown"> 모금<b class="caret"></b>
				</a>
					<ul class="dropdown-menu">
						<li><a tabindex="-1"
							href="${initParam.root}fund/getList.gibu"><strong>기부사이트보기</strong></a>
						</li>
						<li class="divider"></li>
						<li><a tabindex="-1" href="#"><strong>아동</strong></a></li>
						<li><a tabindex="-1" href="#"><strong>어르신</strong></a></li>
						<li><a tabindex="-1" href="#"><strong>장애인</strong></a></li>
						<li><a tabindex="-1" href="#"><strong>기타</strong></a></li>
					</ul></li>
				<li><a href="${initParam.root }fund/currentState.gibu">모금현황</a></li>
				<li><a href="${initParam.root}freeBoard/getList.gibu">자유게시판</a></li>
			</ul>
			<c:choose>
				<c:when test="${sessionScope.mvo==null}">
					<link rel="stylesheet"
						href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
					<ul class="nav navbar-nav navbar-right">
						<li><a id="modal-755773" href="#modal-container-755773"
							data-toggle="modal">로그인</a></li>
					</ul>
					<div class="modal fade" id="modal-container-755773" role="dialog"
						aria-labelledby="myModalLabel" aria-hidden="true">
						<div class="modal-dialog">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal"
										aria-hidden="true">×</button>
									<h4 class="modal-title" id="myModalLabel">로그인</h4>
								</div>
								<div class="modal-body">
									<div class="section text-center">
										<a href="${initParam.root}home.gibu"> <img
											src="${initParam.root }img\이모티콘.jpg"
											class="center-block img-responsive img-thumbnail"
											height="100" width="100"></a>
										<form class="form-horizontal"
											action="${initParam.root}member/login.gibu" method="post">
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<label for="inputEmail3" class="control-label">ID</label>
												</div>
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<input type="text" class="form-control input-lg" id="id"
														name="id" placeholder="User Name" path="id" />
													<p class="help-block">
														<errors path="id" />
													</p>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<label for="inputPassword3" class="control-label">Password</label>
												</div>
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<input type="password" class="form-control input-lg"
														id="password" name="password" placeholder="Password"
														path="password" />
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<div class="checkbox">
														<label> <input type="checkbox">Remember me
														</label>
													</div>
												</div>
											</div>
											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-5 col-md-8">
													<button type="submit" class="btn btn-default"
														id="loginForm">Login</button>
												</div>
											</div>
											<br> <a href="#">아이디찾기 | </a> <a href="#">비밀번호찾기 | </a>
											<a href="${initParam.root}member/registerMemberForm.gibu">회원가입</a>
										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:when>
				<c:otherwise>
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-hover="dropdown" data-toggle="dropdown" data-delay="1000">
								${sessionScope.mvo.id }님<b class="caret"></b>
						</a>
							<ul class="dropdown-menu">
								<li><a tabindex="-1"
									href="${initParam.root }member/logout.gibu"><strong>&nbsp;&nbsp;&nbsp;로그아웃</strong></a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="#"><strong>&nbsp;&nbsp;&nbsp;총
											기부액</strong> 0원</a></li>
								<li><a tabindex="-1"
									href="${initParam.root }cone/mycone.gibu"><strong>&nbsp;&nbsp;&nbsp;보유한
											콘</strong> ${sessionScope.mvo.point }개 </a></li>
								<li class="divider"></li>
								<li><a tabindex="-1" href="${initParam.root }friend/memberlist.gibu"><strong>&nbsp;&nbsp;&nbsp;회원검색</strong></a></li>
									<li><a tabindex="-1" href="${initParam.root }friend/friendlist.gibu?myId=${sessionScope.mvo.id}"><strong>&nbsp;&nbsp;&nbsp;친구목록
												보기</strong></a></li>
									<li class="divider"></li>
									<li><a tabindex="-1" href="javascript:sendMessagePopup()"><strong>&nbsp;&nbsp;&nbsp;쪽지보내기</strong></a></li>
									<li><a tabindex="-1" href="#"><strong>&nbsp;&nbsp;&nbsp;쪽지목록</strong></a></li>
								<li class="divider"></li>
								<li><a tabindex="-1"
									href="${initParam.root }member/mypage.gibu"><strong>&nbsp;&nbsp;&nbsp;
											마이페이지</strong></a></li>
							</ul></li>
						<li><a href="javascript:chargePopup()">충전하기</a></li>
					</ul>
				</c:otherwise>
			</c:choose>

		</div>
	</div>
</div>

