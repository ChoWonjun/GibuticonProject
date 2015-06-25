<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-29">
				<img src="${initParam.root }img\g_gibusite.jpg"
					class="img-responsive">
			</div>
		</div>
		<br>
		<hr>
		<div class="row">
			<%-- <c:forEach items=""> --%>
			<c:forEach items="${requestScope.vo.list}" var="FundVO">
				<c:forEach items="${FundVO.photoList }" var="FundPhotoVO" begin="0"
					end="0">
					<c:set value="${FundPhotoVO.realName }" var="photoName" />
				</c:forEach>
				<!-- 1st 사연 -->
				<div class="col-md-4">
					<a
						href="${initParam.root }fund/showContent.gibu?no=${FundVO.fundNo }"><img
						width="360" height="270"
						src="${initParam.root}upload/${photoName}"
						onMouseOver="this.style.opacity='.6'; this.style.filter='alpha(opacity=60)'"
						onMouseOut="this.style.opacity='1.0'; this.style.filter='alpha(opacity=100)'" /></a>
					<h4>${FundVO.fundName }</h4>
					<div>${FundVO.startDate } ~ ${FundVO.dueDate }</div>
					<!-- progress bar -->
					<div class="progress">
						<!-- <progress max="100" value="80"></progress> -->
						<div class="progress-bar" role="progressbar" aria-valuemin="0" 
							aria-valuemax="100" aria-text=" ${FundVO.progress }%" style="width: ${FundVO.progress }%; text-align:left;" >&nbsp;&nbsp;${FundVO.progress } %&nbsp;&nbsp;${FundVO.curSum } 원</div>
					</div>
					<div>${FundVO.proposal}</div>
					<br>
				</div>
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
		<c:if test="${sessionScope.mvo.admin=='yes'}">
			<a href="${initParam.root }fund/writeForm.gibu"> <input
				class="btn btn-default" type="submit" value="글쓰기"></a>
		</c:if>
		<br>
	</div>
</div>