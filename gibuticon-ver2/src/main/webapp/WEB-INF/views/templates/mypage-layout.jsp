<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"
	charset="utf-8">

<!-- script -->
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>

<!-- link -->
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.root }css/bootstrap.css" rel="stylesheet"
	type="text/css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="${initParam.root }css/mypage-layout.css">

</head>

<body data-spy="scroll">
	<div id="myContainer">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="myleft" style="min-height: 700px;">
			<tiles:insertAttribute name="myleft" />
		</div>
		<div id="mypage" style="min-height: 700px;">
			<tiles:insertAttribute name="mypage" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
</body>
</html>


