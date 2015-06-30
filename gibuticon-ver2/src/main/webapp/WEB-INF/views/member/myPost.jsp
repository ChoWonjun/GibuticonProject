<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript"
	src="${initParam.root}js/jquery-1.11.3.min.js"></script>

<script type="text/javascript">

/* 	function chargePopup() {
		var url = "${initParam.root }cone/chargeView.gibu";
		window.open(url, "notice", "width=520,height=280,teop=150,left=200");
	} */
</script>
<script type="text/javascript">
	var selectComp = document.getElementById("searchSelect").value;
	location.href = "${initParam.root }freeBoard/getList.gibu?pageNo=" + pageNo; // myId 추가해야하나
</script>
<div class="section" align="center">
	<div class="container">
		<div class="row"></div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-2">
				<div id="container">
					<div class="snb_v1">
						<dl class="menu">
							<dt class="u_intro">
								<img src="${initParam.root }img/MY기부티콘.jpg" height="30"
									width="130"><br> <br> <span
									style="font-family: &amp; amp;">회원정보</span> <br>
								<hr>
							</dt>
							<dd>
								<ul"font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a
										href="${initParam.root }member/memberRanksView.gibu"
										class="u_txt1"> <span style="font-family: &amp; amp;">기부랭킹보기</span></a></li>
									<li><a
										href="${initParam.root}bookmark/getBookmarkList.gibu?myId=${sessionScope.mvo.id}"
										class="u_txt2"><span style="font-family: &amp; amp;">즐겨찾기
												목록</span></a></li>
									<li><a
										href="${initParam.root}freeBoard/myPost.gibu?myId=${sessionScope.mvo.id}"
										class="u_txt3"><span style="font-family: &amp; amp;">작성글</span></a></li>
									<li><a href="#" class="u_txt5"> <span
											style="font-family: &amp; amp;">댓글 단 글</span></a></li>
									<li><a
										href="${initParam.root}member/updateMemberForm.gibu"> <span
											style="font-family: &amp; amp;">회원정보 수정</span>
									</a></li>
									<li><a href="#" class="u_txt5"> <span
											style="font-family: &amp; amp;">회원탈퇴</span></a></li>
								</ul>
							</dd>
							<dt class="s_srch">
								<br> <br> <span style="font-family: &amp; amp;">포인트
									부분</span> <br>
								<hr>
							</dt>
							<dd>
								<ul"font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a href="javascript:chargePopup()" class="sr_txt5">
											<span style="font-family: &amp; amp;">충전하기</span>
									</a></li>
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">선물하기</span></a></li>
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">선물함 내역</span></a></li>
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">사용 내역</span></a></li>
									<!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
								</ul>
							</dd>
							<dd></dd>
							<dt class="s_srch">
								<br> <br> <span style="font-family: &amp; amp;">콘
									친구</span> <br>
								<hr>
							</dt>
							<dd>
								<ul"font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">친구 찾기</span></a></li>
									<li><a href="#" class="sr_txt5"> <span
											style="font-family: &amp; amp;">친구 목록보기</span></a></li>
								</ul>
							</dd>
						</dl>
						<ul class="snb_btn"></ul>
					</div>
				</div>
			</div>
			<div class="col-md-8 col-md-offset-1">
				<table class="type09" style="font-family: &amp; amp;">
					<thead>
						<tr>
							<th width="100">NO</th>
							<th width="800">제목</th>
							<th width="300">작성일</th>
							<th width="300">조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:choose>
							<c:when test="${sessionScope.mvo!=null}">
								<c:forEach items="${requestScope.lvo.list}" var="board">
									<tr>
										<td>${board.boardNo}</td>
										<td><a
											href="${initParam.root }freeBoard/showContent.gibu?no=${board.boardNo}&id=${sessionScope.mvo.id}">${board.title}</a></td>
										<td>${board.writeDate}</td>
										<td>${board.hits}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<c:forEach items="${requestScope.lvo.list}" var="board">
									<tr>
										<td>${board.boardNo}</td>
										<td>${board.title}</td>
										<td>${board.writeDate}</td>
										<td>${board.memberVO.name}</td>
										<td>${board.hits}</td>
									</tr>
								</c:forEach>
							</c:otherwise>
						</c:choose>
					</tbody>
				</table>
				<div class="col-md-offset-3 col-md-6 col-md-offset-3" align="center">
					<div class="section">
						<form id="pagingForm"
							action="${initParam.root }freeBoard/getList.gibu">
							<div class="container"></div>
							<div class="col-md-offset-6 col-md-6">
								<ul class="pagination">
									<c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
									<c:if test="${pb.previousPageGroup}">
										<li><a
											href="javascript:getList('${pb.startPageOfPageGroup-1}')">Prev</a>
										</li>
									</c:if>
									<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<a href="javascript:getList('${i}')">${i}</a>
										</c:forEach></li>
									<c:if test="${pb.nextPageGroup}">
										<li><a
											href="javascript:getList('${pb.endPageOfPageGroup+1}')">Next</a>
										</li>
									</c:if>
								</ul>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
