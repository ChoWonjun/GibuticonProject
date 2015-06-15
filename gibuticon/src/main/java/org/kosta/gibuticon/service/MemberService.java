package org.kosta.gibuticon.service;

import org.kosta.gibuticon.model.member.MemberVO;

public interface MemberService {

	public abstract void registerMember(MemberVO memberVO);

	public abstract MemberVO findMemberById(String id);

	public abstract void updateMember(MemberVO memberVO);

	public abstract void deleteMemberById(String id);

	public abstract void giveAdminRight(String id);

	public abstract MemberVO login(MemberVO memberVO);
}