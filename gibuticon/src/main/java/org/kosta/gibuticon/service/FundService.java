package org.kosta.gibuticon.service;

import java.util.List;

import org.kosta.gibuticon.model.fund.FundVO;

public interface FundService {
	public List<FundVO> getFundList(String pageNo);
	public abstract FundVO getFundByNo(String no);
	public void writeFund(FundVO fundVO);
	public void deleteFundByNo(String no);
	public void updateFund(FundVO fundVO);
	public String getPageNo(String no);
	public int getTotalPostingCount();
	public FundVO getFundByNoNotHit(String no);
}
