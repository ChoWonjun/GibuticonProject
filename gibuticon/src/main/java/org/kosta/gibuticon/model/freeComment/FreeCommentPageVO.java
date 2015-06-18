package org.kosta.gibuticon.model.freeComment;

public class FreeCommentPageVO {
	private int boardNo;
	private String pageNo;
	public FreeCommentPageVO(int boardNo, String pageNo) {
		super();
		this.boardNo = boardNo;
		this.pageNo = pageNo;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getPageNo() {
		return pageNo;
	}
	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}
	@Override
	public String toString() {
		return "FreeCommentPageVO [boardNo=" + boardNo + ", pageNo=" + pageNo
				+ "]";
	}
	

}
