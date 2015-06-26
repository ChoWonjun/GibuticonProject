package org.kosta.gibuticon.model.message;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MessageDAOImpl implements MessageDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.message.MessageDAO#sendMessage(org.kosta.gibuticon.model.message.MessageVO)
	 */
	@Override
	public void sendMessage(MessageVO messageVO){
		sqlSessionTemplate.insert("message.sendMessage",messageVO);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.message.MessageDAO#delMessage(java.lang.String)
	 */
	@Override
	public void delMessage(String no){
		sqlSessionTemplate.delete("message.delMessage",no);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.message.MessageDAO#getMessageByNo(java.lang.String)
	 */
	@Override
	public MessageVO getMessageByNo(String no){
		return sqlSessionTemplate.selectOne("message.getMessageByNo",no);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.message.MessageDAO#getMessageList()
	 */
	@Override
	public List<MessageVO> getMessageList(String id){
		return sqlSessionTemplate.selectList("message.getMessageList",id);
	}

	@Override
	public void setReadTime(String no) {
		sqlSessionTemplate.update("message.setReadTime", no);
	}
}
