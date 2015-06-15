package org.kosta.gibuticon.service;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.fund.FundDAO;
import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.member.MemberDAO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.springframework.stereotype.Service;

@Service
public class ConeServiceImpl implements ConeService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private FundDAO fundDAO;
	
	@Override
	public void charge(MemberVO memberVO) {
		memberDAO.increasePoint(memberVO);
	}
	
	public void gibu(MemberVO memberVO, FundVO fundVO, int point){
		int originalPoint=memberVO.getPoint();
		memberVO.setPoint(point);
		memberDAO.decreasePoint(memberVO);
		memberVO.setPoint(originalPoint-point);
		
		fundVO.setCurSum(""+point);
		fundDAO.increaseCurSum(fundVO);
	}
}
