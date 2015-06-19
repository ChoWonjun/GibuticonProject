<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/jquery-migrate-1.1.0.js"></script>
<script type="text/javascript">
	function getYearInfo(year) {
	    // 클릭한 라디오 버튼이 무엇인지 확인하고, 그에 따라
	    // 알맞은 입력 요소를 사용 가능/불가능으로 전환!
		$.ajax({
			type:"post",
			url:"${initParam.root}fund/currentStateYear.gibu",
			data:"year="+year,
			success:function(data){	
				var result=year+"년 기부자수 : "+data.totalParticipants+"명, 기부콘수 : "+ data.totalAmount+"개";
				$("#resultView").html(result);
			}//success
		});//ajax
	}
</script>    
    
<h3>모금현황을 보여쥴거에엿</h3>

현재까지 ${requestScope.totalParticipants }명의 코너들이 ${requestScope.totalAmount }개의 콘을 기부하셨습니다.<br>
<br>
연도별 현황조회 : <a href="javascript:getYearInfo('2015')">2015년</a><br>
<div id="resultView"></div>