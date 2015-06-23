package org.kosta.gibuticon;

import org.kosta.gibuticon.model.notice.NoticeDAO;
import org.kosta.gibuticon.model.notice.NoticeVO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestNoticeDAO {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("root-context.xml");
		NoticeDAO ndao =  (NoticeDAO) ctx.getBean("noticeDao");
		ndao.write(new NoticeVO("네번째","조원준짱"));
		/*ndao.updateNotice(new NoticeVO(2,"두번째","두두두"));
		ndao.deleteNotice(3);
		ndao.updateCount(2);*/
	}
}
