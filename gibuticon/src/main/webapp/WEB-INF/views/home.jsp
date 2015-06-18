<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="js/jquery.cycle2.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<style type="text/css">
/* set border-box so that percents can be used for width, padding, etc (personal preference) */
.cycle-slideshow,.cycle-slideshow * {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.cycle-slideshow {
	width: 100%;
	min-width: 200px;
	/* max-width: 500px; */
	margin: 10px auto;
	padding: 0;
	position: relative;
	background: url(http://malsup.github.com/images/spinner.gif) 50% 50%
		no-repeat;
}

/* slideshow images (for most of the demos, these are the actual "slides") */
.cycle-slideshow img {
	/* 
    some of these styles will be set by the plugin (by default) but setting them here
    helps avoid flash-of-unstyled-content
    */
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	padding: 0;
	display: block;
}

/* in case script does not load */
.cycle-slideshow img:first-child {
    position: static; z-index: 100;
}

/* pager */
.cycle-pager {
	text-align: center;
	width: 100%;
	z-index: 500;
	position: absolute;
	top: 10px;
	overflow: hidden;
}

.cycle-pager span {
	font-family: arial;
	font-size: 50px;
	width: 16px;
	height: 16px;
	display: inline-block;
	color: #ddd;
	cursor: pointer;
}

.cycle-pager span.cycle-pager-active {
	color: #8282FF;
}

.cycle-pager>* {
	cursor: pointer;
}
</style>

<div class="cycle-slideshow" data-cycle-fx="scrollHorz"
	data-cycle-pause-on-hover="true" data-cycle-speed="500"
	data-cycle-timeout="5000" data-cycle-loader="true">
	<!-- empty element for pager links -->
	<div class="cycle-pager"><span class="cycle-pager span"></span>	</div>

	<img class="cycle-slideshow img" src="img/기부.jpg">
	<img class="cycle-slideshow img" src="img/제목 없음.jpg">
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-4" align="center">
								<a href="#"><img src="img/whatsgibuticon.png"
									class="img-responsive"></a>
								<h2>기부티콘이란</h2>
								<p>사랑하는 이에게 기부를 선물하세요</p>
							</div>
							<div class="col-md-4" align="center">
								<a href="#"><img src="img/mainreviews.png"
									class="img-responsive"></a>
								<h2>후원 후기</h2>
								<p>함께 만들어가는 세상</p>
							</div>
							<div class="col-md-4" align="center">
								<a href="#"><img src="img/ranking.jpg"
									class="img-responsive"></a>
								<h2>회원랭킹</h2>
								<p>회원 기부 랭킹</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>