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
	
	/**
	 * 
	 * 
	 */
	@Override
	public MemberVO findMemberByEmail(String email) {
		return sqlSessionTemplate.selectOne(
				"member.findMemberByEmail", email);
	}

	
	/**
	 * 
	 * 
	 */
	@Override
	public MemberVO findMemberByBirth(String birth) {
		return sqlSessionTemplate.selectOne(
				"member.findMemberByBirth", birth);
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
	
	/**
	 * 포인트 충전 기능.
	 * MemberVO객체로 충전한 포인트 정보를 받아와 해당 회원의 포인트 정보를 수정.
	 *
	 */
	@Override
	public void increasePoint(MemberVO memberVO) {
		sqlSessionTemplate.update("member.increasePoint",memberVO);
	}

	/**
	 * 기부 혹은 선물로 포인트를 사용했을 때 사용한 포인트를 회원정보에서 감소시키는 기능.
	 */
	@Override
	public void decreasePoint(MemberVO memberVO) {
		sqlSessionTemplate.update("member.decreasePoint",memberVO);
	}

	/**
	 * MemberTable 에서 회원의 총기부액 순위를 List로 반환받는다.
	 * 회원정보를 총기부액 순으로 정렬해 반환받는다.
	 */
	@Override
	public List<MemberRankVO> getAmountRanks() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.getAmountRanks");
	}

	/**
	 * MemberTable에서 기부 참여 횟수 순위를 List로 반환받는다.
	 * 회원정보를 기부 참여 횟수 순으로 정렬해 반환받는다.
	 */
	@Override
	public List<MemberRankVO> getFundCountRanks() {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("member.getFundCountRanks");
	}
	
	@Override
	public String findId(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.findId",memberVO);
	}
	
	@Override
	public String findPassword(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.findPassword",memberVO);
	}

	@Override
	public int getGivenCone(String id) {
		// TODO Auto-generated method stub
		int result = 0;
		if(sqlSessionTemplate.selectOne("member.getGivenCone",id)!=null){
			result = sqlSessionTemplate.selectOne("member.getGivenCone",id);
		}
		return result;
	}

	@Override
	public MemberRankVO getMyRank(String id) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectOne("member.getMyRank",id);
	}
}
