package org.kosta.gibuticon.model.service;

import java.util.List;

import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.fund.SearchOptionVO;
import org.kosta.gibuticon.model.fund.comment.FundCommentVO;
import org.kosta.gibuticon.model.history.ChargeHistoryVO;
import org.kosta.gibuticon.model.history.GibuHistoryVO;

public interface FundService {
	public abstract List<FundVO> getFundList(SearchOptionVO svo);
	public abstract FundVO getFundByNo(String no);
	public void writeFund(FundVO fundVO);
	public void deleteFundByNo(String no);
	public void updateFund(FundVO fundVO);
	public String getPageNo(SearchOptionVO svo);
	public int getTotalPostingCount(SearchOptionVO svo);
	public FundVO getFundByNoNotHit(String no);
	public void writeComment(FundCommentVO fundCommentVO);
	public List<FundCommentVO> getCommentList(String fundNo, String commentPage);
	public int getTotalCommentCount(String fundNo);
	public List<ChargeHistoryVO> getChargeHistory(String memberId);
	public List<GibuHistoryVO> getGibuHistory(String memberId);
	public int getTotalGibuParticipants(String year);
	public int getTotalGibuAmount(String year);
	public int getTotalGibuParticipants();
	public int getTotalGibuAmount();
	public void uploadPhoto(FundVO vo);
	public abstract void deleteComment(String commentNo);
}
