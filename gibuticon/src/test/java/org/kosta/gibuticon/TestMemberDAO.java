package org.kosta.gibuticon;

import org.kosta.gibuticon.model.member.MemberDAOImpl;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class TestMemberDAO {
	public static void main(String[] args) {
		MemberDAOImpl dao = new MemberDAOImpl();
		System.out.println(dao.findMemberById("chocamp"));
		/*dao.registerMember(memberVO);
		dao.updateMember(memberVO);
		dao.giveAdminRight(id);
		dao.deleteMemberById(id);
*/
	}
}
