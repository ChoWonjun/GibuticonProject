<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"> 
	function delBookmark(fundNo){
		if(confirm("즐겨찾기에서 삭제하시겠습니까?")){
			location.href="${initParam.root}bookmark/delBookmark.gibu?myId=${sessionScope.mvo.id}&fundNo="+fundNo;
		}
		else{
			return false;
		}
	}
</script>
<c:forEach items="${requestScope.list}" var="bookmark">
	${bookmark.fund.fundNo}<br><input type="button" onclick="delBookmark('${bookmark.fund.fundNo}')" value="삭제"><br>
</c:forEach>