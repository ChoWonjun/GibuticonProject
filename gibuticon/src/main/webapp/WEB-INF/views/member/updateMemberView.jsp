<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="section text-left" id="registerMemberForm">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="panel panel-success">
					<div class="panel-heading">
						<h5 class="panel-title" contenteditable="true">회원정보 수정</h5>
					</div>
					<div class="panel-body">
						<p>회원정보를 수정하시고 반드시 페이지 하단의 수정 버튼을 눌러주세요.</p>
					</div>
				</div>
				<form:form name="registerForm" action="updateMember.gibu"
					commandName="memberVO" method="post">
					<div class="form-group has-feedback" id="id">
						<label class="control-label" for="exampleInputEmail1">아이디</label>
						<input class="form-control" placeholder="ID"
							type="text" value="${sessionScope.mvo.id }" id="id" name="id" readonly />
					</div>
					<div class="form-group" id="password">
						<label class="control-label" for="exampleInputPassword1">비밀번호</label>
						<form:input class="form-control" id="password"
							placeholder="Password" type="text" name="password"
							path="password" value="${sessionScope.mvo.password }" />
						<p class="help-block">
							<form:errors path="password" />
						</p>
					</div>
					<div class="form-group" id="name">
						<label class="control-label">이름</label> <input
							class="form-control" type="text" placeholder="Name" name="name"
							value="${sessionScope.mvo.name }" readonly />
						<p class="help-block">
							<form:errors path="name" />
						</p>
					</div>
					<div class="form-group" id="address">
						<label class="control-label">주소</label>
						<form:input class="form-control" type="text" placeholder="Address"
							name="address" id="address" path="address"
							value="${sessionScope.mvo.address }" />
						<p class="help-block">
							<form:errors path="address" />
						</p>
					</div>
					<div class="form-group" id="tel">
						<label class="control-label">전화번호</label>
						<form:input class="form-control" type="text" placeholder="Tel"
							name="tel" id="tel" path="tel" value="${sessionScope.mvo.tel }" />
						<p class="help-block">
							<form:errors path="tel" />
						</p>
					</div>
					<div class="form-group" id="birth">
						<label class="control-label">생년월일</label>
						<form:input class="form-control" type="date" placeholder="Birth"
							name="birth" id="birth" path="birth" value="${sessionScope.mvo.birth }" />
						<p class="help-block">
							<form:errors path="birth" />
						</p>
					</div>
					<div class="form-group" id="email">
						<label class="control-label">이메일</label>
						<form:input class="form-control" type="email" placeholder="E-mail"
							name="email" id="email" path="email"
							value="${sessionScope.mvo.email }" />
						<p class="help-block">
							<form:errors path="email" />
						</p>
					</div>
					<div class="row"></div>
					<div class="form-group">
						<label class="control-label">포인트</label> <input
							class="form-control" type="text" placeholder="Point"
							value="${sessionScope.mvo.point }콘" readonly>
					</div>
					<div class="row">
						<div class="col-md-12">
							<input type="submit" class="btn btn-success" value="회원정보 수정">
						</div>
					</div>
				</form:form>
			</div>
		</div>
	</div>
</div>