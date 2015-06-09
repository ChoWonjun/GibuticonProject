<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
	$(document).ready(function(){
		//alert("jquery test");
		$("#findMemberByIdForm").submit(function(){
			var memId=$("#memberId").val();
			if(memId==""){
				alert("아이디를 입력하세요!");
				return false;
			}
		});
	});
</script>    
회원 정보 검색 <br><br>
<form action="findMemberById.do" id="findMemberByIdForm">
아이디 <input type="text" name="memberId" id="memberId">
<input type="submit" value="검색">
</form>