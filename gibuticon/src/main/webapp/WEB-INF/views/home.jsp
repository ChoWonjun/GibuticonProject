<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!-- Cycle2 (슬라이드쇼) -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>

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
	/* margin: 10px auto; */
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
	position: static;
	z-index: 100;
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
	color: #337cbb;
}

.cycle-pager>* {
	cursor: pointer;
}
</style>

<div class="cycle-slideshow" data-cycle-fx="scrollHorz"
	data-cycle-pause-on-hover="true" data-cycle-speed="500"
	data-cycle-loader="wait" data-cycle-timeout="5000"
	data-cycle-easing="linear">
	<!-- empty element for pager links -->
	<div class="cycle-pager"></div>

	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<img class="cycle-slideshow img" src="img/메인배너1.jpg"> <img
		class="cycle-slideshow img" src="img/메인배너2.jpg">
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-4" align="center">
								<a href="${initParam.root }introduce_gibuticon.gibu"><img
									src="img/기부티콘이란.jpg" width="350"></a>
								
							</div>
							<div class="col-md-4" align="center">
								<a href="#"><img src="img/후원후기.png"
									class="img-responsive" width="1200"></a>
							
							</div>
							<div class="col-md-4" align="center">
								<a href="${initParam.root }memberRanksView.gibu"><img src="img/회원랭킹.jpg"
									class="img-responsive"></a>
								
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
