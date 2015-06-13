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
	public List<FreeBoardVO> getFreeBoardList(String pageNo) {
		return freeBoardDAO.getFreeBoardList(pageNo);
	}

	@Override
	public FreeBoardVO getFreeBoardByNo(String no) {
		//조회수 증가
		freeBoardDAO.updateHit(no);
		return freeBoardDAO.getFreeBoardByNo(no);
	}

	@Override
	public void updateFreeBoard(FreeBoardVO freeBoardVO) {
		freeBoardDAO.updateFreeBoard(freeBoardVO);
	}

	@Override
	public void deleteFreeBoard(String no) {
		freeBoardDAO.deleteFreeBoard(no);
		
	}

	@Override
	public String getPageNo(String no) {
		return freeBoardDAO.getPageNo(no);
	}

	@Override
	public int getTotalPostingCount() {
		return freeBoardDAO.getTotalPostingCount();
	}

	@Override
	public FreeBoardVO getFundByNoNotHit(String no) {
		return freeBoardDAO.getFreeBoardByNo(no);
	}

}
