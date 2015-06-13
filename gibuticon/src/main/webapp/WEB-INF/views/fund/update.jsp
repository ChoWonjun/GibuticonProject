<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<link rel="stylesheet" href="${initParam.root }css/board.css" type="text/css">
<script type="text/javascript">
	function content_submit(){
		write_form.submit();
	}
	function cancel(){
		history.back(-1);
	}
</script>



 <br>
  <form action="${initParam.root }fund/update.gibu" method="post" name="write_form">  
  <input type="hidden" name="fundNo" value="${requestScope.posting.fundNo }">
   <table class="inputForm" >
    <caption>기부수정(${requestScope.posting.fundNo })</caption>
    <tbody>
    <tr>
     <td>제목</td>
     <td colspan="3">
     <input type="text" name="fundName" size="48" value="${requestScope.posting.fundName }">
     </td>
    </tr>
    <tr>
     <td>목적</td>
     <td><input type="text" name="proposal" size="20" value="${requestScope.posting.proposal }"></td>
     <td>홈페이지</td>
     <td >
     <input type="text" name="homepage"  size="5" value="${requestScope.posting.homepage }">
     </td>
    </tr>
    
    <tr>
     <td>목표액</td>
     <td><input type="text" name="goalSum" size="20" value="${requestScope.posting.goalSum }"></td>
     <td>기한</td>
     <td >
     <input type="text" name="dueDate"  size="5" value="${requestScope.posting.dueDate }">
     </td>
    </tr>
    
    <tr>
     <td colspan="4" align="left">
     &nbsp;&nbsp;
     <textarea cols="53" rows="5" name="content">${requestScope.posting.content }</textarea>
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