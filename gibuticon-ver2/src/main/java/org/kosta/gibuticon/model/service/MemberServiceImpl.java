package org.kosta.gibuticon.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.member.MemberDAO;
import org.kosta.gibuticon.model.member.MemberRankVO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.springframework.stereotype.Service;

@Service
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
		// TODO Auto-generated method stub
		return memberDAO.findMemberByEmail(email);
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
		// TODO Auto-generated method stub
		return memberDAO.getAmountRanks();
	}

	@Override
	public List<MemberRankVO> getFundCountRanks() {
		// TODO Auto-generated method stub
		return memberDAO.getFundCountRanks();
	}
	
	@Override
	public String findId(MemberVO memberVO) {
		// TODO Auto-generated method stub
		return memberDAO.findId(memberVO);
	}
}
