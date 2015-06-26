<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<link href="${initParam.root}css/table.css" rel="stylesheet"
	type="text/css">
  <body data-spy="scroll">
  <div class="section">
      <div class="container">
        <div class="row"></div>
      </div>
    </div>
    <div class="section" align="center">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h1>
              <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;자유게시판</span>
            </h1>
          </div>
        </div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row"></div>
      </div>
    </div>
    <div class="section">
      <div class="container">
        <div class="row">
          <div class="col-md-3">
            <div class="navi_ca_is"></div>
          </div>
          <div class="col-md-8">
            <div class="section">
              <div class="container">
                <div class="row">
                  <div class="col-md-8">
                <table class="type09" style="font-family: &amp; quot;">
                  <thead>
                     <tr>
                        <th width="100">NO</th>
                        <th width="800">제목</th>
                        <th width="300">작성일</th>
                        <th width="300">작성자</th>
                        <th width="300">조회수</th>
                     </tr>
                  </thead>
                  <tbody>
                           <c:choose>
                  <c:when test="${sessionScope.mvo!=null}">
                     <c:forEach items="${requestScope.lvo.list}" var="board">
                        <tr><td>${board.boardNo}</td><td><a href="${initParam.root }freeBoard/showContent.gibu?no=${board.boardNo}&id=${sessionScope.mvo.id}">${board.title}</a></td><td>${board.writeDate}</td><td>${board.memberVO.name}</td><td>${board.hits}</td></tr>
                     </c:forEach>
                  </c:when>
                  <c:otherwise>
                     <c:forEach items="${requestScope.lvo.list}" var="board">
                        <tr><td>${board.boardNo}</td><td>${board.title}</td><td>${board.writeDate}</td><td>${board.memberVO.name}</td><td>${board.hits}</td></tr>
                     </c:forEach>
                  </c:otherwise>
               </c:choose>
                  </tbody>
               </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="section">
              <div class="container">
            </div>
             <div class="col-md-offset-6 col-md-6">
              <ul class="pagination">
              <c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
              <c:if test="${pb.previousPageGroup}">
	                <li>
	                  <a href="${initParam.root }freeBoard/getList.gibu?pageNo=${pb.startPageOfPageGroup-1}">Prev</a>
	                </li>
                </c:if>
                <li>
                 <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<a href="${initParam.root }freeBoard/getList.gibu?pageNo=${i }">${i }</a>
					</c:forEach>
                </li>
                <c:if test="${pb.nextPageGroup}">
	                <li>
	                  <a href="${initParam.root }freeBoard/getList.gibu?pageNo=${pb.endPageOfPageGroup+1}">Next</a>
	                </li>
                </c:if>
              </ul>
            </div>
            <div class="col-md-5 text-right">
              <div class="btn-group btn-group-sm">
               <a class="active btn btn-default dropdown-toggle" data-toggle="dropdown">검색 조건 <span class="fa fa-caret-down"></span></a>
            <ul class="dropdown-menu" role="menu">
                  <li>
                    <a href="#">제목+내용</a>
                  </li>
                  <li>
                    <a href="#">제목만</a>
                  </li>
                  <li>
                    <a href="#">내용만</a>
				  </li>
				  <li>
                    <a href="#">작성자</a>
                  </li>
                </ul>
              </div>
            </div>
           
            <div class="col-md-6 text-left">
              <form role="form">
                <div class="form-group">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="검색어입력">
                    <span class="input-group-btn">
                      <a class="btn btn-primary" type="submit">검색</a>
                    </span>
                    <span class="input-group-btn">
                      <a href="write.gibu" class="btn btn-primary" type="submit">글쓰기</a>
                    </span>
                  </div>
                </div>
              </form>
            </div>
          </div>
        </div>
      </div>
      </div>
      </body>




