package org.kosta.gibuticon.service;

import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.member.MemberVO;

public interface ConeService {

	public abstract void charge(MemberVO memberVO);
	public void gibu(MemberVO memberVO, FundVO fundVO, int point);

}