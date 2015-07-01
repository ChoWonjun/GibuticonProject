<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!-- bootstrap -->
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<!-- smart editor -->
<script type="text/javascript"
	src="${initParam.root }resource/editor/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<!-- jQuery import -->
<script src="${initParam.root }js/jquery-1.11.3.min.js"></script>
<!-- jQuery Form Plugin import -->
<script src="${initParam.root }js/jquery.form.js"></script>
<!-- jQuery MultiFile Plugin import -->
<script src="${initParam.root }js/jQuery.MultiFile.min.js"></script>
<script type="text/javascript">
	function cancel() {
		history.back(-1);
	}

	$(document)
			.ready(
					function() {

						//Naver Smart Editor
						var obj = []; //전역변수
						nhn.husky.EZCreator
								.createInIFrame({ //스마트에디터 프레임생성
									oAppRef : obj,
									elPlaceHolder : "content",
									sSkinURI : "${initParam.root }resource/editor/SmartEditor2Skin.html",
									htParams : {
										// 툴바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseToolbar : true,
										// 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
										bUseVerticalResizer : true,
										// 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
										bUseModeChanger : false,
									}
								});
						$("#writeImg").click(
								function() {
									//id가 smarteditor인 textarea에 에디터에서 대입
									obj.getById["content"].exec(
											"UPDATE_CONTENTS_FIELD", []);
									//폼 submit
									$("#multiform").submit();
								});

						//MultiFile Plugin 
						$('#multiform input[name=file]').MultiFile({
							max : 3, //업로드 최대 파일 갯수 (지정하지 않으면 무한대)
							accept : 'jpeg|jpg|gif|png|', //허용할 확장자(지정하지 않으면 모든 확장자 허용)
							/* maxfile : 1024 * 1024 * 1024, //각 파일 최대 업로드 크기
							maxsize : 1024 * 1024 * 1024 * 10, //전체 파일 최대 업로드 크기 */
							STRING : { //Multi-lingual support : 메시지 수정 가능
								remove : "(delete)", //추가한 파일 제거 문구, 이미태그를 사용하면 이미지사용가능
								duplicate : "$file 은 이미 선택된 파일입니다.",
								denied : "JPEG,JPG,GIF,PNG 확장자만을 지원합니다.",
								selected : '$file 을 선택했습니다.',
								toomuch : "업로드할 수 있는 최대크기를 초과하였습니다.($size)",
								toomany : "업로드할 수 있는 최대 갯수는 $max개 입니다.",
								toobig : "$file 은 크기가 매우 큽니다. (max $size)"
							},
							list : "#afile3-list" //파일목록을 출력할 요소 지정가능
						});
						
							$("#answerImg").click(function() {
								if ($("#title").val() == "") {
									alert("제목을 입력하세요!");
									return;
								} else if ($("#writer").val() == "") {
									alert("작성자 이름을 입력하세요!");
									return;
								} else if ($("#password").val() == "") {
									alert("패스워드를 입력하세요!");
									return;
								} else if ($("#content").val() == "") {
									alert("본문 내용을 입력하세요!");
									return;
								}
								$("#writeForm").submit();
							});
					});// document ready
</script>
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-15">
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-11">
								<!-- form 시작 -->
								<form name="multiform" id="multiform"
									enctype="multipart/form-data" method="post"
									action="${initParam.root}freeBoard/reply.gibu">
									<input type="hidden" name="ref" value="${requestScope.fvo.ref}">
									<input type="hidden" name="restep" value="${requestScope.fvo.restep}">
									<input type="hidden" name="relevel" value="${requestScope.fvo.relevel}">
									<input type="hidden" name="boardNo" value="${ requestScope.fvo.boardNo}">
									<fieldset style="font-family: &amp; amp;">
										<legend>자유게시판 등록</legend>
										<table class="col-md-12">
											<colgroup>
												<col style="width: 10%;"></col>
												<col style="width: 45%;"></col>
												<col style="width: 45%;"></col>
											</colgroup>
											<thead>
												<tr>
													<th scope="col"></th>
													<th scope="col"></th>
													<th scope="col"></th>
												</tr>
											</thead>
											<tbody>
												<tr>
													<th class="title"><label for="formTitle">제목</label></th>
													<td colspan="2" class="title"><br> 
													<input type="text" name="title" id="title" maxlength="25" value="RE:${requestScope.fvo.title}">
														<br> <br class="cl_b"></td>
												</tr>
												<tr>
													<th class="cont"><label for="formCont">본문</label></th>
													<td colspan="2" class="cont"><br> <textarea
															rows="10" cols="200" name="content" id="content"
															style="width: 766px; height: 300px; display: none;"></textarea></td>
												</tr>
												<tr>
													<th class="title"><label for="formTitle">아이디</label></th>
													<td colspan="2" class="title"><br> <input
														type="text" name="id" id="id" maxlength="25" value="${sessionScope.mvo.id}">
														<br> <br class="cl_b"></td>
												</tr>
												<!-- 사진업로드 -->
												<tr>
													<th class="img"><label for="formImg">관련 이미지</label></th>
													<td colspan="2"><input type="file" class="afile3"
														name="file" /></td>
												</tr>
												<tr>
													<th></th>
													<td colspan="2" id="afile3-list"
														style="border: 2px solid #c9c9c9; height: 20px"></td>
												</tr>
											</tbody>
										</table>
										<br> <input class="btn btn-default" id="writeImg"
											value="답글달기" type="button" onclick="content_submit()">
										<input class="btn btn-default" value="취소" type="button"
											onclick="cancel()">
									</fieldset>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<%-- <form action="${initParam.root}freeBoard/reply.gibu" method="post" id="writeForm">
	<input type="hidden" name="ref" value="${requestScope.fvo.ref}">
	<input type="hidden" name="restep" value="${requestScope.fvo.restep}">
	<input type="hidden" name="relevel" value="${requestScope.fvo.relevel}">
	<input type="hidden" name="boardNo"
		value="${ requestScope.fvo.boardNo}">
	<table class="inputForm">
		<caption>답변글쓰기</caption>
		<tbody>
			<tr>
				<td>제목</td>
				<td><input type="text" name="title" id="title"
					value="RE:${requestScope.fvo.title}"></td>
			</tr>
			<tr>
				<td>아이디</td>
				<td><input readonly type="text" name="id" id="writer"
					value="${sessionScope.mvo.id}"></td>
			</tr>
			<tr>
				<td colspan=2><textarea cols="32" rows="10" name="content"
						id="content"></textarea></td>
			</tr>
			<tr>
				<td colspan=2><img id="answerImg"
					src="${initParam.root}/img/answer_btn.jpg" /></td>
			</tr>
		</tbody>
	</table>
</form>
</body>
</html> --%>