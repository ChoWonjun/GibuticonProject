package org.kosta.gibuticon.model.member;

import java.util.List;

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
	/**
	 * 회원가입시 id,password,name,address,tel,birth,email 정보를 
	 * MemberVO로 받아와 member table에 등록.
	 */
	@Override
	public void registerMember(MemberVO memberVO) {
		System.out.println("dao: "+memberVO);
		sqlSessionTemplate.insert("member.registerMember", memberVO);
	}

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#findMemberById(java.lang.String)
	 */
	/**
	 * member table에서 id에 일치하는 회원 정보를 반환.
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
	/**
	 * id에 해당하는 회원정보의 password, address, tell, email정보를 수정.
	 * MemberVO 객체로 id와 수정 정보를 묶어서 받는다.
	 */
	@Override
	public void updateMember(MemberVO memberVO) {
		sqlSessionTemplate.update("member.updateMember", memberVO);
	}

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#deleteMemberById(java.lang.String)
	 */
	/**
	 * id에 해당하는 회원정보를 삭제.
	 */
	@Override
	public void deleteMemberById(String id) {
		sqlSessionTemplate.delete("member.deleteMemberById", id);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#giveAdminRight(java.lang.String)
	 */
	/**
	 * id에 일치하는 회원정보의 관리자 권한(admin column)을 yes로 수정.
	 */
	@Override
	public void giveAdminRight(String id){
		sqlSessionTemplate.update("member.giveAdminRight",id);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.member.MemberDAO#login(org.kosta.gibuticon.model.member.MemberVO)
	 */
	/**
	 * id와 password 정보를 MemberVO객체로 받아와 
	 * id, password가 모두 일치하는 회원의 정보를 반환. 
	 */
	@Override
	public MemberVO login(MemberVO memberVO){
		return sqlSessionTemplate.selectOne("member.login",memberVO);
	}
	
	@Override
	public void increasePoint(MemberVO memberVO) {
		sqlSessionTemplate.update("member.increasePoint",memberVO);
	}

	@Override
	public void decreasePoint(MemberVO memberVO) {
		sqlSessionTemplate.update("member.decreasePoint",memberVO);
	}

	@Override
	public List<MemberRankVO> getAmountRanks() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.getAmountRanks");
	}

	@Override
	public List<MemberRankVO> getFundCountRanks() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.getFundCountRanks");
	}
}
