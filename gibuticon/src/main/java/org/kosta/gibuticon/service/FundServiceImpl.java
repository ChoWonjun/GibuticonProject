package org.kosta.gibuticon.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.fund.FundDAO;
import org.kosta.gibuticon.model.fund.FundVO;
import org.springframework.stereotype.Service;

@Service
public class FundServiceImpl implements FundService {
	@Resource(name="fundDAOImpl")
	FundDAO fundDAO;
	
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


}
