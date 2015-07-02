package org.kosta.gibuticon.model.freeBoard;

import org.kosta.gibuticon.model.member.MemberVO;

public class FreeBoardVO {
	private String boardNo;
	private String title;
	private String writeDate;
	private String content;
	private int hits;
	private String id;
	private MemberVO memberVO;
	public int ref;
	public int restep;
	public int relevel;

	public FreeBoardVO() {
		super();
	}

	public String getBoardNo() {
		return boardNo;
	}

	@Override
	public String toString() {
		return "FreeBoardVO [boardNo=" + boardNo + ", title=" + title
				+ ", writeDate=" + writeDate + ", content=" + content
				+ ", hits=" + hits + ", id=" + id + ", ref=" + ref
				+ ", restep=" + restep + ", relevel=" + relevel + "]";
	}

	public void setBoardNo(String boardNo) {
		this.boardNo = boardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getRestep() {
		return restep;
	}

	public void setRestep(int restep) {
		this.restep = restep;
	}

	public int getRelevel() {
		return relevel;
	}

	public void setRelevel(int relevel) {
		this.relevel = relevel;
	}

}
