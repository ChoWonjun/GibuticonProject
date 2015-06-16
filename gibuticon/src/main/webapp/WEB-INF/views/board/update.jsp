<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script type="text/javascript" src="${initParam.root}layoutit/src/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript">
	function content_submit(){
		write_form.submit();
	}
	function cancel(){
		history.back(-1);
	}
</script>
 <br>
  <form action="updateFreeBoard.gibu" method="post" name="write_form">  
  <input type="hidden" name="boardNo" value="${requestScope.fvo.boardNo}">
   <table class="inputForm" >
    <caption>자유게시판수정(${requestScope.fvo.boardNo })</caption>
    <tbody>
    <tr>
     <td>제목</td>
     <td colspan="3">
     <input type="text" name="title" size="48" value="${requestScope.fvo.title }">
     </td>
    </tr>
    <tr>
     <td colspan="4" align="left">
     &nbsp;&nbsp;
     <textarea cols="53" rows="5" name="content">${requestScope.fvo.content }</textarea>
     </td>
    </tr> 
    <tr>
     <td colspan="4" align="center" >
      <input type="submit" value="수정하기" class="action"></input>  
     </td>  
    </tr>
    </tbody>
   </table>
  </form>