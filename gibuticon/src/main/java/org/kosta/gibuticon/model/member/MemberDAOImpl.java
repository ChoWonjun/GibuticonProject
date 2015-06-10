package org.kosta.gibuticon.model.member;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;
@Repository
public class MemberDAOImpl implements MemberDAO {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#registerMember(org.kosta.gibuticon.model.member.MemberVO)
	 */
	@Override
	public void registerMember(MemberVO memberVO) {
		System.out.println("dao: "+memberVO);
		sqlSessionTemplate.insert("member.registerMember", memberVO);
	}

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#findMemberById(java.lang.String)
	 */
	@Override
	public MemberVO findMemberById(String id) {
		MemberVO memberVO = sqlSessionTemplate.selectOne(
				"member.findMemberById", id);
		return memberVO;
	}

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#updateMember(org.kosta.gibuticon.model.member.MemberVO)
	 */
	@Override
	public void updateMember(MemberVO memberVO) {
		sqlSessionTemplate.update("member.updateMember", memberVO);
	}

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#deleteMemberById(java.lang.String)
	 */
	@Override
	public void deleteMemberById(String id) {
		sqlSessionTemplate.delete("member.deleteMemberById", id);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#giveAdminRight(java.lang.String)
	 */
	@Override
	public void giveAdminRight(String id){
		sqlSessionTemplate.update("member.giveAdminRight",id);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#login(org.kosta.gibuticon.model.member.MemberVO)
	 */
	@Override
	public MemberVO login(MemberVO memberVO){
		return sqlSessionTemplate.selectOne("member.login",memberVO);
	}
	
}
