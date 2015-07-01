<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">

<link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>

<body data-spy="scroll">
	<div class="section">
		<div class="container">
			<div class="row"></div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-2">
					<div id="mypage">
						<img src="/gibuticon-ver2/img/g_notice_introduce_service.jpg"
							width="150"> <br>
						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="/gibuticon-ver2/introduce_gibuticon.gibu">기부티콘이란</a></li>

						</ul>
						<img src="/gibuticon-ver2/img/g_notice_operation_guide.jpg"
							width="150"> <br>
						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="javascript:chargePopup()" class="sr_txt5">
									콘 안내 </a></li>
							<li><a href="/gibuticon-ver2/introduce_what_is_cone.gibu">
									콘 받기 안내</a></li>
							<li><a href="/gibuticon-ver2/introduce_howtogibu.gibu">기부방법
									안내</a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">사용
										내역</span></a></li>
							<!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
						</ul>
						<img src="/gibuticon-ver2/img/g_notice_friend_guide.jpg"
							width="150"> <br>

						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="/gibuticon-ver2/friend/memberlist.gibu">콘친구란?</a></li>
							<li><a
								href="/gibuticon-ver2/friend/friendlist.gibu?myId=java">친구
									둥록 안내</a></li>
						</ul>

					</div>
				</div>
				<img src="img/howtogibu.png" class="img-introduce" width="75%"
					height="75%">
			</div>
		</div>
	</div>
</body>
