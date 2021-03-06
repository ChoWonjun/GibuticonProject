package org.kosta.gibuticon.model.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.message.MessageDAO;
import org.kosta.gibuticon.model.message.MessageVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class MessageServiceImpl implements MessageService {

	@Resource
	private MessageDAO messageDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.service.MessageService#sendMessage(org.kosta
	 * .gibuticon.model.message.MessageVO)
	 */
	@Override
	public void sendMessage(MessageVO messageVO) {
		messageDAO.sendMessage(messageVO);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.service.MessageService#delMessage(java.lang
	 * .String)
	 */
	@Override
	public void delMessage(String no) {
		messageDAO.delMessage(no);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.model.service.MessageService#getMessageByNo(java.
	 * lang.String)
	 */
	@Override
	public MessageVO getMessageByNo(String no) {
		return messageDAO.getMessageByNo(no);
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see org.kosta.gibuticon.model.service.MessageService#getMessageList()
	 */
	@Override
	public List<MessageVO> getReceiveList(String id, String page) {
		return messageDAO.getReceiveList(id, page);
	}

	@Override
	public void setReadTime(String no) {
		messageDAO.setReadTime(no);
	}

	@Override
	public List<MessageVO> getSendList(String id, String page) {
		// TODO Auto-generated method stub
		return messageDAO.getSendList(id, page);
	}

	@Override
	public int getReceiveCount(String receiverId) {
		return messageDAO.getReceiveCount(receiverId);
	}

	@Override
	public int getSendCount(String senderId) {
		return messageDAO.getSendCount(senderId);
	}
}
