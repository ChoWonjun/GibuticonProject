<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
  
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery/2.0.3/jquery.min.js"></script>
    <script type="text/javascript" src="http://netdna.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
    <link href="http://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css"
    rel="stylesheet" type="text/css">
    <link href="http://pingendo.github.io/pingendo-bootstrap/themes/default/bootstrap.css"
    rel="stylesheet" type="text/css">
  </head>
  
  <body>
    <div class="navbar navbar-default navbar-static-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#navbar-ex-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">Gibuticon</a>
        </div>
        <div class="collapse navbar-collapse" id="navbar-ex-collapse">
          <ul class="nav navbar-nav navbar-right">
            <li class="active">
              <a href="#">Home</a>
            </li>
            <li>
              <a href="#">Contacts</a>
            </li>
          </ul>
        </div>
      </div>
    </div>
    <div class="section text-left" id="registerResultForm">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <div class="panel panel-success">
              <div class="panel-heading">
                <h5 class="panel-title">회원정보</h5>
              </div>
              <div class="panel-body">
                <p>기부티콘 회원 가입을 환영합니다.&nbsp;</p>
              </div>
            </div>
            <form name="registerResultForm">
              <div class="form-group has-feedback" id="id">
                <label class="control-label" for="exampleInputEmail1">아이디</label>
                <input class="form-control" id="exampleInputEmail1" placeholder="ID"
                type="text" value="${requestScope.mvo.id }" readonly>
              </div>
              <div class="form-group" id="name">
                <label class="control-label">이름</label>
                <input class="form-control" type="text" placeholder="Name" value="${requestScope.mvo.name }" readonly>
              </div>
              <div class="form-group" id="address">
                <label class="control-label">주소</label>
                <input class="form-control" type="text" placeholder="Address" value="${requestScope.mvo.address }" readonly>
              </div>
              <div class="form-group" id="tel">
                <label class="control-label">전화번호</label>
                <input class="form-control" type="text" placeholder="Tel" value="${requestScope.mvo.tel }" readonly>
              </div>
              <div class="form-group" id="birth">
                <label class="control-label">생년월일</label>
                <input class="form-control" type="text" placeholder="Birth" value="${requestScope.mvo.birth }" readonly>
              </div>
              <div class="form-group" id="email">
                <label class="control-label">이메일</label>
                <input class="form-control" type="email" placeholder="E-mail" value="${requestScope.mvo.email }" readonly>
                <p class="help-block"></p>
              </div>
              <div class="row"></div>
              <div class="form-group">
                <label class="control-label">포인트</label>
                <input class="form-control" type="text" placeholder="Point" value="${requestScope.mvo.point }콘" readonly>
              </div>
            </form>
            <div class="col-md-12">
              <a class="btn btn-success" href="loginView.gibu">로그인</a>
            </div>
          </div>
        </div>
      </div>
    </div>
    <footer class="section section-success">
      <div class="container">
        <div class="row">
          <div class="col-sm-6">
            <h1>Gibuticon</h1>
            <p>Kosta 94기 끝까지가조 final project</p>
          </div>
          <div class="col-sm-6">
            <p class="text-info text-right">
              <br>
              <br>
            </p>
            <div class="row">
              <div class="col-md-12 hidden-lg hidden-md hidden-sm text-left">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12 hidden-xs text-right">
                <a href="#"><i class="fa fa-3x fa-fw fa-instagram text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-twitter text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-facebook text-inverse"></i></a>
                <a href="#"><i class="fa fa-3x fa-fw fa-github text-inverse"></i></a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </footer>
  </body>

</html>