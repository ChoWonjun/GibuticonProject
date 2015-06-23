package org.kosta.gibuticon.model.fund.comment;

import org.kosta.gibuticon.model.member.MemberVO;

public class FundCommentVO {
/*	comment_no number primary key,
	fund_no number not null,
	member_id varchar2(200) not null,
	text varchar2(200) not null,
	comment_time date not null,*/
	
	private int commentNo;
	private int fundNo;
	private MemberVO memberVO;
	private String text;
	private String commentTime;
	public FundCommentVO() {
		super();
	}
	public int getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(int commentNo) {
		this.commentNo = commentNo;
	}
	public int getFundNo() {
		return fundNo;
	}
	public void setFundNo(int fundNo) {
		this.fundNo = fundNo;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getText() {
		return text;
	}
	public void setText(String text) {
		this.text = text;
	}
	public String getCommentTime() {
		return commentTime;
	}
	public void setCommentTime(String commentTime) {
		this.commentTime = commentTime;
	}
	@Override
	public String toString() {
		return "FundCommentVO [commentNo=" + commentNo + ", fundNo=" + fundNo
				+ ", memberVO=" + memberVO + ", text=" + text
				+ ", commentTime=" + commentTime + "]";
	}
}
