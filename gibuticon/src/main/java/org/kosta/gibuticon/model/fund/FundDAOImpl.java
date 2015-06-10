package org.kosta.gibuticon.model.fund;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FundDAOImpl {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	public void writeFund(FundVO fundVO) {
		sqlSessionTemplate.insert("fund.writeFund", fundVO);
	}
	
	// write 후 fund_no 를 가져와서 지금 작성한 펀드를 읽음
	
/*	  insert into gibu_fund(fund_no,fund_name,proposal,
				homepage,goal_sum,due_date,content)
values(gibu_fund_seq.nextval,'희망모금','불우이웃돕기','hyodols.info',1000,'2015-06-20','효섭이를 도와주세요');*/

	public FundVO getFundByNo(String no) {
		return sqlSessionTemplate.selectOne("fund.getFundByNo", no);
	}
	
//	  select * from gibu_fund where fund_no=1;

	public List<FundVO> getFundList() {
		return sqlSessionTemplate.selectList("fund.getFundList");
	}
	
// select * from gibu_fund

	public void updateFund(FundVO fundVO) {
		sqlSessionTemplate.update("fund.updateFund", fundVO);
	}
	
// update 수정
	
	

	public void deleteFundByNo(String no) {
		sqlSessionTemplate.delete("fund.deleteFundById", no);
	}
	
// delete 

	// updateHits
	// update board_inst set hits=hits+1 where no=?"
	// increase participant_count 참가자 수 증가 메서드
	public void increaseParticipant(String no){
		System.out.println(no);
		sqlSessionTemplate.update("fund.increaseParticipant",no);
	}
	
	// increase cur_sum 현재까지 모금액 증가 메서드
	// fundVO 에서 curSum 에 기부할 액수를 저장
	// sql문에서 curSum 만큼 증가시켜 기부액 반영
	public void gibuMoney(FundVO fundVO) {
		sqlSessionTemplate.update("fund.gibuMoney", fundVO);
	}
}
