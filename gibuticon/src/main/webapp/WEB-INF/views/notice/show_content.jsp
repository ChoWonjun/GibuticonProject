<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%-- <link rel="stylesheet" href="${initParam.root }css/board.css" type="text/css">--%>
 <script type="text/javascript">
	function sendList() {
		location.href = "getNoticeList.gibu?no=${requestScope.posting.noticeNo}";
	}
</script>
</head>
<body>

	<p>
		&nbsp;&nbsp;<a href="${initParam.root }index.jsp">홈</a> | <a
			href="${initParam.root }notice/write.jsp">글쓰기</a> | <a
			href="${initParam.root }index.jsp">목록</a>
	</p>
	<table class="content">
		<tr>
			<td>NO : ${requestScope.posting.noticeNo}</td>
			<td colspan="2">${requestScope.posting.title}</td>
		</tr>
		<tr>
			<td>작성자 : 관리자</td>
			<td>${requestScope.posting.writeDate}</td>
			<td>조회수 : ${requestScope.posting.hits}</td>
		</tr>
		<tr>
			<td colspan="3"><pre>${requestScope.posting.content}</pre></td>
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3"><img
				class="action" src="${initParam.root }img/list_btn.jpg"
				onclick="sendList()"> <a
				href="deleteNotice.gibu?noticeNo=${requestScope.posting.noticeNo}"><img
					class="action" src="${initParam.root }img/delete_btn.jpg"></a> <a
				href="update.gibu?noticeNo=${requestScope.posting.noticeNo}"><img
					class="action" src="${initParam.root }img/modify_btn.jpg"></a>
		</tr>
	</table>