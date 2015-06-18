package org.kosta.gibuticon.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.fund.FundDAO;
import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.fund.comment.CommentPageVO;
import org.kosta.gibuticon.model.fund.comment.FundCommentVO;
import org.kosta.gibuticon.model.history.ChargeHistoryVO;
import org.kosta.gibuticon.model.history.HistoryDAO;
import org.springframework.stereotype.Service;

@Service
public class FundServiceImpl implements FundService {
	@Resource(name="fundDAOImpl")
	FundDAO fundDAO;
	@Resource(name="historyDAOImpl")
	HistoryDAO historyDAO;
	
	public void writeFund(FundVO fundVO) {
		fundDAO.writeFund(fundVO);
	}

	public FundVO getFundByNo(String no) {
		//조회수 증가
		fundDAO.updateHit(no);
		return fundDAO.getFundByNo(no);
	}
	
	@Override
	public FundVO getFundByNoNotHit(String no) {
		// TODO Auto-generated method stub
		return fundDAO.getFundByNo(no);
	}

	public List<FundVO> getFundList(String pageNo) {
		return fundDAO.getFundList(pageNo);
	}
	
	public void updateFund(FundVO fundVO) {
		fundDAO.updateFund(fundVO);
	}
	
	public void deleteFundByNo(String no) {
		fundDAO.deleteFundByNo(no);
	}

	public void increaseParticipant(String no){
		fundDAO.increaseParticipant(no);
	}

	public void gibuMoney(FundVO fundVO) {
		fundDAO.gibuMoney(fundVO);
	}

	@Override
	public String getPageNo(String no) {
		return fundDAO.getPageNo(no);
	}

	@Override
	public int getTotalPostingCount() {
		// TODO Auto-generated method stub
		return fundDAO.getTotalPostingCount();
	}

	@Override
	public void writeComment(FundCommentVO fundCommentVO) {
		fundDAO.writeComment(fundCommentVO);
	}

	@Override
	public List<FundCommentVO> getCommentList(CommentPageVO commentPageVO) {
		return fundDAO.getCommentList(commentPageVO);
	}

	@Override
	public int getTotalCommentCount(String fundNo) {
		return fundDAO.getTotalCommentCount(fundNo);
	}

	@Override
	public List<ChargeHistoryVO> getChargeHistory(String memberId) {
		return historyDAO.getChargeHistory(memberId);
	}
}
