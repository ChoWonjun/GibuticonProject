package org.kosta.gibuticon.model.message;

import org.kosta.gibuticon.model.member.MemberVO;

public class MessageVO {
	private String no;
	private MemberVO sender;
	private String receiverId;
	private String title;
	private String content;
	private String sendTime;
	private String readTime;
	public MessageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MessageVO(String no, MemberVO sender, String receiverId, String title,
			String content, String sendTime, String readTime) {
		super();
		this.no = no;
		this.sender = sender;
		this.receiverId = receiverId;
		this.title = title;
		this.content = content;
		this.sendTime = sendTime;
		this.readTime = readTime;
	}
	
	public String getNo() {
		return no;
	}
	public void setNo(String no) {
		this.no = no;
	}
	public MemberVO getSender() {
		return sender;
	}
	public void setSender(MemberVO sender) {
		this.sender = sender;
	}
	public String getReceiverId() {
		return receiverId;
	}
	public void setReceiverId(String receiverId) {
		this.receiverId = receiverId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getReadTime() {
		return readTime;
	}
	public void setReadTime(String readTime) {
		this.readTime = readTime;
	}
	@Override
	public String toString() {
		return "MessageVO [no=" + no + ", sender=" + sender + ", receiverId="
				+ receiverId + ", title=" + title + ", content=" + content
				+ ", sendTime=" + sendTime + ", readTime=" + readTime + "]";
	}

}
