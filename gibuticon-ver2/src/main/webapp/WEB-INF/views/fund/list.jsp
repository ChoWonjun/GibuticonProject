<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$().ready(function() {
		var imgHeight = $("#imgTile").width() * 0.705;
		$("img[name=imgEl]").height(imgHeight);
	});
</script>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</div>

<img src="${initParam.root }img\g_gibusite2.jpg" width="100%">

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12 col-md-offset-2">
				<a href="http://www.makehope.org/"><img
					src="${initParam.root }img\g_beautiful_logo.jpg"></a>| <a
					href="http://www.dreamfull.or.kr/app/newdf/main"><img
					src="${initParam.root }img\g_dreamfull_logo.jpg"></a> |<a
					href="http://hope.daum.net/"><img
					src="${initParam.root }img\g_daum_logo.jpg"></a>| <a
					href="http://happybean.naver.com/"><img
					src="${initParam.root }img\g_naver_logo.jpg"></a>
			</div>
		</div>
	</div>
</div>
<br>
<br>
<br>
<div class="section">
	<div class="container">
		<div class="col-md-offset-6">
			<select name="site" style="height: 30px; width: 400px;">
				<option value="">사이트보기</option>
				<option value="희망제작소">희망제작소</option>
				<option value="드림풀">드림풀</option>
				<option value="희망해">희망해</option>
				<option value="해피빈">헤피빈</option>
			</select> &nbsp;&nbsp; <a href="#"><img
				src="${initParam.root }img\g_fundlist_btn.jpg" width="150"></a>
		</div>
	</div>
</div>
<hr>

<br>
<hr>
<div class="row">
	<%-- <c:forEach items=""> --%>
	<c:forEach items="${requestScope.vo.list}" var="FundVO">
		<c:forEach items="${FundVO.photoList }" var="FundPhotoVO" begin="0"
			end="0">
			<c:set value="${FundPhotoVO.realName }" var="photoName" />
		</c:forEach>
<<<<<<< HEAD
	</div>
	<div class="col-md-offset-6 col-md-6">
		<ul class="pagination">
			<c:set var="pb" value="${requestScope.vo.pagingBean}"></c:set>
			<c:if test="${pb.previousPageGroup}">
				<li><a
					href="${initParam.root }fund/getList.gibu?pageNo=${pb.startPageOfPageGroup-1}">Prev</a>
				</li>
			</c:if>
			<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
					end="${pb.endPageOfPageGroup}">
					<a href="${initParam.root }fund/getList.gibu?pageNo=${i }">${i }</a>
				</c:forEach></li>
			<c:if test="${pb.nextPageGroup}">
				<li><a
					href="${initParam.root }fund/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}">Next</a>
				</li>
			</c:if>
		</ul>
	</div>
	<br></br>
	<c:if test="${sessionScope.mvo.admin=='yes'}">
		<a href="${initParam.root }fund/writeForm.gibu"> <input
			class="btn btn-default" type="submit" value="글쓰기"></a>
			
	</c:if>
	<br>
=======
		<!-- 1st 사연 -->
		<div class="col-md-4" id="imgTile">
			<c:choose>
				<c:when test="${photoName!=null}">
					<a
						href="${initParam.root }fund/showContent.gibu?no=${FundVO.fundNo }"><img
						src="${initParam.root}upload/${photoName}" width="100%"
						name="imgEl"
						onMouseOver="this.style.opacity='.6'; this.style.filter='alpha(opacity=60)'"
						onMouseOut="this.style.opacity='1.0'; this.style.filter='alpha(opacity=100)'" /></a>
				</c:when>
				<c:otherwise>
					<a
						href="${initParam.root }fund/showContent.gibu?no=${FundVO.fundNo }"><img
						src="${initParam.root}img/basicImg.jpg" width="100%" id="imgEl"
						onMouseOver="this.style.opacity='.6'; this.style.filter='alpha(opacity=60)'"
						onMouseOut="this.style.opacity='1.0'; this.style.filter='alpha(opacity=100)'" /></a>
				</c:otherwise>
			</c:choose>
			<h4>${FundVO.fundName }</h4>
			<div>${FundVO.startDate }~${FundVO.dueDate }</div>
			<!-- progress bar -->
			<div class="progress" width="100%">
				<div class="progress-bar" role="progressbar" aria-valuemin="0"
					aria-valuemax="100" aria-text=" ${FundVO.progress }%"
					style="width: ${FundVO.progress }%; text-align:left;">&nbsp;&nbsp;${FundVO.progress }
					%&nbsp;&nbsp;${FundVO.curSum } 원</div>
			</div>
			<div>${FundVO.proposal}</div>
			<br>
		</div>
>>>>>>> branch 'master' of https://github.com/ChoWonjun/GibuticonProject.git

	</c:forEach>
</div>
<div class="col-md-offset-6 col-md-6">
	<ul class="pagination">
		<c:set var="pb" value="${requestScope.vo.pagingBean}"></c:set>
		<c:if test="${pb.previousPageGroup}">
			<li><a
				href="${initParam.root }fund/getList.gibu?pageNo=${pb.startPageOfPageGroup-1}">Prev</a>
			</li>
		</c:if>
		<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<a href="${initParam.root }fund/getList.gibu?pageNo=${i }">${i }</a>
			</c:forEach></li>
		<c:if test="${pb.nextPageGroup}">
			<li><a
				href="${initParam.root }fund/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}">Next</a>
			</li>
		</c:if>
	</ul>
</div>
<br></br>
