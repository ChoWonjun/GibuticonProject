<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

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
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 공지사항</span>
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
          <div class="col-md-4">
            <div class="navi_ca_is"></div>
            <div id="container">
              <div class="snb_v1">
                <dl class="menu">
                  <dt class="s_intro">
                    <br>
                    <br>
                    <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">서비스 소개</span>
                    <br>
                    <hr>
                  </dt>
                  <dd>
                    <ul>
                      <li>
                        <a href="#" class="u_txt1">  <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">기부티콘이란</span></a>
                      </li>
                    </ul>
                  </dd>
                  <dt class="s_srch">
                    <br>
                    <br>
                    <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">이용안내</span>
                    <br>
                    <hr>
                  </dt>
                  <dd>
                    <ul>
                      <li>
                        <a href="#" class="sr_txt5"> <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">콘 안내</span></a>
                      </li>
                      <li>
                        <a href="${initParam.root}getFreeBoardList.gibu">자유게시판</a> <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">콘받기 안내</span></a>
                      </li>
                      <li>
                        <a href="#" class="sr_txt5"> <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">기부방법 안내</span></a>
                      </li>
                      <!--윗부분에 받은선물 내역 아랫부분에 보낸선물 내역-->
                    </ul>
                  </dd>
                  <dd></dd>
                  <dt class="s_srch">
                    <br>
                    <br>
                    <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">친구 안내</span>
                    <br>
                    <hr>
                  </dt>
                  <dd>
                    <ul>
                      <li>
                        <a href="#" class="sr_txt5"> <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">콘 친구란?</span></a>
                      </li>
                      <li>
                        <a href="#" class="sr_txt5"> <span style="font-family: &quot;나눔바른고딕&quot;,NanumGothic,Sans-serif;">친구 등록</span></a>
                      </li>
                    </ul>
                  </dd>
                </dl>
                <ul class="snb_btn"></ul>
              </div>
            </div>
          </div>
          <div class="col-md-8">
            <div class="section">
              <div class="container">
                <div class="row">
                  <div class="col-md-7">
                              <table class="table" style="font-family: &amp; quot;">
                  <thead>
                     <tr>
                        <th width="100">NO</th>
                        <th width="800">제목</th>
                        <th width="300">작성일</th>
                        <th width="100">조회수</th>
                     </tr>
                  </thead>
                  <tbody>
                     <c:forEach items="${requestScope.lvo.list}" var="noticeboard">
                        <tr>
                           <td>${noticeboard.noticeNo }</td>
                           <td><a
                              href="${initParam.root}showNoticeContent.gibu?noticeNo=${noticeboard.noticeNo }">
                                 ${noticeboard.title }</a></td>
                           <td>${noticeboard.writeDate }</td>
                           <td>${noticeboard.hits }</td>
                        </tr>
<%--                         <tr>
            <td colspan=5 align="center">
               <c:set var="pb" value="${requestScope.lvo.pagingBean}"></c:set>
               <c:if test="${pb.previousPageGroup}">
                  <a href="${initParam.root }getNoticeList.gibu?pageNo=${pb.startPageOfPageGroup-1}">◀</a> 
               </c:if>
               <c:forEach var="i" begin="${pb.startPageOfPageGroup}" end="${pb.endPageOfPageGroup}">
                  <a href="${initParam.root }getNoticeList.gibu?pageNo=${i }">${i }</a>
               </c:forEach>
               <c:if test="${pb.nextPageGroup}">
                  <a href="${initParam.root }getNoticeList.gibu?pageNo=${pb.endPageOfPageGroup+1}">▶</a>
               </c:if>
            </td>
         </tr> --%>
                     </c:forEach>
                  </tbody>
               </table>
                  </div>
                </div>
              </div>
            </div>
            <div class="section">
              <div class="container">
                <div class="col-md-7"></div>
              </div>
            </div>
            <div class="col-md-5 text-center">
              <div class="btn-group btn-group-sm">
                <br>
                <a class="active btn btn-default dropdown-toggle" data-toggle="dropdown"> Dropdown <span class="fa fa-caret-down"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li>
                    <a href="#">Action</a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="col-md-6">
              <ul class="pagination">
                <li>
                  <a href="#">Prev</a>
                </li>
                <li>
                  <a href="#">1</a>
                </li>
                <li>
                  <a href="#">2</a>
                </li>
                <li>
                  <a href="#">3</a>
                </li>
                <li>
                  <a href="#">4</a>
                </li>
                <li>
                  <a href="#">5</a>
                </li>
                <li>
                  <a href="#">Next</a>
                </li>
              </ul>
            </div>
            <div class="col-md-offset-3 col-md-6">
              <form role="form">
                <div class="form-group">
                  <div class="input-group">
                    <input type="text" class="form-control" placeholder="검색어입력">
                    <span class="input-group-btn">
                      <a class="btn btn-primary" type="submit">검색</a>
                    </span>
                  </div>
                </div>
              </form>
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
          <div class="row"></div>
        </div>
      </div>
      </div>
      </body>
