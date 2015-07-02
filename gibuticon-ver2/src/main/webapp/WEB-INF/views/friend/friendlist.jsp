<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	function delFriend(friendid) {
		if (confirm(friendid + " 를 친구목록에서 삭제하시겠습니까?")) {
			$.ajax({
				type : "post",
				url : "${initParam.root}friend/delFriend.gibu",
				data : "myId=${sessionScope.mvo.id}&friendId=" + friendid,
				success : function(result) {
					if (result)
						location.reload();
				}//success
			});//ajax
		} else {
			return false;
		}
	}

	function addFriend() {
		$.ajax({
			type : "post",
			url : "${initParam.root}friend/addFriend.gibu",
			data : "myId=${sessionScope.mvo.id}&friendId="
					+ $("#friendIdHidden").val(),
			success : function(result) {
				if (result)
					location.reload();
			}//success
		});//ajax
	}

	function chargePopup() {
		var url = "${initParam.root }cone/chargeView.gibu";
		window.open(url, "notice", "width=520,height=280,teop=150,left=200");
	}

	$()
			.ready(
					function() {
						$("#findBtn")
								.click(
										function() {
											$
													.ajax({
														type : "post",
														url : "${initParam.root}friend/findMember.gibu",
														data : "id="
																+ $("#searchId")
																		.val()
																		.trim(),
														dataType : "json",
														success : function(data) {
															var findInfo = "";
															if (data.result == "ok") {
																findInfo = "검색결과 : "
																		+ data.mvo.id
																		+ " "
																		+ data.mvo.name
																		+ " "
																		+ data.mvo.email
																		+ ' <input type="button" id="addBtn" value="친구추가" onclick="javascript:addFriend()">';
																$(
																		"#friendIdHidden")
																		.val(
																				data.mvo.id);
															} else if (data.result == "fail") {
																findInfo = "검색결과 : "
																		+ data.mvo.id
																		+ " "
																		+ data.mvo.name
																		+ " "
																		+ data.mvo.email;
															} else if (data.result == "null") {
																findInfo = "일치하는 회원 정보를 찾지 못했습니다.";
															}
															$(
																	"#findMemberResult")
																	.html(
																			findInfo);
														}//success
													});//ajax
										});
					});
</script>

<div class="section" align="center">
	<div class="container">
		<div class="row"></div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			&nbsp;&nbsp;&nbsp; <img
				src="${initParam.root }img/g_my_gibuticon.jpg" height="30"
				width="130"> <br> <br>
			<div class="col-md-2">
				<div class="mypage"></div>
				<div id="container">
					<div id="mypage">
						<br> <img src="${initParam.root }img/g_favorite_1.jpg"
							width="150"> <br>
						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="${initParam.root }member/memberRanksView.gibu">
									<span style="font-family: &amp; amp;">기부랭킹보기</span>
							</a></li>
							<li><a
								href="${initParam.root}bookmark/getBookmarkList.gibu?myId=${sessionScope.mvo.id}">
									<span style="font-family: &amp; amp;">즐겨찾기 목록</span>
							</a></li>
							<li><a
								href="${initParam.root}freeBoard/myPost.gibu?myId=${sessionScope.mvo.id}"><span
									style="font-family: &amp; amp;">작성글</span></a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">댓글
										단 글</span></a></li>
							<li><a href="${initParam.root}member/updateMemberForm.gibu">
									<span style="font-family: &amp; amp;">회원정보 수정</span>
							</a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">회원탈퇴</span></a></li>
						</ul>
						<img src="${initParam.root }img/g_favorite_2.jpg" width="150">
						<br>
						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="javascript:chargePopup()" class="sr_txt5">
									<span style="font-family: &amp; amp;">충전하기</span>
							</a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">선물하기</span></a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">선물함
										내역</span></a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">사용
										내역</span></a></li>
							<!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
						</ul>
						<img src="${initParam.root }img/g_favorite_3.jpg" width="150">
						<br>

						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="${initParam.root }friend/memberlist.gibu">친구
									찾기</a></li>
							<li><a
								href="${initParam.root }friend/friendlist.gibu?myId=${sessionScope.mvo.id}">
									친구 목록보기</a></li>
						</ul>
					</div>
				</div>
			</div>

			<div class="col-md-8 col-md-offset-1">

				<div align="center">
					<br> <br> <img
						src="${initParam.root}img/g_my_cone_friend.jpg" width="800">
				</div>
				<br> <br> <br>
				<div class="col-md-12 col-md-offset-1/2">
					<input type="search" placeholder="아이디로 회원 검색" id="searchId"
						name="searchId" size="14"> <input type="button" value="검색"
						id="findBtn">&nbsp;<span id="findMemberResult"></span> <input
						type="hidden" id="friendIdHidden"><br>
					<table class="type09" align="center">
						<thead>
							<tr>
								<th scope="col" width="100" align="center">아이디</th>
								<th scope="col" width="100" align="center">이름</th>
								<th scope="col" width="200" align="center">이메일</th>
								<th scope="col" width="100" align="center">삭제</th>
							</tr>
						</thead>
						<c:forEach items="${requestScope.list }" var="list">
							<tbody>
								<tr>
									<td>${list.friend.id }</td>
									<td>${list.friend.name }</td>
									<td>${list.friend.email }</td>
									<td><input type="button" value="친구삭제"
										onclick="delFriend('${list.friend.id}')"><br></td>
								</tr>
							</tbody>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>

