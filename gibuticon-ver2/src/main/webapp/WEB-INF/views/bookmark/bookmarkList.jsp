<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	function chargePopup() {
		var url = "${initParam.root }cone/chargeView.gibu";
		window.open(url, "notice", "width=520,height=280,teop=150,left=200");
	}
</script>
<script type="text/javascript">
	function delBookmark(fundNo) {
		if (confirm("즐겨찾기에서 삭제하시겠습니까?")) {
			location.href = "${initParam.root}bookmark/delBookmark.gibu?myId=${sessionScope.mvo.id}&fundNo="
					+ fundNo;
		} else {
			return false;
		}
	}
</script>
<div class="section" align="center">
	<div class="container">
		<div class="row"></div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
		<div class="col-md-2">
			&nbsp;&nbsp;&nbsp; <img
				src="${initParam.root }img/g_my_gibuticon.jpg" height="30"
				width="130"> <br> <br>
			
				<div class="mypage"></div>
				<div id="container">
					<div id="mypage">
						<br> <img src="${initParam.root }img\g_favorite_1.jpg"
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
							<li><a href="#"><span style="font-family: &amp; amp;">작성글</span></a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">댓글
										단 글</span></a></li>
							<li><a href="${initParam.root}member/updateMemberForm.gibu">
									<span style="font-family: &amp; amp;">회원정보 수정</span>
							</a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">회원탈퇴</span></a></li>
						</ul>
						<img src="${initParam.root }img\g_favorite_2.jpg" width="150">
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
						<img src="${initParam.root }img\g_favorite_3.jpg" width="150">
						<br>

						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="${initParam.root }friend/memberlist.gibu"
								class="sr_txt5"> <span style="font-family: &amp; amp;">친구
										찾기</span></a></li>
							<li><a
								href="${initParam.root }friend/friendlist.gibu?myId=${sessionScope.mvo.id}"
								class="sr_txt5"> <span style="font-family: &amp; amp;">친구
										목록보기</span></a></li>
						</ul>

					</div>
				</div>
			</div>
			<div class="col-md-8 col-md-offset-1">
				<img src="${initParam.root}img\g_bookmark.jpg">
				<c:forEach items="${requestScope.list}" var="bookmark">
					<br>
					<br>
					<br>
	NO. <a href="#">${bookmark.fund.fundNo}</a> | 모금명 : ${bookmark.fund.fundName} 
					<input type="button"
						onclick="delBookmark('${bookmark.fund.fundNo}')" value="삭제">
					<br>
				</c:forEach>

			</div>
		</div>
	</div>
</div>

