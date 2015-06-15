package org.kosta.gibuticon.model.freeComment;

import org.kosta.gibuticon.model.member.MemberVO;

public class FreeBoardCommentVO {
	private String commentNo;
	private String writeDate;
	private String comment;
	private int hits;
	private MemberVO memberVO;
	private int boardNo;
	public String getCommentNo() {
		return commentNo;
	}
	public void setCommentNo(String commentNo) {
		this.commentNo = commentNo;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public int getHits() {
		return hits;
	}
	public void setHits(int hits) {
		this.hits = hits;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	@Override
	public String toString() {
		return "FreeBoardCommentVO [commentNo=" + commentNo + ", writeDate="
				+ writeDate + ", comment=" + comment + ", hits=" + hits
				+ ", memberVO=" + memberVO + ", boardNo=" + boardNo + "]";
	}
	

}
