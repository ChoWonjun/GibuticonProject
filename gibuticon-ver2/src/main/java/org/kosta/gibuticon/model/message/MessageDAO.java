package org.kosta.gibuticon.model.message;

import java.util.List;

public interface MessageDAO {

	public abstract void sendMessage(MessageVO messageVO);

	public abstract void delMessage(String no);

	public abstract MessageVO getMessageByNo(String no);

	public abstract List<MessageVO> getReceiveList(String id, String page);

	public abstract void setReadTime(String no);

	public abstract List<MessageVO> getSendList(String id, String page);

	int getReceiveCount(String receiverId);
	
	int getSendCount(String senderId);

}