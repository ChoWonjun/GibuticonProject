<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	function chargePopup() {
		var url = "${initParam.root }cone/chargeView.gibu";
		window.open(url, "notice", "width=520,height=280,teop=150,left=200");
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
			&nbsp;&nbsp;&nbsp; <img src="${initParam.root }img/g_my_gibuticon.jpg"
				height="30" width="130"> <br> <br>
			<div class="col-md-2">
				<div class="mypage"></div>
				<div id="container">
					<div id="mypage">
					<br>
								<img src="${initParam.root }img/g_favorite_1.jpg" width="150"> <br>
								<ul class="left01" font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a href="${initParam.root }member/memberRanksView.gibu"> 
										<span style="font-family: &amp; amp;">기부랭킹보기</span></a></li>
									<li><a href="${initParam.root}bookmark/getBookmarkList.gibu?myId=${sessionScope.mvo.id}">
									<span style="font-family: &amp; amp;">즐겨찾기 목록</span></a></li>
									<li><a href="${initParam.root}freeBoard/myPost.gibu?myId=${sessionScope.mvo.id}"><span
											style="font-family: &amp; amp;">작성글</span></a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">댓글 단 글</span></a></li>
									<li><a
										href="${initParam.root}member/updateMemberForm.gibu"> <span
											style="font-family: &amp; amp;">회원정보 수정</span>
									</a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">회원탈퇴</span></a></li>
								</ul>
								<img src="${initParam.root }img/g_favorite_2.jpg" width="150"> <br>
								<ul class="left01" font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a href="javascript:chargePopup()" class="sr_txt5">
											<span style="font-family: &amp; amp;">충전하기</span>
									</a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">선물하기</span></a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">선물함 내역</span></a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">사용 내역</span></a></li>
									<!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
								</ul>
						        <img src="${initParam.root }img/g_favorite_3.jpg" width="150"> <br>
								
								<ul class="left01" font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a href="${initParam.root }friend/memberlist.gibu">친구 찾기</a></li>
									<li><a href="${initParam.root }friend/friendlist.gibu?myId=${sessionScope.mvo.id}"> 친구 목록보기</a></li>
								</ul>
						
					</div>
				</div>
			</div>
			
	<div class="col-md-8">		
<h3>기부액별 순위</h3>
<br><br>
				<table class="table" style="font-family: &amp; amp;">
					<thead>
						<tr>
							<th width="100">RANK</th>
							<th width="500">아이디</th>
							<th width="500">총기부액</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.rank1}" var="posting">
							<tr>
								<td>${posting.rank }</td>
								<td>${posting.memberId }</td>
								<td>${posting.rankVal }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</div>	
<h3>기부함 수 순위</h3>
<br><br>
				<table class="table" style="font-family: &amp; amp;">
					<thead>
						<tr>
							<th width="100">RANK</th>
							<th width="500">아이디</th>
							<th width="500">기부함수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.rank2}" var="posting">
							<tr>
								<td>${posting.rank }</td>
								<td>${posting.memberId }</td>
								<td>${posting.rankVal }</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
</div></div></div></div>