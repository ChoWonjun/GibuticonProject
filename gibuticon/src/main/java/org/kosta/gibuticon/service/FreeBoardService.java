package org.kosta.gibuticon.service;

import java.util.List;

import org.kosta.gibuticon.model.board.FreeBoardVO;

public interface FreeBoardService {

	public abstract void writeFreeBoard(FreeBoardVO freeBoardVO);
	public abstract List<FreeBoardVO> getFreeBoardList();
	public abstract FreeBoardVO getFreeBoardByNo(String no);
	public abstract void updateFreeBoard(FreeBoardVO freeBoardVO);
	public abstract void deleteFreeBoard(String no);
}