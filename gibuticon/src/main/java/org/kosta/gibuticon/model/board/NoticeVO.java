package org.kosta.gibuticon.model.board;

public class NoticeVO {
	private int noticeNo;
	private String title;
	private String writeDate;
	private String content;
	private int hits;

	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public NoticeVO(int noticeNo, String title, String writeDate, String content,
			int hits) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.writeDate = writeDate;
		this.content = content;
		this.hits = hits;
	}

	public NoticeVO(String title, String content) {
		super();
		this.title = title;
		this.content = content;
	}

	public NoticeVO(int noticeNo, String title, String content) {
		super();
		this.noticeNo = noticeNo;
		this.title = title;
		this.content = content;
	}

	public int getnoticeNo() {
		return noticeNo;
	}

	public void setnoticeNo(int noticeNo) {
		this.noticeNo = noticeNo;
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

	@Override
	public String toString() {
		return "noticeNoticeVO [noticeNo=" + noticeNo + ", title=" + title + ", writeDate="
				+ writeDate + ", content=" + content + ", hits=" + hits + "]";
	}

}
