package org.kosta.gibuticon.service;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.board.FreeBoardDAO;
import org.kosta.gibuticon.model.board.FreeBoardVO;
import org.springframework.stereotype.Service;

@Service
public class FreeBoardServiceImpl implements FreeBoardService {
	@Resource(name="freeBoardDAOImpl")
	private FreeBoardDAO freeBoardDAO;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.service.FreeBoardService#writeFreeBoard(org.kosta.gibuticon.model.board.FreeBoardVO)
	 */
	@Override
	public void writeFreeBoard(FreeBoardVO freeBoardVO){
		freeBoardDAO.writeFreeBoard(freeBoardVO);
	}

	@Override
	public List<FreeBoardVO> getFreeBoardList() {
		return freeBoardDAO.getFreeBoardList();
	}

	@Override
	public FreeBoardVO getFreeBoardByNo(String no) {
		return freeBoardDAO.getFreeBoardByNo(no);
	}

}
