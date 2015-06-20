<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<!-- Cycle2 (슬라이드쇼) -->
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script type="text/javascript">
	function sendList() {
		location.href = "${initParam.root }fund/getList.gibu?no=${requestScope.posting.fundNo}";
	}
	function gibuPopup() {
		var url = "${initParam.root }cone/gibuView.gibu?fundNo=${requestScope.posting.fundNo}";
		window.open(url, "gibuPopup", "width=520,height=280,teop=150,left=200");
	}
</script>

<style type="text/css">
/* set border-box so that percents can be used for width, padding, etc (personal preference) */
.cycle-slideshow,.cycle-slideshow * {
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
}

.cycle-slideshow {
	width: 100%;
	min-width: 200px;
	max-width: 390px;
	/* margin: 10px auto; */
	padding: 0;
	position: relative;
	background: url(http://malsup.github.com/images/spinner.gif) 50% 50%
		no-repeat;
}

/* slideshow images (for most of the demos, these are the actual "slides") */
.cycle-slideshow img {
	/* 
    some of these styles will be set by the plugin (by default) but setting them here
    helps avoid flash-of-unstyled-content
    */
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	padding: 0;
	display: block;
}

/* in case script does not load */
.cycle-slideshow img:first-child {
	position: static;
	z-index: 100;
}

/* pager */
.cycle-pager {
	text-align: center;
	width: 100%;
	z-index: 500;
	position: absolute;
	top: 10px;
	overflow: hidden;
}

.cycle-pager span {
	font-family: arial;
	font-size: 50px;
	width: 16px;
	height: 16px;
	display: inline-block;
	color: #ddd;
	cursor: pointer;
}

.cycle-pager span.cycle-pager-active {
	color: #337cbb;
}

.cycle-pager>* {
	cursor: pointer;
}
</style>
</head>
<c:set value="${requestScope.posting }" var="fund"></c:set>
<c:set value="${requestScope.posting.photoList }" var="photoList"></c:set>
<div class="section">
	<div class="container">
		<div class="row">
			<h3>
				<div class="row">
					<h3>
						<span align="center" style="font-family: &amp; amp;">${fund.fundName}</span>
					</h3>
					<br> <br>
					<div class="col-md-4">
						<div class="cycle-slideshow" data-cycle-fx="scrollHorz"
							data-cycle-pause-on-hover="true" data-cycle-speed="500"
							data-cycle-loader="wait" data-cycle-timeout="5000"
							data-cycle-easing="linear">
							<!-- empty element for pager links -->
							<div class="cycle-pager"></div>

							<c:forEach items="${photoList}" var="photo" varStatus="i">
								<img src="${initParam.root }/upload/${photo.realName}">
							</c:forEach>
						</div>
						<div class="row">
							<h4>
								<span style="font-family: &amp; amp;">&nbsp;&nbsp;&nbsp;
									<br>&nbsp;&nbsp;모금액 이렇게 사용됩니다.
								</span>
							</h4>
						</div>
						<font size="2"></font> <font size="3"></font>
						<table style="font-family: &amp; amp;" class="table">
							<tbody>
								<tr>
									<th><font size="3">목표액</font></th>
									<td><font size="3">${fund.goalSum }</font></td>
									<th><font size="3">현재 모금액</font></th>
									<td><font size="3">${fund.curSum }</font></td>
								</tr>
							</tbody>
							<tbody>
								<tr height="2">
									<th colspan="2"><font size="3">집행시기</font></th>
									<td colspan="2"><font size="3">${fund.startDate } ~
											${fund.dueDate }</font></td>
								</tr>
								<tr>
									<th colspan="2"><font size="3">주관기관</font></th>
									<td colspan="2"><font size="3">${fund.proposal }</font></td>
								</tr>
								<tr>
									<th colspan="2"><font size="3">관련링크</font></th>
									<td colspan="2"><a href="${fund.homepage }"><font
											size="3">${fund.homepage }</font></a></td>
								</tr>
							</tbody>
						</table>
						<font style="font-family: &amp; amp;" size="3"> <br>
							<h2>
								<font style="font-family: &amp; amp;" size="5">기부금 사용계획</font>
							</h2> <br>1. 건강-치료 캠페인 <br>&nbsp;&nbsp;(치료비, 이식비 평균
							1,00만원×5명) | 5,000,000원 <br>2. 건강-치료 캠페인 (사회복지적치료비
							200만원×10명) | 20,000,000원 <br> <br>*기부티콘은 신뢰성 있고 투명한 온라인
							모금이 되고자 구체적인 모금 사용 계획과 수정사항을 네티즌에게 공개합니다.
						</font>
					</div>
					<div class="col-md-1"></div>
					<br> <br>
					<div class="col-md-7">${fund.content }</div>
				</div>
				<br> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="javascript:gibuPopup()"

					class="btn btn-default" >기부하기</a>&nbsp;&nbsp; &nbsp;&nbsp; <a 

					class="btn btn-default">즐겨찾기</a>
			</h3>
			<div class="thumb_link">
				<div class="thumb_select"></div>
			</div>
		</div>
	</div>
</div>
<div class="col-md-12">
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
	 <div class="col-md-offset-2 col-md-8 col-md-offset-2">
               <table class="table" style="font-family: &amp; quot;">
                  <thead>
                     <tr>
                        <th width="100">NO</th>
                        <th width="1000">comment</th>
                         <th width="200">작성일</th>
                        <th width="200">작성자</th>
                     </tr>
                  </thead>
                  <tbody>
                  <c:forEach var="comment" items="${requestScope.comment.list}">   
			         <tr>
			             <td>${comment.commentNo }</td>        
			            <td>${comment.text }</td>
			            <td>${comment.commentTime }</td>
			             <td>${comment.memberVO.id }</td> 
			            <td><c:if test="${comment.memberVO.id==sessionScope.mvo.id }">
                        	<input class="btn btn-default" value="삭제하기" type="button" onclick="deleteComment(${comment.commentNo}, ${requestScope.fvo.boardNo} )"> 
                        </c:if></td>
			         </tr>
   					</c:forEach>
                  </tbody>
               </table>
                  </div>
                </div>
              </div>
            </div>
  			<div class="section">
              <div class="container">
                <div class="row">
             <div class="col-md-offset-6 col-md-2 col-md-offset-4">
              <ul class="pagination">
             <c:set var="pb" value="${requestScope.comment.pagingBean}"></c:set>
               <c:if test="${pb.previousPageGroup}">
               <li>
                  <a href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${pb.startPageOfPageGroup-1}">◀</a> 
               </li>
               </c:if>
               <li>
               <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
                  <a href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${i }">${i }</a>
               </c:forEach>
               </li>
               <c:if test="${pb.nextPageGroup}">
               <li>
                  <a href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${pb.endPageOfPageGroup+1}">▶</a>
               </li>
               </c:if>
              </ul>
            </div>
            </div>
            </div>
            </div>
			</div>
		</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</div>
