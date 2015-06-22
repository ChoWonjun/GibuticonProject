package org.kosta.gibuticon.model.freeBoard.comment;

public interface FreeCommentDAO {

	public abstract void writeFreeComment(FreeCommentVO freeBoardCommentVO);
	
	public abstract void deleteFreeComment(String no);
	
	public abstract String getPageNo(String no);

	public abstract int getTotalPostingCount();

}