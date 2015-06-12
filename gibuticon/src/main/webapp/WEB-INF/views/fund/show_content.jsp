<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${initParam.root }css/board.css" type="text/css">
<script type="text/javascript">
	function sendList(){
		location.href="getFundList.gibu?no=${requestScope.posting.fundNo}";
	}
</script>
</head>
<body>
	
<p>
&nbsp;&nbsp;<a href="${initParam.root }index.jsp">홈</a> | <a href="${initParam.root }board/write.jsp">글쓰기</a> | <a href="${initParam.root }index.jsp">목록</a>
</p>
	<table class="content">
		<tr>
			<td>NO : ${requestScope.posting.fundNo} </td>
			<td colspan="2">${requestScope.posting.fundNo} </td>
		</tr>
		<tr>
			<td>작성자 :  ${requestScope.posting.fundNo}</td>
			<td> ${requestScope.posting.dueDate}</td>
			<td>조회수 : ${requestScope.posting.hits}</td>
		</tr>
		<tr>
			<td colspan="3">
			<pre>${requestScope.posting.content}</pre>
			</td>
		</tr>
		<tr>
			<td valign="middle" align="center" colspan="3">
			 <img class="action" src="${initParam.root }img/list_btn.jpg" onclick="sendList()" >
		     <a href="deleteFund.gibu?no=${requestScope.posting.fundNo}"><img class="action" src="${initParam.root }img/delete_btn.jpg" ></a>
			 <a href="fundUpdateForm.gibu?no=${requestScope.posting.fundNo}"><img class="action" src="${initParam.root }img/modify_btn.jpg" ></a>
		</tr>
	</table>