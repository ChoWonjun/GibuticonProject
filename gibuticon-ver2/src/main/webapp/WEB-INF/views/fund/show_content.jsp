<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!-- Cycle2 (슬라이드쇼) -->
<script src="http://malsup.github.com/jquery.cycle2.js"></script>
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1/jquery.min.js"></script>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script type="text/javascript">
	function getCommentList(commentPage){
		$.ajax({
			type : "post",
			url : "${initParam.root}fund/getCommentList.gibu",
			data : "no=${requestScope.posting.fundNo}&commentPage="+commentPage,
			success : function(comment) {
				var table="";
				for(var i=0;i<comment.list.length;i++){
					table+="<tr>";
					
					table+="<td>"+comment.list[i].commentNo+"</td>";
					table+="<td>"+comment.list[i].text+"</td>";
					table+="<td>"+comment.list[i].commentTime+"</td>";
					table+="<td>"+comment.list[i].memberVO.name+"<br>("+comment.list[i].memberVO.id+")</td>";

					table+="<td>";
					if("${sessionScope.mvo.id}"==comment.list[i].memberVO.id) {
						table+="<input class='btn btn-default' value='삭제하기' type='button' "
							+ "onclick=deleteComment("+comment.list[i].commentNo+","+commentPage+")>";
					}
					table+="</td>";
					
					table+="</tr>";
				}
				
				$("#commentView").html(table);
				
				table="";
				
				if(comment.pagingBean.previousPageGroup){
					table+="<li>";
					table+="<a href='javascript:getCommentList("+comment.pagingBean.startPageOfPageGroup-1+")'>◀</a>";
					table+="</li>";
				}
				
				table+="<li>";
				for(var i=comment.pagingBean.startPageOfPageGroup;i<=comment.pagingBean.endPageOfPageGroup;i++){
					table+="<a href='javascript:getCommentList("+i+")'>"+i+"</a>";
				}
				table+="</li>";
				
				if(comment.pagingBean.nextPageGroup){
					table+="<li>";
					table+="<a href='javascript:getCommentList("+comment.pagingBean.endPageOfPageGroup+1+")'>▶</a>";
					table+="</li>";
				}

				$("#commentPageView").html(table);
			}//success
		});//ajax
	}



	function bookmarkRegister(){
		if(confirm("즐겨찾기를 등록하시겠습니까?")){
			location.href="${initParam.root}bookmark/addBookmark.gibu?myId=${sessionScope.mvo.id}&fundNo=${requestScope.posting.fundNo}";
		}else{
			return false;
		}
	}
	function gibuCone() {
		location.href = "${initParam.root}cone/gibu.gibu?fundNo=${requestScope.posting.fundNo}&point="
				+ coneForm.coneCount.value;
	}
	$().ready(function() {
		getCommentList(1);
		var imgHeight = $("#imgTile").width() * 0.705;
		$("img[name=fundPhoto]").height(imgHeight);
	});
	function gibuPopup(){
		var url="${initParam.root }cone/gibuView.gibu?fundNo=${requestScope.posting.fundNo}";
		window.open(url,"gibuPopup",
	   				"width=520,height=280,teop=150,left=200");
	}
	function deleteComment(commentNo, commentPageNo){
		if(confirm(commentNo+"번 댓글을 정말로 삭제하시겠습니까?")) {
			$.ajax({
				type : "post",
				url : "${initParam.root}fund/deleteComment.gibu",
				data : "commentNo="+commentNo,
				success : function() {
					getCommentList(commentPageNo);
				}//success
			});//ajax
		}
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
<c:set value="${requestScope.posting }" var="fund"></c:set>
<c:set value="${requestScope.posting.photoList }" var="photoList"></c:set>

<div class="section">
	<div class="container">
		<div class="row" align="center" style="font-family: &amp; amp;">
			<h1>${fund.fundName}</h1>
		</div>
	</div>
</div>

<div class="section">
	<div class="container">
		<div class="row">
			<br>
			<div class="col-md-6">
				<div class="cycle-slideshow" data-cycle-fx="scrollHorz"
					data-cycle-pause-on-hover="true" data-cycle-speed="500"
					data-cycle-loader="wait" data-cycle-timeout="5000"
					data-cycle-easing="linear">
					<!-- empty element for pager links -->
					<div class="cycle-pager"></div>
					<c:forEach items="${photoList}" var="photo" varStatus="i">
						<img id="fundPhoto"
							src="${initParam.root }/upload/${photo.realName}">
					</c:forEach>
				</div>
			</div>
			${fund.content }
			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-2">
							<a href="javascript:gibuPopup()" role="button"
								class="btn btn-default">기부하기</a>
						</div>

						<div class="col-md-2">
							<a href="javascript:bookmarkRegister()" class="btn btn-default">즐겨찾기</a>
						</div>
						<div class="col-md-2">
							<a
								href="${initParam.root }fund/getList.gibu<%-- ?no=${requestScope.posting.fundNo} --%>"
								class="btn btn-default">목록보기</a>

						</div>
					</div>

				</div>

			</div>

			<div class="col-md-6" align="center">
				<h4>
					<span style="font-family: &amp; amp;"><br> <strong>모금세부
							정보</strong></span>
				</h4>
				<table style="font-family: &amp; amp;" class="table">
					<tbody>
						<tr>
							<th><font size="3">목표액</font></th>
							<td><font size="3">${fund.goalSum } 원</font></td>
						</tr>

						<tr>
							<th><font size="3">현재 모금액</font></th>
							<td><font size="3">${fund.curSum } 원</font></td>
						</tr>

						<tr>
							<th colspan="1"><font size="3">집행시기</font></th>
							<td colspan="3"><font size="3">${fund.startDate } ~
									${fund.dueDate }</font></td>
						</tr>

						<tr>
							<th colspan="1"><font size="3">주관기관</font></th>
							<td colspan="3"><font size="3">${fund.proposal }</font></td>
						</tr>
						<%-- <tr>
							<th colspan="1"><font size="3">관련링크</font></th>
							<td colspan="3"><a href="${fund.homepage }"><font
									size="3">${fund.homepage }</font></a></td>
						</tr> --%>
					</tbody>
				</table>

			</div>

 			<div class="section">
				<div class="container">
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-12">
								<table class="table" style="font-family: &amp; amp;">
									<thead>
										<tr>
											<th width="100">NO</th>
											<th width="1000">comment</th>
											<th width="200">작성일</th>
											<th width="200">작성자</th>
										</tr>
									</thead>
									<tbody id="commentView">
										<!-- 코멘트 출력부분 -->
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
								<ul class="pagination" id="commentPageView">
									<!-- 코멘트 페이지 출력부분 -->
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div> 
		</div>
	</div>
</div>
