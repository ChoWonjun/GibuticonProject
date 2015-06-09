package org.kosta.gibuticon.model.member;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAOImpl {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public void registerMember(MemberVO memberVO) {
		sqlSessionTemplate.insert("member.registerMember", memberVO);
	}

	public MemberVO findMemberById(String id) {
		MemberVO memberVO = sqlSessionTemplate.selectOne(
				"member.findMemberById", id);
		System.out.println(memberVO);
		return memberVO;
	}

	public void updateMember(MemberVO memberVO) {
		sqlSessionTemplate.update("member.updateMember", memberVO);
	}

	public void deleteMemberById(String id) {
		sqlSessionTemplate.delete("member.deleteMemberById", id);
	}
	
	public void giveAdminRight(String id){
		sqlSessionTemplate.update("member.updateAdminRight",id);
	}
	
	public MemberVO login(MemberVO memberVO){
		return sqlSessionTemplate.selectOne("member.login",memberVO);
	}
	
}
