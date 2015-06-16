package org.kosta.gibuticon;

import org.kosta.gibuticon.model.fund.FundDAOImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestFundDAO {
	public static void main(String[] args) {
	    ApplicationContext ctx = new ClassPathXmlApplicationContext("root-context.xml");
		FundDAOImpl dao = (FundDAOImpl) ctx.getBean("fundDao");
		//System.out.println(dao.getFundList());
	}
}
