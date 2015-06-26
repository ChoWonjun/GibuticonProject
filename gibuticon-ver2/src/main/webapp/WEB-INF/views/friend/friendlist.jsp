<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	function delFriend(friendid){
		alert(friendid+" 친구삭제");
		
		$.ajax({
			type:"post",
			url:"${initParam.root}friend/delFriend.gibu",
			data:"myId=${sessionScope.mvo.id}&friendId="+friendid,
			success:function(result){	
				if(result)
					alert("친구삭제 완료");
			}//success
		});//ajax
	}
</script>

<h3>친구 목록 보기</h3>

<c:forEach items="${requestScope.list }" var="list">
	${list.friend.id }, ${list.friend.name }, ${list.friend.address }, ${list.friend.birth}, ${list.friend.email }
	<input type="button" value="친구삭제" onclick="delFriend('${list.friend.id}')"><br>
</c:forEach>