package org.kosta.gibuticon.model.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.freeBoard.FreeBoardDAO;
import org.kosta.gibuticon.model.freeBoard.FreeBoardVO;
import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentVO;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Service
@Transactional
public class FreeBoardServiceImpl implements FreeBoardService {
	@Resource(name = "freeBoardDAOImpl")
	private FreeBoardDAO freeBoardDAO;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.kosta.gibuticon.service.FreeBoardService#writeFreeBoard(org.kosta
	 * .gibuticon.model.board.FreeBoardVO)
	 */
	@Override
	public void writeFreeBoard(FreeBoardVO freeBoardVO) {
		freeBoardDAO.writeFreeBoard(freeBoardVO);
	}

	@Override
	public List<FreeBoardVO> getFreeBoardList(String pageNo) {
		return freeBoardDAO.getFreeBoardList(pageNo);
	}

	@Override
	public List<FreeBoardVO> getListBySearching(HashMap<String, Object> map) {
		return freeBoardDAO.getListBySearching(map);
	}


	@Override
	public List<FreeBoardVO> getListBySearchingMyId(HashMap<String, Object> map) {
		return freeBoardDAO.getListBySearchingMyId(map);
	}

	@Override
	public FreeBoardVO getFreeBoardByNo(String no) {
		// 조회수 증가
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
	public int getTotalPostingCount(HashMap<String, Object> map) {
		return freeBoardDAO.getTotalPostingCount(map);
	}

	@Override
	public int getTotalPostingCountByMyId(HashMap<String, Object> map) {
		return freeBoardDAO.getTotalPostingCountByMyId(map);
	}

	@Override
	public FreeBoardVO getFreeByNoNotHit(String no) {
		return freeBoardDAO.getFreeBoardByNo(no);
	}

	@Override
	public FreeBoardVO replyView(String no) {
		return freeBoardDAO.replyView(no);
	}
	
	@Override
	public void reply(FreeBoardVO freeBoardVO) {

		freeBoardDAO.replyUpdate(freeBoardVO);
		freeBoardVO.setRestep(freeBoardVO.getRestep() + 1);
		freeBoardVO.setRelevel(freeBoardVO.getRelevel() + 1);
		freeBoardDAO.reply(freeBoardVO);

	}

	@Override
	public List<FreeCommentVO> getCommentList(String no, String pageNo) {
		return freeBoardDAO.getCommentList(no, pageNo);
	}
}
