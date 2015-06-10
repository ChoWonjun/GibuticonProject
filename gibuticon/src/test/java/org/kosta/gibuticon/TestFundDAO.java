package org.kosta.gibuticon;

import org.kosta.gibuticon.model.fund.FundDAOImpl;

public class TestFundDAO {
	public static void main(String[] args) {
		FundDAOImpl dao=new FundDAOImpl();
		dao.increaseParticipant("1");
	}
}
