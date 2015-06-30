package org.kosta.gibuticon.model.service;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.gift.GiftDAO;
import org.kosta.gibuticon.model.gift.GiftVO;
import org.springframework.stereotype.Service;

@Service
public class GiftServiceImpl implements GiftService {
	@Resource
	private GiftDAO giftDAO;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.service.GiftService#sendToMember(org.kosta.gibuticon.model.gift.GiftVO)
	 */
	@Override
	public void sendToMember(GiftVO giftVO){
		giftDAO.sendToMember(giftVO);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.service.GiftService#sendToNonMember(org.kosta.gibuticon.model.gift.GiftVO)
	 */
	@Override
	public void sendToNonMember(GiftVO giftVO){
		giftDAO.sendToNonMember(giftVO);
	}
	
	@Override
	public GiftVO confirmPin(String pinNo) {
		// TODO Auto-generated method stub
		return giftDAO.confirmPin(pinNo);
	}
	
	public void insertReciever(GiftVO giftVO){
		giftDAO.insertReciever(giftVO);
	}
}