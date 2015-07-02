package org.kosta.gibuticon.model.service;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.fund.FundDAO;
import org.kosta.gibuticon.model.fund.FundVO;
import org.kosta.gibuticon.model.history.ChargeHistoryVO;
import org.kosta.gibuticon.model.history.GibuHistoryVO;
import org.kosta.gibuticon.model.history.HistoryDAO;
import org.kosta.gibuticon.model.member.MemberDAO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class ConeServiceImpl implements ConeService {
	@Resource
	private MemberDAO memberDAO;
	@Resource
	private FundDAO fundDAO;
	@Resource
	private HistoryDAO historyDAO;

	@Override
	public void charge(MemberVO memberVO, String paymentType) {

		int chargeAmount = memberVO.getPoint();
		memberDAO.increasePoint(memberVO);

		// 충전내역 table에 삽입
		/*
		 * insert into charge_history(history_no, member_id, charge_time,
		 * payment_type, amount) values(charge_history_seq.nextval, 'java',
		 * sysdate, 'credit', 200) --'java'아이디의 사용자가 신용카드로 200 포인트를 충전
		 */
		historyDAO.writeChargeHistory(new ChargeHistoryVO(memberVO.getId(),
				paymentType, chargeAmount));
	}

	public void gibu(MemberVO memberVO, FundVO fundVO, int point) {
		
		// 멤버의 기존 포인트 저장
		int originalPoint = memberVO.getPoint();
		
		// memberVO의 point를 기부할 포인트로 변경
		memberVO.setPoint(point);
		
		// member의 포인트를 point만큼 감소
		memberDAO.decreasePoint(memberVO);
		
		// memberVO에 감소하고난 뒤의 결과물을 다시 set
		memberVO.setPoint(originalPoint - point);

		// fundVO에 curSum을 기부한 포인트로 변경
		fundVO.setCurSum("" + point);
		
		// 해당 fund에 point만큼 curSum을 증가
		fundDAO.increaseCurSum(fundVO);

		// 기부내역 table에 삽입
		/*
		 * insert into donation_history(history_no, fund_no, member_id,
		 * donation_time, amount) values (donation_history_seq.nextval, 22,
		 * 'java', sysdate, 100); -- 'java' 아이디의 사용자가 22번 기부함에 100 포인트를 기부
		 */
		historyDAO.writeGibuHistory(new GibuHistoryVO(fundVO.getFundNo(),
				memberVO.getId(), point));
	}

	public void testTransaction(MemberVO sender, MemberVO reciever) {
		
		memberDAO.decreasePoint(sender);
		memberDAO.increasePoint(reciever);
	}
}
