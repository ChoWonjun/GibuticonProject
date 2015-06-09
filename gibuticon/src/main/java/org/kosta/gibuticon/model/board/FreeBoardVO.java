package org.kosta.gibuticon.model.board;

import java.sql.Date;

public class FreeBoardVO {
	private String freeBoardNo;
	private String title;
	private Date date;
	private String content;
	private int hits;
	private String writer;

	public FreeBoardVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getFreeBoardNo() {
		return freeBoardNo;
	}

	public void setFreeBoardNo(String freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	@Override
	public String toString() {
		return "FreeBoardVO [freeBoardNo=" + freeBoardNo + ", title=" + title
				+ ", date=" + date + ", content=" + content + ", hits=" + hits
				+ ", writer=" + writer + "]";
	}

}
