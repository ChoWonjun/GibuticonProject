package org.kosta.gibuticon.model.message;

import java.util.HashMap;
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
	public List<MessageVO> getReceiveList(String id, String page){
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("id", id);
		map.put("page", page);
		return sqlSessionTemplate.selectList("message.getReceiveList",map);
	}

	@Override
	public void setReadTime(String no) {
		sqlSessionTemplate.update("message.setReadTime", no);
	}

	@Override
	public List<MessageVO> getSendList(String id,String page) {
		HashMap<String,String> map=new HashMap<String,String>();
		map.put("id",id);
		map.put("page", page);
		return sqlSessionTemplate.selectList("message.getSendList",map);
	}
	
	@Override
	public int getReceiveCount(String receiverId){
		return sqlSessionTemplate.selectOne("message.getReceiveCount",receiverId);
	}

	@Override
	public int getSendCount(String senderId) {
		return sqlSessionTemplate.selectOne("message.getSendCount",senderId);
	}
}
