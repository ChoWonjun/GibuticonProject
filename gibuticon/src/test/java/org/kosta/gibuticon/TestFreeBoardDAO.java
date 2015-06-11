package org.kosta.gibuticon;

import java.sql.Date;

import org.kosta.gibuticon.model.board.FreeBoardDAO;
import org.kosta.gibuticon.model.board.FreeBoardVO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestFreeBoardDAO {
	public static void main(String[] args) {
	    ApplicationContext ctx = new ClassPathXmlApplicationContext("root-context.xml");
		FreeBoardDAO dao = (FreeBoardDAO) ctx.getBean("freeBoardDao");
		System.out.println(dao.getFreeBoardList());
		System.out.println(dao.getFreeBoardByNo("2"));
//		dao.writeFreeBoard(new FreeBoardVO("hagisiro","sirosjro","chocamp"));
		dao.updateFreeBoard(new FreeBoardVO("2","hagisiro","siroaaasjro","chocamp"));
		
/*		private String freeBoardNo;
		private String title;
		private Date date;
		private String content;
		private int hits;
		private String writer;*/
	}
}
