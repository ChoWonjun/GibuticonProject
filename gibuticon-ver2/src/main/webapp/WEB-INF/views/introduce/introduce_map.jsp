<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="http://fonts.googleapis.com/css?family=Open+Sans:400,700">
</head>


<div class="section">
	<div class="container">
		<div class="col-md-3">
			<div id="mypage">
				<img src="${initParam.root}img\g_notice_introduce_service.jpg"
					width="150">
				<ul class="left01"
					font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
					<li><a href="${initParam.root }introduce_gibuticon.gibu">기부티콘은</a></li>

					<li><a href="${initParam.root }introduce_people.gibu">함께하는사람들</a></li>

					<li><a href="${initParam.root }introduce_map.gibu">오시는길</a></li>
				</ul>
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h1>오시는 길</h1>
			</div>
		</div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="col-md-12">
			<iframe width="600" height="450" frameborder="0" style="border: 0"
				src="https://www.google.com/maps/embed/v1/place?key=API_KEY
    &q=Space+Needle,Seattle+WA"
				allowfullscreen> </iframe>
			<!-- 			<img class="img-responsive"
				src="http://maps.googleapis.com/maps/api/staticmap?center=Tombouctou,Mali&amp;zoom=12&amp;size=500x300&amp;sensor=false"> -->
		</div>
	</div>
</div>

</html>