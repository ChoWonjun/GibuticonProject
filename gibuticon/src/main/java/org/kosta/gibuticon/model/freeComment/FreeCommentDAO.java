package org.kosta.gibuticon.model.freeComment;

public interface FreeCommentDAO {

	public abstract void writeFreeComment(FreeBoardCommentVO freeBoardCommentVO);
	
	public abstract void deleteFreeComment(String no);
	
	public abstract String getPageNo(String no);

	public abstract int getTotalPostingCount();

}