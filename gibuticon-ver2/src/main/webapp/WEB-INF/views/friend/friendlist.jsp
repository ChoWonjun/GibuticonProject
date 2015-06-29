<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
<link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	function delFriend(friendid) {
		alert(friendid + " 친구삭제");

		$.ajax({
			type : "post",
			url : "${initParam.root}friend/delFriend.gibu",
			data : "myId=${sessionScope.mvo.id}&friendId=" + friendid,
			success : function(result) {
				if (result)
					alert("친구삭제 완료");
			}//success
		});//ajax
	}
</script>

<div class="section">
	<div class="container">
		<div class="row">
			<c:forEach items="${requestScope.list }" var="list">
	${list.friend.id }, ${list.friend.name }, ${list.friend.address }, ${list.friend.birth}, ${list.friend.email }
	<input type="button" value="쪽지전송"
					onclick="sendMessagePopup('${list.friend.id}')">
				<input type="button" value="친구삭제"
					onclick="delFriend('${list.friend.id}')">
				<br>
			</c:forEach>
			<div class="col-md-2">
				<div id="container">
					<div class="snb_v1">
						<dl class="menu">
							<dt class="u_intro">
								<br>
								<br> <img src="${initParam.root }img/g_my_gibuticon.jpg"
									height="30" width="130"> <br> <br> <span
									style="font-family: &amp; amp;">회원정보</span> <br>
								<hr>
							</dt>
							<dd>
								<ul"font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a
										href="${initParam.root }member/memberRanksView.gibu"
										class="u_txt1"> <span style="font-family: &amp; amp;">기부랭킹보기</span></a></li>
									<li><a
										href="${initParam.root}bookmark/getBookmarkList.gibu?myId=${sessionScope.mvo.id}"
										class="u_txt2"><span style="font-family: &amp; amp;">즐겨찾기
												목록</span></a></li>
									<li><a href="#" class="u_txt3"><span
											style="font-family: &amp; amp;">작성글</span></a></li>
									<li><a href="#" class="u_txt5"> <span
											style="font-family: &amp; amp;">댓글 단 글</span></a></li>
									<li><a
										href="${initParam.root}member/updateMemberForm.gibu"> <span
											style="font-family: &amp; amp;">회원정보 수정</span>
									</a></li>
									<li><a href="#" class="u_txt5"> <span
											style="font-family: &amp; amp;">회원탈퇴</span></a></li>
								</ul>
							</dd>
							<dt class="s_srch">
								<br> <br> <span style="font-family: &amp; amp;">포인트
									부분</span> <br>
								<hr>
							</dt>
							<dd>
								<ul"font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a href="javascript:chargePopup()" class="sr_txt5">
											<span style="font-family: &amp; amp;">충전하기</span>
									</a></li>
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">선물하기</span></a></li>
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">선물함 내역</span></a></li>
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">사용 내역</span></a></li>
									<!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
								</ul>
							</dd>
							<dd></dd>
							<dt class="s_srch">
								<br> <br> <span style="font-family: &amp; amp;">콘
									친구</span> <br>
								<hr>
							</dt>
							<dd>
								<ul"font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">친구 찾기</span></a></li>
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">친구 목록보기</span></a></li>
								</ul>
							</dd>
						</dl>
						<ul class="snb_btn"></ul>
					</div>
				</div>
			</div>

			<div class="col-md-8 col-md-offset-1">

				<div align="center">
					<br>
					<br> <img src="${initParam.root}img\g_my_cone_friend.jpg"
						width="800">
				</div>
				<br> <br> <br> <br> <br>
				<div class="col-md-12 col-md-offset-1/2">
					<table class="type09">
						<thead>
							<tr>
								<th scope="col">아이디</th>
								<th scope="col">이름</th>
								<th scope="col">이메일</th>
								<th scope="col">삭제</th>
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