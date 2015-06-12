<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Tiles Layout</title>
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="${initParam.root}/css/home.css" />
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link
	href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
	rel="stylesheet" type="text/css">
	<script type="text/javascript">
	
	</script>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="main">
			<tiles:insertAttribute name="main" />
		</div>
		<%-- <div id="right"><tiles:insertAttribute name="right" /></div> --%>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>
	<%-- table layout 방식을 css 로 변경  --%>
	<%-- <table width="100%" border="1" cellpadding="5">
<tr height="100">
 <td colspan="2">
 	<tiles:insertAttribute name="header"></tiles:insertAttribute>
 </td> 
</tr>
<tr height="400">
 <td width="200" valign="top">
 <tiles:insertAttribute name="left"></tiles:insertAttribute>
 </td>
 <td valign="top">
 <tiles:insertAttribute name="main"></tiles:insertAttribute>
 </td>
</tr>
<tr height="70">
 <td colspan="2">
 <tiles:insertAttribute name="footer"></tiles:insertAttribute>
 </td>
</tr>
</table> --%>
</body>
</html>


