package org.kosta.gibuticon.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.member.MemberDAO;
import org.kosta.gibuticon.model.member.MemberRankVO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {
	@Resource
	private MemberDAO memberDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.service.MemberService#registerMember(org.kosta.gibuticon
	 * .model.member.MemberVO)
	 */
	@Override
	public void registerMember(MemberVO memberVO) {
		memberDAO.registerMember(memberVO);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.service.MemberService#findMemberById(java.lang.String
	 * )
	 */
	@Override
	public MemberVO findMemberById(String id) {
		return memberDAO.findMemberById(id);
	}
	
	@Override
	public MemberVO findMemberByEmail(String email) {
		return memberDAO.findMemberByEmail(email);
	}
	
	@Override
	public MemberVO findMemberByBirth(String birth) {
		return memberDAO.findMemberByBirth(birth);
	}
	

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.service.MemberService#updateMember(org.kosta.gibuticon
	 * .model.member.MemberVO)
	 */
	@Override
	public void updateMember(MemberVO memberVO) {
		memberDAO.updateMember(memberVO);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.service.MemberService#deleteMemberById(java.lang.
	 * String)
	 */
	@Override
	public void deleteMemberById(String id) {
		memberDAO.deleteMemberById(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.service.MemberService#giveAdminRight(java.lang.String
	 * )
	 */
	@Override
	public void giveAdminRight(String id) {
		memberDAO.giveAdminRight(id);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.service.MemberService#login(org.kosta.gibuticon.model
	 * .member.MemberVO)
	 */
	@Override
	public MemberVO login(MemberVO memberVO) {
		return memberDAO.login(memberVO);
	}

	@Override
	public List<MemberRankVO> getAmountRanks() {
		return memberDAO.getAmountRanks();
	}

	@Override
	public List<MemberRankVO> getFundCountRanks() {
		return memberDAO.getFundCountRanks();
	}
	
	@Override
	public String findId(MemberVO memberVO) {
		return memberDAO.findId(memberVO);
	}
	
	@Override
	public String findPassword(MemberVO memberVO) {
		return memberDAO.findPassword(memberVO);
	}
	
	@Override
	public void decreasePoint(MemberVO memberVO){
		memberDAO.decreasePoint(memberVO);
	}

	@Override
	public void increasePoint(MemberVO memberVO) {
		memberDAO.increasePoint(memberVO);
	}

	@Override
	public int getGivenCone(String id) {
		// TODO Auto-generated method stub
		return memberDAO.getGivenCone(id);
	}

	@Override
	public MemberRankVO getMyRank(String id) {
		// TODO Auto-generated method stub
		return memberDAO.getMyRank(id);
	}
}
