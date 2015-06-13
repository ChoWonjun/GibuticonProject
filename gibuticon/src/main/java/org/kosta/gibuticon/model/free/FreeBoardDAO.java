package org.kosta.gibuticon.model.free;

import java.util.List;

public interface FreeBoardDAO {

	public abstract FreeBoardVO getFreeBoardByNo(String no);

	public abstract List<FreeBoardVO> getFreeBoardList(String pageNo);

	public abstract void writeFreeBoard(FreeBoardVO freeBoardVO);

	public abstract void deleteFreeBoard(String no);

	public abstract void updateFreeBoard(FreeBoardVO freeBoardVO);
	
	public abstract String getPageNo(String no);

	public abstract int getTotalPostingCount();

	public abstract void updateHit(String no);

}