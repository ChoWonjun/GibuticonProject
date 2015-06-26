<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	function addFriend(friendid){
		alert(friendid+" 친구추가");
		
		$.ajax({
			type:"post",
			url:"${initParam.root}friend/addFriend.gibu",
			data:"myId=${sessionScope.mvo.id}&friendId="+friendid,
			success:function(result){	
				if(result)
					alert("친구추가 완료");
			}//success
		});//ajax
	}
</script>

<h3>회원 검색</h3>

<c:forEach items="${requestScope.list }" var="member">
	${member.id }, ${member.name }, ${member.address }, ${member.birth}, ${member.email }
	<input type="button" value="친구등록" onclick="addFriend('${member.id}')"><br>
</c:forEach>