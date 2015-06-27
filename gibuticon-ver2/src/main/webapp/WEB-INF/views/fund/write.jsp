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
										fOnBeforeUnload : function() {
											//alert("완료!");
										}
									}
								});
						$("#writeImg").click(
								function() {
									//id가 smarteditor인 textarea에 에디터에서 대입
									obj.getById["content"].exec(
											"UPDATE_CONTENTS_FIELD", []);
									//폼 submit
									/* $("#multiform").submit(); */
									return true;
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
									action="${initParam.root }fund/write.gibu">
									<fieldset style="font-family: &amp; amp;">
										<legend>모금 사연 등록</legend>
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
													<th class="writer"><br> <label for="formSum">작성자</label></th>
													<td colspan="2" class="writer"><br> <input
														class="shot" type="text" name="writer" id="writer"
														style="text-align: left" maxlength="12" readonly
														value="${sessionScope.mvo.id }"></td>
												</tr>
												<tr>
													<th class="title"><label for="formTitle">모금명</label></th>
													<td colspan="2" class="title"><br> <input
														required="required" type="text" name="fundName"
														id="fundName"> <select name="category"
														id="category" size="1">
															<option value="">카테고리</option>
															<option value="어린이">어린이</option>
															<option value="어르신">어르신</option>
															<option value="장애인">장애인</option>
															<option value="캠페인">캠페인</option>
													</select> <br> <br class="cl_b"></td>
												</tr>
												<!-- <tr>
													<th class="link"><br> <label for="url1">관련
															링크</label></th>
													<td colspan="2" class="link"><br> <input
														required="required" class="shot" type="text" id="homepage"
														name="homepage"> <select name="source"
														id="source" size="1">
															<option value="">모금출처</option>
															<option value="해피빈">해피빈</option>
															<option value="희망해">희망해</option>
															<option value="드림풀">드림풀</option>
															<option value="아름다운">아름다운</option>
													</select> <br> <br class="cl_b"></td>
												</tr> -->
												<tr>
													<th class="organ"><br> <label for="formOrgan">주관
															기관</label></th>
													<td colspan="2" class="organ"><br> <input
														required="required" class="shot" type="text"
														name="proposal" id="proposal"></td>
												</tr>
												<tr>
													<th class="hope_sum"><br> <label for="formSum">목표액</label></th>
													<td colspan="2" class="hope_sum"><br> <input
														required="required" class="shot" type="number"
														name="goalSum" id="goalSum" style="text-align: right"
														maxlength="12"></td>
												</tr>
												<tr>
													<th class="execution_time"><br> <label
														for="formExecutionTime">집행시기</label></th>
													<td colspan="2" class="execution_time"><br> <input
														required="required" class="inp_cal" type="date"
														name="startDate" id="startDate"> <span
														class="hyphen">-</span> <input required="required"
														type="date" class="inp_cal" id="dueDate" name="dueDate">
														6개월 안에 시작해야 하며, 최대 1년안에 사용을 완료하셔야 합니다.</td>
												</tr>
												<tr>
													<th class="cont"><label for="formCont">본문</label></th>
													<td colspan="2" class="cont"><br> <textarea
															rows="10" cols="200" name="content" id="content"
															style="width: 766px; height: 300px; display: none;"></textarea></td>
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
										<br> <br> <br> <input class="btn btn-default"
											style="font-family: &amp; amp;" type="submit" value="글쓰기"
											onclick="return checkContent()" id="writeImg"> <input
											class="btn btn-default" style="font-family: &amp; amp;"
											type="button" value="취소" onclick="cancel()">
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
