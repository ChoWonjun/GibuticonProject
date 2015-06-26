<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<body>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<table class="content" width="1200" height="200"
						style="word-break: break-all; word-wrap: break-word">
						<tbody>
							<tr>
								<td>글번호 : ${requestScope.posting.noticeNo}</td>
								<td colspan="2">제목 : ${requestScope.posting.title}</td>
							</tr>
							<tr>
								<td>작성자 : 관리자</td>
								<td>작성일 : ${requestScope.posting.writeDate}</td>
								<td>조회수 : ${requestScope.posting.hits}</td>
							</tr>
							<tr>
								<td colspan="3"><pre>${requestScope.posting.content}</pre>
								</td>
							</tr>
							<tr>
								<td valign="middle" align="center" colspan="3 "><a
									href="${initParam.root}notice/getList.gibu"> <input
										class="btn btn-default" type="submit" value="목록 "></a> <c:if
										test="${sessionScope.mvo.admin=='yes'}">
										<a
											href="${initParam.root}notice/delete.gibu?noticeNo=${requestScope.posting.noticeNo}"><input
											class="btn btn-default " type="submit" value="삭제 "></a>
										<a
											href="${initParam.root}notice/updateForm.gibu?noticeNo=${requestScope.posting.noticeNo}">
											<input class="btn btn-default" type="submit" value="수정 ">
										</a>
									</c:if></td>
							</tr>
						</tbody>
					</table>
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
	<div class="section">
		<div class="container">
			<div class="row">
				<div class="col-md-12"></div>
			</div>
		</div>
	</div>
</body>
