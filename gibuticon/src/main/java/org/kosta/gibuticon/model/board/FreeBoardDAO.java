package org.kosta.gibuticon.model.board;

import java.util.List;

public interface FreeBoardDAO {

	public abstract FreeBoardVO getFreeBoardByNo(String no);

	public abstract List<FreeBoardVO> getFreeBoardList();

	public abstract void writeFreeBoard(FreeBoardVO freeBoardVO);

	public abstract void deleteFreeBoard(String no);

	public abstract void updateFreeBoard(FreeBoardVO freeBoardVO);

}