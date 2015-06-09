<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<a href="${initParam.root}member_find.gibu">회원검색</a>
<%-- 로그아웃 상태이면 로그인 링크 제공
        로그인 상태이면 로그아웃 링크 제공 
        로그인과 로그아웃을 구현해본다. 
 --%>
 <br>
<c:choose>
	<c:when test="${sessionScope.mvo==null}">
	<a href="${initParam.root}member_login_form.gibu">로그인</a>
	</c:when>
	<c:otherwise>
	<a href="${initParam.root}member_logout.gibu">로그아웃</a>
	</c:otherwise>
</c:choose>












