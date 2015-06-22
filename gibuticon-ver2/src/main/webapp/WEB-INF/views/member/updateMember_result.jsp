<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="section text-left" id="registerResultForm">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<h2>
					<span style="font-family: &amp; amp;"> 회원정보 수정</span>
				</h2>
				<br>


				<p style="font-family: &amp; amp;">회원정보가 수정되었습니다.</p>
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-12"></div>
						</div>
					</div>
				</div>
				<form name="registerResultForm" style="font-family: &amp; amp;">
					<div class="form-group has-feedback" id="id">
						<label class="control-label" for="exampleInputEmail1">아이디</label>
						<input class="form-control" id="exampleInputEmail1"
							placeholder="ID" type="text" value="${requestScope.mvo.id }"
							readonly>
					</div>
					<div class="form-group" id="name">
						<label class="control-label">이름</label> <input
							class="form-control" type="text" placeholder="Name"
							value="${requestScope.mvo.name }" readonly>
					</div>
					<div class="form-group" id="address">
						<label class="control-label">주소</label> <input
							class="form-control" type="text" placeholder="Address"
							value="${requestScope.mvo.address }" readonly>
					</div>
					<div class="form-group" id="tel">
						<label class="control-label">전화번호</label> <input
							class="form-control" type="text" placeholder="Tel"
							value="${requestScope.mvo.tel }" readonly>
					</div>
					<div class="form-group" id="birth">
						<label class="control-label">생년월일</label> <input
							class="form-control" type="text" placeholder="Birth"
							value="${requestScope.mvo.birth }" readonly>
					</div>
					<div class="form-group" id="email">
						<label class="control-label">이메일</label> <input
							class="form-control" type="email" placeholder="E-mail"
							value="${requestScope.mvo.email }" readonly>
						<p class="help-block"></p>
					</div>
					<div class="row"></div>
					<div class="form-group">
						<label class="control-label">포인트</label> <input
							class="form-control" type="text" placeholder="Point"
							value="${requestScope.mvo.point }콘" readonly>
					</div>
				</form>
				<div class="section">
					<div class="container">
						<div class="row">
							<div class="col-md-12"></div>
						</div>
					</div>
				</div>
				<div class="col-md-12">
					<a class="btn btn-default" href="${initParam.root }home.gibu">홈으로</a>
				</div>
			</div>
		</div>
	</div>
</div>