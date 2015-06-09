package org.kosta.gibuticon.model.board;

public class NoticeVO {
	private String noticeNo;
	private String title;
	private String content;
	private int hits;

	public NoticeVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getNoticeNo() {
		return noticeNo;
	}

	public void setNoticeNo(String noticeNo) {
		this.noticeNo = noticeNo;
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

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "NoticeVO [noticeNo=" + noticeNo + ", title=" + title
				+ ", content=" + content + ", hits=" + hits + "]";
	}

}
