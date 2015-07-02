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


<!-- 검색 & 정렬 -->
<script type="text/javascript">
	$().ready(function() {
		var rankOption = $("#rankOption").val();
		$("#rank").val(rankOption).attr("selected", "selected");
		$("select[name=rank]").change(function() {
			$("#searchOptionForm").submit();
		});

		var categoryOption = $("#categoryOption").val();
		$("#category").val(categoryOption).attr("selected", "selected");
		$("select[name=category]").change(function() {
			$("#searchOptionForm").submit();
		});
	});
</script>

<br>
<br>
<br>
<br>

<div align="center">
	<img src="${initParam.root }img/g_gibusite_banner.jpg" width="1280">
</div>


<br>
<br>
<br>
<div class="section">
	<div class="container">
		<div class="col-md-offset-8">
			<select name="site" style="height: 30px; width: 400px;">
				<option value="">사이트별 보기</option>
				<option value="희망제작소">희망제작소</option>
				<option value="드림풀">드림풀</option>
				<option value="희망해">희망해</option>
				<option value="해피빈">헤피빈</option>
			</select>
		</div>
	</div>
</div>


<div class="col-md-offset-7">
	<c:set value="${requestScope.vo.searchOption}" var="option"></c:set>
	<form action="${initParam.root }fund/getList.gibu"
		name="searchOptionForm" id="searchOptionForm">
		<input type="hidden" name="rankOption" id="rankOption"
			value="${option.rank }"> <select name="rank" id="rank">
			<option id="rankOp" value="">Sort By</option>
			<option id="rankOp" value="fundNo">최신등록</option>
			<option id="rankOp" value="dueDate">마감임박</option>
			<option id="rankOp" value="amountDesc">모금율&nbsp;&and;</option>
			<option id="rankOp" value="amountAsc">모금율&nbsp;&or;</option>
		</select>&nbsp;&nbsp; <input type="hidden" name="categoryOption"
			id="categoryOption" value="${option.category }"> <select
			name="category" id="category">
			<option id="categoryOp" value="">Categories</option>
			<option id="categoryOp" value="어린이">어린이</option>
			<option id="categoryOp" value="어르신">어르신</option>
			<option id="categoryOp" value="장애인">장애인</option>
			<option id="categoryOp" value="캠페인">캠페인</option>
		</select>&nbsp;&nbsp; <input type="text" placeholder="제목검색" id="word"
			name="word" value="${option.word }"> <input type="submit"
			value="검색">
	</form>
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
			<%-- <div class="progress" width="100%">
				<div class="progress-bar" role="progressbar" aria-valuemin="0"
					aria-valuemax="100" aria-text=" ${FundVO.progress }%"
					style="width: ${FundVO.progress }%; text-align:left;">&nbsp;&nbsp;${FundVO.progress }
					%&nbsp;&nbsp;${FundVO.curSum } 원</div>
			</div> --%>
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
				href="${initParam.root }fund/getList.gibu?pageNo=${pb.startPageOfPageGroup-1}&rank=${option.rank}&category=${option.category}&word=${option.word}">Prev</a>
			</li>
		</c:if>
		<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
				end="${pb.endPageOfPageGroup}">
				<a
					href="${initParam.root }fund/getList.gibu?pageNo=${i }&rank=${option.rank}&category=${option.category}&word=${option.word}">${i }</a>
			</c:forEach></li>
		<c:if test="${pb.nextPageGroup}">
			<li><a
				href="${initParam.root }fund/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}&rank=${option.rank}&category=${option.category}&word=${option.word}">Next</a>
			</li>
		</c:if>
	</ul>
</div>
<br></br>
<br></br>
