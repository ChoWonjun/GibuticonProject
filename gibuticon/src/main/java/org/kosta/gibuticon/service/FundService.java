package org.kosta.gibuticon.service;

import java.util.List;

import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.fund.comment.CommentPageVO;
import org.kosta.gibuticon.model.fund.comment.FundCommentVO;
import org.kosta.gibuticon.model.history.ChargeHistoryVO;
import org.kosta.gibuticon.model.history.GibuHistoryVO;

public interface FundService {
	public List<FundVO> getFundList(String pageNo);
	public abstract FundVO getFundByNo(String no);
	public void writeFund(FundVO fundVO);
	public void deleteFundByNo(String no);
	public void updateFund(FundVO fundVO);
	public String getPageNo(String no);
	public int getTotalPostingCount();
	public FundVO getFundByNoNotHit(String no);
	public void writeComment(FundCommentVO fundCommentVO);
	public List<FundCommentVO> getCommentList(CommentPageVO commentPageVO);
	public int getTotalCommentCount(String fundNo);
	public List<ChargeHistoryVO> getChargeHistory(String memberId);
	public List<GibuHistoryVO> getGibuHistory(String memberId);

	
	public int getTotalGibuParticipants(String year);
	public int getTotalGibuAmount(String year);
	public int getTotalGibuParticipants();
	public int getTotalGibuAmount();

	public void uploadPhoto(FundVO vo);

}
