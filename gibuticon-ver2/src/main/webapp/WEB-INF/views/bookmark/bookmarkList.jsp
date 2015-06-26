<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript"> 

</script>
<c:forEach items="${requestScope.list}" var="bookmark">
	${bookmark.fund.fundName}<br>
</c:forEach>