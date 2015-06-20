<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	function getYearInfo(year) {
		// 클릭한 라디오 버튼이 무엇인지 확인하고, 그에 따라
		// 알맞은 입력 요소를 사용 가능/불가능으로 전환!
		$.ajax({
			type : "post",
			url : "${initParam.root}fund/currentStateYear.gibu",
			data : "year=" + year,
			success : function(data) {
				var result = year + "년 기부자수 : " + data.totalParticipants
						+ "명, 기부콘수 : " + data.totalAmount + "개";
				$("#resultView").html(result);
			}//success
		});//ajax
	}
</script>
<div class="section">
	<div class="container">
		<div class="row"></div>
	</div>
</div>
<div class="section">
	<div class="container">
		<div class="col-sm-offset-1 col-sm-5 col-md-8">
			<img src="${initParam.root}img\기부현황안내.jpg" width="150">
		</div>
	</div>
</div>

		<div align="center">
		<br>
			<img
				src="${initParam.root }img/기부현황_이미지.jpg" >

		</div>
	

<br>
<br>
<br>

<br>
<div class="col-sm-offset-5 col-sm-5 col-md-8">
<hr>
	<strong><font size="3">현재까지 ${requestScope.totalParticipants }명의 코너들이
	${requestScope.totalAmount }개의 콘을 기부하셨습니다. </font></strong><br> <br> <br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 연도별 현황조회 <br>
	<br>
</div>
<div class="state_area">
		<center>
		<a href="#" class="btn btn-default" id="0000">전체</a>
		<!--[D] 해당 년도의 마지막에 대체텍스트를 넣어주세요 -->
		<span class="year"> 
		<a href="javascript:getYearInfo('2015')" id="2015" class="btn btn-default"> 2015년 </a> 
	
			<a href="#" id="2014" class="btn btn-default"> 2014년 </a> 
			<a href="#" id="2013" class="btn btn-default"> 2013년 </a> 
		
	</span>
</center>
</div>
<br>

<center>
<div id="resultView"></div>
</center>

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
<div class="section">
	<div class="container">
		<div class="row">
			<div class="col-md-12"></div>
		</div>
	</div>
</div>
