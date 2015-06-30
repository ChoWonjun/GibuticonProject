package org.kosta.gibuticon.model.gift;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class GiftDAOImpl implements GiftDAO {
	@Resource(name = "sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.gift.GiftDAO#sendToMember(org.kosta.gibuticon.model.gift.GiftVO)
	 */
	@Override
	public void sendToMember(GiftVO giftVO){
		sqlSessionTemplate.insert("gibuticon.sendToMember", giftVO);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.gift.GiftDAO#sendToNonMember(org.kosta.gibuticon.model.gift.GiftVO)
	 */
	@Override
	public void sendToNonMember(GiftVO giftVO){
		String giftNo = sqlSessionTemplate.selectOne("getGiftNo");
		giftVO.setGiftNo(giftNo);
		giftVO.setPinNo(giftNo+System.currentTimeMillis());
		sqlSessionTemplate.insert("gibuticon.sendToNonMember", giftVO);
	}
	
	@Override
	public GiftVO confirmPin(String pinNo) {
		// TODO Auto-generated method stub
		return  sqlSessionTemplate.selectOne("gibuticon.confirmPin",pinNo);
	}
	
	@Override
	public void insertReciever(GiftVO giftVO) {
		// TODO Auto-generated method stub
		sqlSessionTemplate.update("gibuticon.insertReciever", giftVO);
	}
	
}
