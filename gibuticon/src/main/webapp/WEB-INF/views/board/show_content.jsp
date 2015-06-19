 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<script type="text/javascript" src="${initParam.root}js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
		$("#updateImg").click(function(){
				if(confirm("수정하시겠습니까?")){
					location.href="${initParam.root}updateFreeView.gibu?no=${requestScope.fvo.boardNo}";
				}else{
					return false;
				} 
			});
		$("#delImg").click(function(){
				if(confirm("삭제하시겠습니까?")){
							location.href="deleteFreeBoard.gibu?no=${requestScope.fvo.boardNo}";
				}else{
					return false;
				} 
			});
	});
</script>
<body>
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
   <table class="content" width="1200" height="200" style="word-break:break-all;word-wrap:break-word">
              <tbody>
                <tr>
                  <td>NO : ${requestScope.fvo.boardNo}</td>
                  <td colspan="2">title : ${requestScope.fvo.title}</td>
                </tr>
                <tr>
                  <td>작성자 : ${requestScope.fvo.memberVO.name}</td>
                  <td>${requestScope.fvo.writeDate}</td>
                  <td>조회수 :${requestScope.fvo.hits}</td>
                </tr>
                <tr>
                  <td colspan="3">
                    <pre >${requestScope.fvo.content} </pre>
                  </td>
                </tr>        
                <tr>
                  <td valign="middle" align="center" colspan="3 ">
                  <a href="${initParam.root}replyView.gibu?no=${requestScope.fvo.boardNo }">
                  <input class="btn btn-default" type="submit" value="답글"></a>
                    <a href="${initParam.root}getFreeBoardList.gibu?no=${requestScope.fvo.boardNo}"> 
                    <input class="btn btn-default" type="submit" value="목록"></a>
                   <input class="btn btn-default " type="submit" value="삭제" id="delImg">
                  <input class="btn btn-default" type="submit"value="수정" id="delImg">
                  </td>
                </tr>
                <c:if test="${sessionScope.mvo!=null }">
					<tr>
						<td><form action="writeFreeComment.gibu">
						댓글<input type="text" name="comment">
						작성자<input  readonly type="text" name="name" value="${sessionScope.mvo.name}">
						<input type="submit" value="댓글등록">
						<input type="hidden" name="id" value="${sessionScope.mvo.id}">
						<input type="hidden" name="boardNo" value="${requestScope.fvo.boardNo}">
						</form></td>
					</tr>
					</c:if>
              </tbody>
            </table>
            </div>
            </div>
            </div>
            </div>
            <br><br>
            <div class="section">
              <div class="container">
                <div class="row">
                  <div class="col-md-6" align="center">
               <table class="table" style="font-family: &amp; quot;">
                  <thead>
                     <tr>
                        <th width="100">NO</th>
                        <th width="800">comment</th>
                         <th width="300">작성일</th>
                        <th width="300">작성자</th>
                        <th width="300">조회수</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${requestScope.flist.list}" var="comment">
                        <tr><td>${comment.commentNo}</td><td>${comment.comment}</td><td>${comment.writeDate}</td><td>${comment.memberVO.name}</td><td>${comment.hits}</td></tr>
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
             <div class="col-md-6">
              <ul class="pagination">
              <c:set var="pb" value="${requestScope.flist.pagingBean}"></c:set>
              <c:if test="${pb.previousPageGroup}">
                   <li>
                     <a href="${initParam.root }getFreeBoardByNo.gibu?no=${requestScope.fvo.boardNo}&pageNo=${pb.startPageOfPageGroup-1}">Prev</a>
                   </li>
                </c:if>
                <li>
                 <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
                  <a href="${initParam.root }getFreeBoardByNo.gibu?no=${requestScope.fvo.boardNo}&pageNo=${i}">${i }</a>
               </c:forEach>
                </li>
                <c:if test="${pb.nextPageGroup}">
                   <li>
                     <a href="${initParam.root }getFreeBoardByNo.gibu?no=${requestScope.fvo.boardNo}&pageNo=${pb.endPageOfPageGroup+1}">Next</a>
                   </li>
                </c:if>
              </ul>
            </div>
            </div>
            </div>
            </div>
</body>
