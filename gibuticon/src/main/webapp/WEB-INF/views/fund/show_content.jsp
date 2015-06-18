<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

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
	
		<table class="comment">
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="title">작성자</th>
			<th class="name">내용</th>
			<th class="date">작성시간</th>
			</tr>
		</thead>
		<tbody>			
	<c:forEach var="comment" items="${requestScope.comment.list}">	
			<tr>
			    <td>${comment.commentNo }</td>
			    <td>${comment.memberVO.id }</td>			
				<td>${comment.text }</td>
				<td>${comment.commentTime }</td>
			</tr>
	</c:forEach>
			<tr>
				<td colspan=5 align="center">
					<c:set var="pb" value="${requestScope.comment.pagingBean}"></c:set>
					<c:if test="${pb.previousPageGroup}">
						<a href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${pb.startPageOfPageGroup-1}">◀</a> 
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<a href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${i }">${i }</a>
					</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</td>
			</tr>					
		</tbody>					
	</table>