<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script
	src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript"
	src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
<link
	href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">
<script type="text/javascript">
	function getPost(pageNo) {
		/* var selectComp = document.getElementById("searchSelect").value; */
		location.href = "${initParam.root }freeBoard/getPost.gibu?pageNo="
				+ pageNo; // myId 추가해야하나
	}
</script>
<link href="${initParam.root}css/mypage.css" rel="stylesheet"
	type="text/css">
<div class="section" align="center">
	<div class="container">
		<div class="row"></div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="row">

			&nbsp;&nbsp;&nbsp; <img src="${initParam.root }img/g_my_gibuticon.jpg"
				height="30" width="130"> <br> <br>

			<div class="col-md-2">
				<div class="mypage"></div>
				<div id="container">

					<div id="mypage">
						<br> <img src="${initParam.root }img/g_favorite_1.jpg"
							width="170"> <br>
						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="${initParam.root }member/memberRanksView.gibu">
									<span style="font-family: &amp; amp;">기부랭킹보기</span>
							</a></li>
							<li><a
								href="${initParam.root}bookmark/getBookmarkList.gibu?myId=${sessionScope.mvo.id}">
									<span style="font-family: &amp; amp;">즐겨찾기 목록</span>
							</a></li>
							<li><a
								href="${initParam.root}freeBoard/myPost.gibu?myId=${sessionScope.mvo.id}"><span
									style="font-family: &amp; amp;">작성글</span></a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">댓글
										단 글</span></a></li>
							<li><a href="${initParam.root}member/updateMemberForm.gibu">
									<span style="font-family: &amp; amp;">회원정보 수정</span>
							</a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">회원탈퇴</span></a></li>
						</ul>
						<img src="${initParam.root }img/g_favorite_2.jpg" width="150">
						<br>
						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="javascript:chargePopup()" class="sr_txt5">
									<span style="font-family: &amp; amp;">충전하기</span>
							</a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">선물하기</span></a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">선물함
										내역</span></a></li>
							<li><a href="#"> <span style="font-family: &amp; amp;">사용
										내역</span></a></li>
							<!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
						</ul>
						<img src="${initParam.root }img/g_favorite_3.jpg" width="150">
						<br>

						<ul class="left01"
							font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
							<li><a href="${initParam.root }friend/memberlist.gibu">친구
									찾기</a></li>
							<li><a
								href="${initParam.root }friend/friendlist.gibu?myId=${sessionScope.mvo.id}">
									친구 목록보기</a></li>
						</ul>

					<div id="mypage">
					<br>
								<img src="${initParam.root }img\g_favorite_1.jpg" width="150"> <br>
								<ul class="left01" font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a href="${initParam.root }member/memberRanksView.gibu"> 
										<span style="font-family: &amp; amp;">기부랭킹보기</span></a></li>
									<li><a href="${initParam.root}bookmark/getBookmarkList.gibu?myId=${sessionScope.mvo.id}">
									<span style="font-family: &amp; amp;">즐겨찾기 목록</span></a></li>
									<li><a href="${initParam.root}freeBoard/myPost.gibu?myId=${sessionScope.mvo.id}"><span
											style="font-family: &amp; amp;">작성글</span></a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">댓글 단 글</span></a></li>
									<li><a
										href="${initParam.root}member/updateMemberForm.gibu"> <span
											style="font-family: &amp; amp;">회원정보 수정</span>
									</a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">회원탈퇴</span></a></li>
								</ul>
								<img src="${initParam.root }img\g_favorite_2.jpg" width="150"> <br>
								<ul class="left01" font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><li><a id="modal-755773" href="#modal-container-755773"
                     data-toggle="modal">충전하기</a></li>
                  <div class="modal fade" id="modal-container-755773" role="dialog"
                     aria-labelledby="myModalLabel" aria-hidden="true">
                     <div class="modal-dialog">
                        <div class="modal-content">
                           <div class="modal-header">
                              <button type="button" class="close" data-dismiss="modal"
                                 aria-hidden="true">×</button>
                              <h2 class="modal-title" id="myModalLabel">충전하기</h2>
                           </div>
                           <div class="modal-body">
                              <div class="section text-center" id="test">
                                 <form name="chargeCone" id="chargeCone">
                                    결제수단 <input type="radio" name="payment" value="mobile">
                                    휴대폰 <input type="radio" name="payment" value="transfer">
                                    계좌이체 <input type="radio" name="payment" value="credit">
                                    신용카드 <input type="radio" name="payment" value="gibuticon">
                                    기부티콘
                                    <hr>
                                    <div id="charge1">
                                       충전단위 <select id="coneValSel">
                                          <option value="">-선택-</option>
                                          <option value="10">10cone</option>
                                          <option value="20">20cone</option>
                                          <option value="30">30cone</option>
                                          <option value="50">50cone</option>
                                          <option value="100">100cone</option>
                                          <option value="self">직접입력</option>
                                       </select> <span id="coneInput">직접입력 <input type=text
                                          id=selfConeVal>cone
                                       </span> <br> <br> 결제금액 <input type="text"
                                          disabled="disabled" name="coneVal" id="coneVal" value="0">
                                       X100원=<input type="text" disabled="disabled" name="payVal">원
                                    </div>
                                    <div id="charge2">
                                       <span>Pin NO <input size="5" type=text id=1stPin>-<input
                                          size="5" type=text id=2ndPin>-<input type=text
                                          size="5" id=3rdPin>
                                       </span>
                                    </div>
                                    <hr>
                                    <input class="btn btn-primary" type="button" value="충전"
                                       id="chargeButton"> <input class="btn btn-default"
                                       type="button" value="취소" data-dismiss="modal">
                                 </form>
                              </div>
                           </div>
                        </div>
                     </div>
                  </div></span>
									</a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">선물하기</span></a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">선물함 내역</span></a></li>
									<li><a href="#"> <span
											style="font-family: &amp; amp;">사용 내역</span></a></li>
									<!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
								</ul>
						        <img src="${initParam.root }img\g_favorite_3.jpg" width="150"> <br>
								
								<ul class="left01" font-family=" &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">
									<li><a href="${initParam.root }friend/memberlist.gibu">친구 찾기</a></li>
									<li><a href="${initParam.root }friend/friendlist.gibu?myId=${sessionScope.mvo.id}"> 친구 목록보기</a></li>
								</ul>
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
											href="javascript:getPost('${pb.startPageOfPageGroup-1}')">Prev</a>
										</li>
									</c:if>
									<li><c:forEach var="i" begin="${pb.startPageOfPageGroup}"
											end="${pb.endPageOfPageGroup}">
											<a href="javascript:getPost('${i}')">${i}</a>
										</c:forEach></li>
									<c:if test="${pb.nextPageGroup}">
										<li><a
											href="javascript:getPost('${pb.endPageOfPageGroup+1}')">Next</a>
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
