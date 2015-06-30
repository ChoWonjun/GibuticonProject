<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>

</head>
<br>
<br>
<br>
<br>
<br>

<div class="section">
	<div class="container">
		<div class="col-md-12">
			<div class="col-md-1">
				<div id="mypage">
					<img src="${initParam.root}img\g_notice_introduce_service.jpg"
						width="150">
					<ul class="left01"
						font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
						<li><a href="${initParam.root }introduce_gibuticon.gibu">기부티콘은</a></li>
						<li><a href="${initParam.root }introduce_people.gibu">함께하는사람들</a></li>
						<li><a href="#">오시는길</a></li>
					</ul>
				</div>
			</div>
				<div class="col-md-9 col-md-offset-1">
					<h1 class="text-center">함께하는 사람들</h1>
					<p class="text-center text-primary" contenteditable="true">
						기부티콘을 함께 만든 사람들 <br>
					</p>
				

				<div class="section">
					<div class="container">
						<div class="col-md-11">
							<div class="col-md-3">
								<img src="${initParam.root}img\원준오빠.jpg"
									class="center-block img-circle img-responsive"
									style="width: 200px; height: 200px;">
								<h3 class="text-center">조원준</h3>
								<p class="text-center">Project Manager</p>
							</div>
							<div class="col-md-3">
								<img src="${initParam.root}img\효섭오빠.jpg"
									style="width: 200px; height: 200px;"
									class="center-block img-circle img-responsive">
								<h3 class="text-center">정효섭</h3>
								<p class="text-center">Project Leader</p>
							</div>
							<div class="col-md-3">
								<img src="${initParam.root}img\경희.jpg"
									style="width: 200px; height: 200px;"
									class="center-block img-circle img-responsive">
								<h3 class="text-center">유경희</h3>
								<p class="text-center">Developer</p>
							</div>
						</div>
					</div>
					<div class="section">
						<div class="container">
							<div class="col-md-11">

								<div class="col-md-3">
									<img src="${initParam.root}img\지현언니.jpg"
										style="width:200px; height: 200px;"
										class="center-block img-circle img-responsive">
									<h3 class="text-center">이지현</h3>
									<p class="text-center">Developer</p>
								</div>
			
								<div class="col-md-3">
									<img src="${initParam.root}img\임수현.png"
										style="width: 200px; height: 200px;"
										class="center-block img-circle img-responsive">
									<h3 class="text-center">임수현</h3>
									<p class="text-center">Developer</p>
								</div>
								<div class="col-md-3">
									<img src="${initParam.root}img\강사님.jpg"
										style="width: 200px; height:200px;"
										class="center-block img-circle img-responsive">
									<h3 class="text-center">서정우</h3>
									<p class="text-center">Developer</p>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
</div>
	</div>
</html>