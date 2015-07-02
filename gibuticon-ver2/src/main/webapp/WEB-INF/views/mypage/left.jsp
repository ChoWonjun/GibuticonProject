<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


&nbsp;&nbsp;&nbsp;
<img src="${initParam.root }img/g_my_gibuticon.jpg" height="30"
	width="130">
<br>
<br>
<div class="col-md-2">

	<div id="container">
		<div id="mypage">
			<br> <img src="${initParam.root }img/g_favorite_1.jpg"
				width="170"> <br>
			<ul class="left01"
				font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
				<li><a href="${initParam.root }member/memberRanksView.gibu">
						<span style="font-family: &amp; amp;">기부랭킹</span>
				</a></li>
				<li><a
					href="${initParam.root}bookmark/getBookmarkList.gibu?myId=${sessionScope.mvo.id}">
						<span style="font-family: &amp; amp;">즐겨찾기</span>
				</a></li>
				<li><a
					href="${initParam.root}freeBoard/myPost.gibu?myId=${sessionScope.mvo.id}"><span
						style="font-family: &amp; amp;">작성한글</span></a></li>
				<li><a href="${initParam.root}member/updateMemberForm.gibu">
						<span style="font-family: &amp; amp;">회원정보</span>
				</a></li>
				<li><a href="#"> <span style="font-family: &amp; amp;">회원탈퇴</span></a></li>
			</ul>
			<img src="${initParam.root }img/g_favorite_2.jpg" width="150">
			<br>
			<ul class="left01"
				font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
				<li>
					<!-- <a href="javascript:chargePopup()" class="sr_txt5"> --> <a
					id="modal-755774" href="#modal-container-755774"
					data-toggle="modal" class="sr_txt5"> <span
						style="font-family: &amp; amp;">충전하기</span>
				</a>
				</li>
				<li><a href="javascript:giftPopup()"> <span style="font-family: &amp; amp;">선물하기</span></a></li>
				<li><a href="#"> <span style="font-family: &amp; amp;">선물내역</span></a></li>
				<li><a href="#"> <span style="font-family: &amp; amp;">기부내역</span></a></li>
				<!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
			</ul>
			<img src="${initParam.root }img/g_favorite_3.jpg" width="150">
			<br>

			<ul class="left01"
				font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
				<li><a
					href="${initParam.root }friend/friendlist.gibu?myId=${sessionScope.mvo.id}">
						친구목록</a></li>
			</ul>
		</div>
	</div>
</div>