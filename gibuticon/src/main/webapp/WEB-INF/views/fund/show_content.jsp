<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<link rel="stylesheet" href="${initParam.root }css/board.css" type="text/css">
<script type="text/javascript">
	function sendList(){
		location.href="${initParam.root }fund/getList.gibu?no=${requestScope.posting.fundNo}";
	}
	function gibuPopup(){
		var url="${initParam.root }cone/gibuView.gibu?fundNo=${requestScope.posting.fundNo}";
		window.open(url,"gibuPopup",
	   				"width=520,height=280,teop=150,left=200");
	}
</script>
</head>
<body>


 <div class="section">
      <div class="container">
        <div class="row">
          <h3>
            <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">${requestScope.posting.fundName}</span>
            <div class="row">
              <br>
              <br>
              <div class="col-md-4">
                <div id="fullcarousel-example" data-interval="false" class="carousel slide"
                data-ride="carousel">
                  <div class="carousel-inner">
                    <div class="item">
                      <img src="https://ununsplash.imgix.net/photo-1413912623716-e6c688db0383?fm=jpg&amp;s=2777ec88322e8725978f0fa956735021">
                    </div>
                  </div>
                  <a class="left carousel-control" href="#fullcarousel-example" data-slide="prev"><i class="icon-prev fa fa-angle-left"></i></a>
                  <a class="right carousel-control" href="#fullcarousel-example" data-slide="next"><i class="icon-next fa fa-angle-right"></i></a>
                </div>
                <img src="${initParam.root}img\모금상세보기_경환1.jpg" class="img-responsive" width="400">
                <div class="row">
                  <br>
                </div>
                <div class="row">
                  <div class="col-md-4">
                    <img src="${initParam.root}img\모금상세보기_경환1.jpg" class="img-responsive">
                  </div>
                  <div class="col-md-4">
                    <img src="${initParam.root}img\모금상세보기_경환2.jpg" class="img-responsive">
                  </div>
                  <div class="col-md-4">
                    <img src="${initParam.root}img\모금상세보기_경환3.jpg" class="img-responsive">
                  </div>
                  <h4>
                    <span style="font-family: &quot;나눔고딕&quot;,NanumGothic,Sans-serif;">&nbsp;&nbsp;&nbsp;
                      <br>&nbsp;&nbsp;모금액 이렇게 사용됩니다.</span>
                  </h4>
                </div>
                <font size="2"></font>
                <font size="3"></font>
                <table style="font-family: &quot;나눔고딕&quot;,NanumGothic,Sans-serif;"
                class="table">
                  <tbody>
                    <tr>
                      <th>
                        <font size="3">목표액</font>
                      </th>
                      <td>
                        <font size="3">${requestScope.posting.curSum}</font>
                      </td>
                      <th>
                        <font size="3">현재 모금액</font>
                      </th>
                      <td>
                        <font size="3">#</font>
                      </td>
                    </tr>
                  </tbody>
                  <tbody>
                    <tr height="2">
                      <th colspan="2">
                        <font size="3">집행시기</font>
                      </th>
                      <td colspan="2">
                        <font size="3">2015.06.17~2015.07.17</font>
                      </td>
                    </tr>
                    <tr>
                      <th colspan="2">
                        <font size="3">주관 사이트</font>
                      </th>
                      <td colspan="2">
                        <font size="3">네이버</font>
                      </td>
                    </tr>
                    <tr>
                      <th colspan="2">
                        <font size="3">관련링크</font>
                      </th>
                      <td colspan="2">
                        <a href="#"><font size="3">클릭하면 이동합니다.</font></a>
                      </td>
                    </tr>
                  </tbody>
                </table>
                <font style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;"
                size="3">
                  <br>
                  <h2>
                    <font style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;"
                    size="5">기부금 사용계획</font>
                  </h2>
                  <br>1. 건강-치료 캠페인
                  <br>&nbsp;&nbsp;(치료비, 이식비등 평균 1,00만원×5명) | 5,000,000원
                  <br>2. 건강-치료 캠페인 (사회복지적치료비 200만원×10명)
                  <br>&nbsp;&nbsp;&nbsp;| 20,000,000원
                  <br>
                  <br>*기부티콘은 신뢰성 있고 투명한 온라인 모금이 되고자 구체적인 모금 사용 계획과 수정사항을 네티즌에게 공개합니다.</font>
              </div>
              <div class="col-md-1"></div>
              <div class="col-md-7">
               
                <font style="font-family: &quot;나눔고딕&quot;,NanumGothic,Sans-serif;" size="3">

                 <!--content-->

		</font>
              </div>
            </div>
            <br>
            <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <a
            class="btn btn-default">기부하기</a>&nbsp;&nbsp;
              <a class="btn btn-default">즐겨찾기</a>
          </h3>
          <div class="thumb_link">
            <div class="thumb_select"></div>
          </div>
        </div>
      </div>
    </div>
    <div class="col-md-12">
      <div class="section">
        <div class="container">
          <div class="row">
            <div class="col-md-12">
              <font style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;"
              size="3">네티즌 의견</font>
            </div>
          </div>
          <div class="row">
            <div class="col-md-12">
              <form role="form">
                <div class="form-group">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="응원댓글을 적어주세요">
                    <span class="input-group-btn">
                      <a class="btn btn-info" type="submit">댓글등록</a>
                    </span>
                  </div>
                </div>
              </form>
            </div>
          </div>
          <div class="row">
            <div class="col-md-offset-3 col-md-9"></div>
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



	<%-- <table class="content">
		<tr>
			<td>NO : ${requestScope.posting.fundNo} </td>
			<td colspan="2">모금명 : ${requestScope.posting.fundName} </td>
		</tr>
		<tr>
			<td>모금액 :  ${requestScope.posting.curSum}</td>
			<td>기한 : ${requestScope.posting.dueDate}</td>
			<td>조회수 : ${requestScope.posting.hits}</td>
		</tr>
		<tr>
			<td colspan="3">
			<pre>${requestScope.posting.content}</pre>
			</td>
		</tr>
		
		<tr>
			<td valign="middle" align="center" colspan="3">
			 <input class="btn btn-default" style="font-family: &quot;나눔고딕&quot;,NanumGothic,Sans-serif;" type="submit" value="목록" onclick="sendList()" >
		     <a href="${initParam.root }fund/delete.gibu?no=${requestScope.posting.fundNo}"><input class="btn btn-default" style="font-family: &quot;나눔고딕&quot;,NanumGothic,Sans-serif;" type="submit" value="삭제"></a>
			 <a href="${initParam.root }fund/updateForm.gibu?no=${requestScope.posting.fundNo}"><input class="btn btn-default" style="font-family: &quot;나눔고딕&quot;,NanumGothic,Sans-serif;" type="submit" value="수정"> </a>
			 <input class="btn btn-default" style="font-family: &quot;나눔고딕&quot;,NanumGothic,Sans-serif;" type="submit" value="글쓰기"  onclick="gibuPopup()">
		</tr>
	</table> --%>
	
<%-- 		<table class="comment">
		<thead>
		<tr>
			<th class="no">NO</th>
			<th class="title">작성자</th>
			<th class="name">내용</th>
			<th class="date">작성시간</th>
			</tr>
		</thead>
		<tbody>			
	<c:forEach var="comment" items="${requestScope.comment.list}">	
			<tr>
			    <td>${comment.commentNo }</td>
			    <td>${comment.memberVO.id }</td>			
				<td>${comment.text }</td>
				<td>${comment.commentTime }</td>
			</tr>
	</c:forEach>
			<tr>
				<td colspan=5 align="center">
					<c:set var="pb" value="${requestScope.comment.pagingBean}"></c:set>
					<c:if test="${pb.previousPageGroup}">
						<a href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${pb.startPageOfPageGroup-1}">◀</a> 
					</c:if>
					<c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
						<a href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${i }">${i }</a>
					</c:forEach>
					<c:if test="${pb.nextPageGroup}">
						<a href="${initParam.root }fund/showContent.gibu?no=${requestScope.posting.fundNo }&commentPage=${pb.endPageOfPageGroup+1}">▶</a>
					</c:if>
				</td>
			</tr>					
		</tbody>					
	</table> --%>