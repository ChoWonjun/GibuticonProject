package org.kosta.gibuticon.model.fund;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public class FundDAOImpl {
	private SqlSessionTemplate sqlSessionTemplate;

	public void writeFund(FundVO fundVO) {
		sqlSessionTemplate.insert("fund.registerFund", fundVO);
	}

	public FundVO getFundByNo(String no) {
		return sqlSessionTemplate.selectOne("fund.getFundByNo", no);
	}

	public List<FundVO> getFundList() {
		return sqlSessionTemplate.selectList("fund.getFundList");
	}

	public void updateFund(FundVO fundVO) {
		sqlSessionTemplate.update("fund.updateFund", fundVO);
	}

	public void deleteFundByNo(String no) {
		sqlSessionTemplate.delete("fund.deleteFundById", no);
	}

}
