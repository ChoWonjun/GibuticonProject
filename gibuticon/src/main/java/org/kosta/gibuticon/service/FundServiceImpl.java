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
		return fundDAO.getFundByNo(no);
	}

	public List<FundVO> getFundList() {
		return fundDAO.getFundList();
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
}
