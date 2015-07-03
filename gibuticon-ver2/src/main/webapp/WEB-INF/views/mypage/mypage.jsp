<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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


<div class="row">
	<div class="col-md-8">
		<table class="col-md-12 boder-line">
			<tbody>
				<tr class="info">
					<td width="280">
						<div class="col-md-11 col-md-offset-3">
							<div id="content_w">
								<div class="sectioin_mymain_bean2">
									<div class="bx_inner"></div>
									<div class="mymain_bean mymain_bean2">
										<img src="${initParam.root }img/g_my_ranking.jpg" width="72"
											height="22" alt="나눔랭킹">
										<!-- 091222 수정 -->
										<img
											src="http://happyimg2.naver.net/img3/happybean/img/icon_folder_next.gif"
											width="4" height="9" alt="" class="arrow"> <br> <br>
										<div class="num_ranking">
											<div class="num_myb">
												<table class="table" style="font-family: &amp; amp;">
													<thead>
														<tr>
															<th width="100">RANK</th>
															<th width="500">아이디</th>
															<th width="500">총기부콘</th>
														</tr>
													</thead>
													<tbody>
														<tr>
															<td>${requestScope.myrank.rank }</td>
															<td>${requestScope.myrank.memberId }</td>
															<td>${requestScope.myrank.rankVal }</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
										<div class="bx_bg">
											<table cellpadding="0" cellspacing="0" summary="">
												<colgroup>
													<col width="87">
													<col width="">
												</colgroup>

											</table>
										</div>
									</div>
								</div>
							</div>
						</div>
					</td>
					<td width="250">
						<div class="col-md-8 col-md-offset-8">
							<div class="row">
								<!-- 100104 수정 -->
								<div class="bean_subject">
									<br> <br> <img
										src="${initParam.root }img/g_possession_cone.jpg" width=""
										height="20"> <img
										src="http://happyimg2.naver.net/img3/happybean/img/icon_folder_next.gif"
										width="4" height="9" alt="보유한 콘">

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
												<th><img
													src="${initParam.root }img/g_cone_quantity.jpg" width="53"
													height="17" alt="개인보유콘"></th>
												<td class="bd_l"><a href="${initParam.root }cone/mycone.gibu"><strong class="gibu">${sessionScope.mvo.point }</strong></a>개</td>
											</tr>
										</tbody>
									</table>
								</div>

								<div class="bean">
									<!-- 100104 수정 -->
									<div class="bean_subject">
										<h4>

											<br> <br> <img
												src="${initParam.root }img/g_fund_cone.jpg" height="20"
												alt="기부한콘"> <img
												src="http://happyimg2.naver.net/img3/happybean/img/icon_folder_next.gif"
												width="4" height="9" alt="" class="arrow">
										</h4>
										<div class="bean_num">
											<div class="bean_number" style="font-family: &amp; amp;">
												<div class="num_b">
													<span class="cong">콘</span> <span class="no0">${requestScope.givenCone }</span><span
														class="unit">개</span>
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

		<div class="col-md-offset-2">
			<br> <br> <br> <br> <br> <br> <img
				src="${initParam.root}img\g_mypage_cone_friend.jpg" } width="700">
		</div>
	</div>
</div>
<!-- //이전,다음,목록 -->
