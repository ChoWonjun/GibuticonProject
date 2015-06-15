<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="${initParam.root }css/board.css" type="text/css">
<script type="text/javascript">
	function sendList(){
		location.href="${initParam.root }fund/getList.gibu?no=${requestScope.posting.fundNo}";
	}
	function gibuPopup(){
		var url="${initParam.root }cone/gibuView.gibu?fundNo=${requestScope.posting.fundNo}";
		window.open(url,"gibuPopup",
	   				"width=520,height=280,teop=150,left=200");
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
			<td colspan="2">${requestScope.posting.fundName} </td>
		</tr>
		<tr>
			<td>모금액 :  ${requestScope.posting.curSum}</td>
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
		     <a href="${initParam.root }fund/delete.gibu?no=${requestScope.posting.fundNo}"><img class="action" src="${initParam.root }img/delete_btn.jpg" ></a>
			 <a href="${initParam.root }fund/updateForm.gibu?no=${requestScope.posting.fundNo}"><img class="action" src="${initParam.root }img/modify_btn.jpg" ></a>
			 <input type="button" value="기부하기" onclick="gibuPopup()">
		</tr>
	</table>