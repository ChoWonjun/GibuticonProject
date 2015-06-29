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
		sqlSessionTemplate.insert("gibuticon.sendToNonMember", giftVO);
	}
	
}
