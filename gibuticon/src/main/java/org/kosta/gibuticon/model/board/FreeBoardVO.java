package org.kosta.gibuticon.model.board;

import java.sql.Date;

public class FreeBoardVO {
	private String boardNo;
	private String title;
	private Date writeDate;
	private String content;
	private int hits;
	private String id;

	public FreeBoardVO() {
		super();
	}

	public FreeBoardVO(String title, String content, String id) {
		super();
		this.title = title;
		this.content = content;
		this.id = id;
	}

	public FreeBoardVO(String boardNo, String title, String content, String id) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.content = content;
		this.id = id;
	}

	public FreeBoardVO(String boardNo, String title, Date writeDate,
			String content, int hits, String id) {
		super();
		this.boardNo = boardNo;
		this.title = title;
		this.writeDate = writeDate;
		this.content = content;
		this.hits = hits;
		this.id = id;
	}

	@Override
	public String toString() {
		return "FreeBoardVO [boardNo=" + boardNo + ", title=" + title
				+ ", writeDate=" + writeDate + ", content=" + content
				+ ", hits=" + hits + ", id=" + id + "]";
	}

	public String getBoardNo() {
		return boardNo;
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

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
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

}
