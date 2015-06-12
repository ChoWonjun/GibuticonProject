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
  <form action="writeNotice.gibu" method="post" name="write_form">  
   <table class="inputForm" >
    <caption>기부등록</caption>
    <tbody>
    <tr>
     <td>제목</td>
     <td colspan="3">
     <input type="text" name="fundName" size="48">
     </td>
    </tr>
    
    <tr>
     <td colspan="4" align="left">
     &nbsp;&nbsp;
     <textarea cols="53" rows="5" name="content"></textarea>
     </td>
    </tr> 
    <tr>
     <td colspan="4" align="center" >
      <img class="action" src="${initParam.root }img/write_btn.jpg" alt="글입력"  onclick="content_submit()">
      <img class="action" src="${initParam.root }img/cancel.gif" onclick="cancel()">      
     </td>  
    </tr>
    </tbody>
   </table>
  </form>