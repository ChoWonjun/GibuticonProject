package org.kosta.gibuticon.model.member;

import org.mybatis.spring.SqlSessionTemplate;

public class MemberDAOImpl {
	private SqlSessionTemplate sqlSessionTemplate;

	public void registerMember(MemberVO memberVO) {
		sqlSessionTemplate.insert("member.registerMember", memberVO);
	}

	public MemberVO findMemberById(String id) {
		MemberVO memberVO = sqlSessionTemplate.selectOne(
				"member.findMemberById", id);
		return memberVO;
	}

	public void updateMember(MemberVO memberVO) {
		sqlSessionTemplate.update("member.updateMember", memberVO);
	}

	public void deleteMemberById(String id) {
		sqlSessionTemplate.delete("member.deleteMemberById", id);
	}
}
