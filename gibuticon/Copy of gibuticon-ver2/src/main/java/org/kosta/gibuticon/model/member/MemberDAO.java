package org.kosta.gibuticon.model.member;

import java.util.List;

public interface MemberDAO {

	public abstract void registerMember(MemberVO memberVO);

	public abstract MemberVO findMemberById(String id);

	public abstract void updateMember(MemberVO memberVO);

	public abstract void deleteMemberById(String id);

	public abstract void giveAdminRight(String id);

	public abstract MemberVO login(MemberVO memberVO);

	public void increasePoint(MemberVO memberVO);

	public void decreasePoint(MemberVO memberVO);
	
	public List<MemberRankVO> getAmountRanks();
	
	public List<MemberRankVO> getFundCountRanks();
}