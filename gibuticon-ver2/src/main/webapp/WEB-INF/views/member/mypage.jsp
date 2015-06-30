<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
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
				<table class="col-md-12 boder-line">
					<tbody>
						<tr class="info">
							<td width="280">
								<div class="col-md-11 col-md-offset-2">
									<div id="content_w">
										<div class="sectioin_mymain_bean2">
											<div class="bx_inner"></div>
											<div class="mymain_bean mymain_bean2">
												<img src="${initParam.root }img/g_my_ranking.jpg" width="72"
													height="22" alt="나눔랭킹">
												<!-- 091222 수정 -->
												<img
													src="http://happyimg2.naver.net/img3/happybean/img/icon_folder_next.gif"
													width="4" height="9" alt="" class="arrow"> <br>
												<br>
												<div class="num_ranking">
													<div class="num_myb">
														<span class="no9">9</span> <span class="coma">,</span> <span
															class="no1">1</span> <span class="no1">1</span> <span
															class="no4">4</span> <span class="coma">,</span> <span
															class="no7">7</span> <span class="no7">7</span> <span
															class="no4">4</span> <span class="we">위</span>
													</div>
												</div>
												<div class="bx_bg">
													<table cellpadding="0" cellspacing="0" summary="">
														<colgroup>
															<col width="87">
															<col width="">
														</colgroup>
														<tbody>
															<tr>
																<th><img
																	src="http://happyimg2.naver.net/img3/happybean/img/th_my_dona_bank.gif"
																	width="67" height="11" alt="기부 · 저금횟수"></th>
																<td><strong class="keep">9,114,774</strong>위</td>
															</tr>
															<tr>
																<th><img src="${initParam.root }img/g_cone_chargeamount.jpg"
																	width="55" height="13" alt="콘 충전금액"></th>
																<td><strong class="keep">403,944</strong>위</td>
															</tr>
															<tr>
																<th><img
																	src="http://happyimg2.naver.net/img3/happybean/img/th_my_dona_bank2.gif"
																	width="57" height="11" alt="기부 · 저금액"></th>
																<td><strong class="keep">9,114,761</strong>위</td>
															</tr>
														</tbody>
													</table>
												</div>
											</div>
										</div>
									</div>
								</div>
							</td>
							<td width="250">
								<div class="col-md-8">
									<div class="row">
										<!-- 100104 수정 -->
										<div class="bean_subject">
											<a href="http://happybean.naver.com/my/CongAccount.nhn"><img
												src="${initParam.root }img/g_possession_cone.jpg" width="" height="20"
												alt="보유한 콘"></a> <img
												src="http://happyimg2.naver.net/img3/happybean/img/icon_folder_next.gif"
												width="4" height="9" alt="" class="arrow">
											<div class="bean_num">
												<div class="bean_number"></div>
											</div>
										</div>
										<br>
										<!-- //100104 수정 -->
										<div class="bx_bg">
											<table cellpadding="0" cellspacing="0" summary="기부콩의 정보입니다">
												<colgroup>
													<col width="77">
													<col width="79">
													<col width="89">
													<col>
												</colgroup>
												<tbody>
													<tr>
														<th><img src="${initParam.root }img/g_cone_quantity.jpg"
															width="53" height="17" alt="개인보유콘"></th>
														<td class="bd_l"><a href="#"><strong class="gibu">${sessionScope.mvo.point }</strong></a>개</td>
													</tr>
												</tbody>
											</table>
										</div>
										<div class="bean">
											<!-- 100104 수정 -->
											<div class="bean_subject">
												<h4>
													<a href="#"><img src="${initParam.root }img/g_fund_cone.jpg"
														width="" height="20" alt="기부한콘"></a> <img
														src="http://happyimg2.naver.net/img3/happybean/img/icon_folder_next.gif"
														width="4" height="9" alt="" class="arrow">
												</h4>
												<div class="bean_num">
													<div class="bean_number" style="font-family: &amp; amp;">
														<div class="num_b">
															<span class="cong">콘</span> <span class="no0">0</span> <span
																class="unit">개</span>&nbsp;&nbsp;&nbsp;&nbsp; <span
																class="no0">0</span> <span class="won">원</span>
														</div>
													</div>
												</div>
											</div>
											<!-- //100104 수정 -->
										</div>
									</div>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<!-- //이전,다음,목록 -->
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row"></div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row"></div>
	</div>
</div>



