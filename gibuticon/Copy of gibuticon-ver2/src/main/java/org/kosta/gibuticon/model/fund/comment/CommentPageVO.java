package org.kosta.gibuticon.model.fund.comment;

public class CommentPageVO {
	private String fundNo;
	private String commentPage;
	public CommentPageVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public CommentPageVO(String fundNo, String commentPage) {
		super();
		this.fundNo = fundNo;
		this.commentPage = commentPage;
	}

	public String getFundNo() {
		return fundNo;
	}
	public void setFundNo(String fundNo) {
		this.fundNo = fundNo;
	}
	public String getCommentPage() {
		return commentPage;
	}
	public void setCommentPage(String commentPage) {
		this.commentPage = commentPage;
	}
	@Override
	public String toString() {
		return "CommentPageVO [fundNo=" + fundNo + ", commentPage="
				+ commentPage + "]";
	}
	
	
}
