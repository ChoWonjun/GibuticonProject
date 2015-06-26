package org.kosta.gibuticon.model.message;

import java.util.List;

public interface MessageDAO {

	public abstract void sendMessage(MessageVO messageVO);

	public abstract void delMessage(String no);

	public abstract MessageVO getMessageByNo(String no);

	public abstract List<MessageVO> getMessageList(String id);

	public abstract void setReadTime(String no);

}