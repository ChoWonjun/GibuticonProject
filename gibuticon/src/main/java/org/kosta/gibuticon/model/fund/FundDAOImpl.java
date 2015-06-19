package org.kosta.gibuticon.model.fund;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.fund.comment.CommentPageVO;
import org.kosta.gibuticon.model.fund.comment.FundCommentVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FundDAOImpl implements FundDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.fund.FundDAO#writeFund(org.kosta.gibuticon.
	 * model.fund.FundVO)
	 */
	@Override
	public void writeFund(FundVO fundVO) {
		sqlSessionTemplate.insert("fund.writeFund", fundVO);
	}

	// write 후 fund_no 를 가져와서 지금 작성한 펀드를 읽음

	/*
	 * insert into gibu_fund(fund_no,fund_name,proposal,
	 * homepage,goal_sum,due_date,content) values(gibu_fund_seq.nextval,
	 * '희망모금','불우이웃돕기','hyodols.info',1000,'2015-06-20','효섭이를 도와주세요');
	 */

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.kosta.gibuticon.model.fund.FundDAO#getFundByNo(java.lang.String)
	 */
	@Override
	public FundVO getFundByNo(String no) {
		return sqlSessionTemplate.selectOne("fund.getFundByNo", no);
	}

	// select * from gibu_fund where fund_no=1;

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.kosta.gibuticon.model.fund.FundDAO#getFundList()
	 */
	@Override
	public List<FundVO> getFundList(String pageNo) {
		return sqlSessionTemplate.selectList("fund.getFundList", pageNo);
	}

	// select * from gibu_fund

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.fund.FundDAO#updateFund(org.kosta.gibuticon
	 * .model.fund.FundVO)
	 */
	@Override
	public void updateFund(FundVO fundVO) {
		sqlSessionTemplate.update("fund.updateFund", fundVO);
	}

	// update 수정

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.fund.FundDAO#deleteFundByNo(java.lang.String)
	 */
	@Override
	public void deleteFundByNo(String no) {
		sqlSessionTemplate.delete("fund.deleteFundByNo", no);
	}

	// delete

	// updateHits
	// update board_inst set hits=hits+1 where no=?"
	// increase participant_count 참가자 수 증가 메서드
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.fund.FundDAO#increaseParticipant(java.lang.
	 * String)
	 */
	@Override
	public void increaseParticipant(String no) {
		System.out.println(no);
		sqlSessionTemplate.update("fund.increaseParticipant", no);
	}

	// increase cur_sum 현재까지 모금액 증가 메서드
	// fundVO 에서 curSum 에 기부할 액수를 저장
	// sql문에서 curSum 만큼 증가시켜 기부액 반영
	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.fund.FundDAO#gibuMoney(org.kosta.gibuticon.
	 * model.fund.FundVO)
	 */
	@Override
	public void gibuMoney(FundVO fundVO) {
		sqlSessionTemplate.update("fund.gibuMoney", fundVO);
	}

	@Override
	public String getPageNo(String no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("fund.getPageNo", no);
	}

	@Override
	public int getTotalPostingCount() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("fund.getTotalPostingCount");
	}

	@Override
	public void updateHit(String no) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("fund.updateHit", no);
	}

	@Override
	public void increaseCurSum(FundVO fundVO) {
		sqlSessionTemplate.update("fund.increaseCurSum", fundVO);
	}

	@Override
	public void writeComment(FundCommentVO fundCommentVO) {
		sqlSessionTemplate.insert("fund.writeComment", fundCommentVO);
	}

	@Override
	public List<FundCommentVO> getCommentList(CommentPageVO commentPageVO) {
		return sqlSessionTemplate.selectList("fund.getCommentList",
				commentPageVO);
	}

	@Override
	public int getTotalCommentCount(String fundNo) {
		return sqlSessionTemplate
				.selectOne("fund.getTotalCommentCount", fundNo);
	}

	@Override
	public void savePhoto(FundPhotoVO fpvo) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("fund.savePhoto", fpvo);
	}

	@Override
	public List<FundPhotoVO> getPhotoByNo(String no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("fund.getPhotoByNo", no);
	}
}
