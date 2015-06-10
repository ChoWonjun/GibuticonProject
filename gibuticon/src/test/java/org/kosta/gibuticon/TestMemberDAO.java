package org.kosta.gibuticon;

import org.kosta.gibuticon.model.member.MemberDAO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMemberDAO {
	public static void main(String[] args) {
		ApplicationContext ctx = new ClassPathXmlApplicationContext("root-context.xml");
		MemberDAO dao = (MemberDAO) ctx.getBean("memberDao");
		System.out.println(dao.login(new MemberVO("chocamp","cho05703")));
		/*dao.registerMember(new MemberVO("hyun0979","12345","임수현","서울시 동작구 흑석동","010-9075-1234","1992-03-20","lassd@naver.com"));
		dao.updateMember(new MemberVO("amorce27","cho05703","조원준","경기도 성남시 분당구","010-9074-2928","1988-02-27","amorce27@naver.com"));
		System.out.println(dao.findMemberById("chocamp"));
		dao.deleteMemberById("hyun0979");
		dao.giveAdminRight("amorce27");
*/
	}
}
