<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>

<script type="text/javascript">
	function chargePopup() {
		var url = "${initParam.root }cone/chargeView.gibu";
		window.open(url, "notice", "width=520,height=280,teop=150,left=200");
	}
</script>
<script type="text/javascript">
	function delBookmark(fundNo) {
		if (confirm("즐겨찾기에서 삭제하시겠습니까?")) {
			location.href = "${initParam.root}bookmark/delBookmark.gibu?myId=${sessionScope.mvo.id}&fundNo="
					+ fundNo;
		} else {
			return false;
		}
	}
</script>
<script type="text/javascript">
	function chargePopup() {
		var url = "${initParam.root }cone/chargeView.gibu";
		window.open(url, "notice", "width=520,height=280,teop=150,left=200");
	}
</script>

<div class="row">
	<div class="col-md-8 col-md-offset-1">
		<img src="${initParam.root}img/g_bookmark.jpg">
		<c:forEach items="${requestScope.list}" var="bookmark">
			<br>
			<br>
			<br>
	NO. <a
				href="${initParam.root}fund/showContent.gibu?no=${bookmark.fund.fundNo}">${bookmark.fund.fundNo}</a> | 모금명 : ${bookmark.fund.fundName} 
					<input type="button"
				onclick="delBookmark('${bookmark.fund.fundNo}')" value="삭제">
			<br>
		</c:forEach>

	</div>
</div>

