package org.kosta.gibuticon.model.freeBoard;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentPageVO;
import org.kosta.gibuticon.model.freeBoard.comment.FreeCommentVO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.kosta.gibuticon.model.notice.NoticeVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#getFreeBoardByNo(java.lang.String)
	 */
	/**
	 * 자유게시판의 보드 no를 이용하여 상세정보를 불러온다.
	 */
	@Override
	public FreeBoardVO getFreeBoardByNo(String no){
		FreeBoardVO fvo=sqlSessionTemplate.selectOne("freeBoard.getFreeBoardByNo",no);
		fvo.setMemberVO((MemberVO)sqlSessionTemplate.selectOne("member.findMemberById",fvo.getId()));
		return fvo;
	}
	
	/**
	 * 
	 */
	@Override
	public List<FreeBoardVO> getListBySearchingTitle(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("freeBoard.getListBySearchingTitle",map);
	}

	/**
	 * 
	 */
	@Override
	public List<FreeBoardVO> getListBySearchingContent(HashMap<String, Object> map) {
		return sqlSessionTemplate.selectList("freeBoard.getListBySearchingContent",map);
	}

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#getFreeBoardList()
	 */
	/**
	 * 페이지번호로 보드 리스트를 불러온다.
	 * FreeBoardVO에 있는 member에 정보를 넣기 위해
	 * member.findMemberById로 member정보를 불러와 set한다.
	 */
	@Override
	public List<FreeBoardVO> getFreeBoardList(String pageNo){
		List<FreeBoardVO> list=sqlSessionTemplate.selectList("freeBoard.getFreeBoardList", pageNo);
		for(int i=0;i<list.size();i++){
			list.get(i).setMemberVO((MemberVO)sqlSessionTemplate.selectOne("member.findMemberById",list.get(i).getId()));
		}
		return list;
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#writeFreeBoard(org.kosta.gibuticon.model.board.FreeBoardVO)
	 */
	/**
	 * 자유게시판에 글을 쓰는 메서드
	 */
	@Override
	public void writeFreeBoard(FreeBoardVO freeBoardVO){
		sqlSessionTemplate.insert("freeBoard.writeFreeBoard",freeBoardVO);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#deleteFreeBoard(java.lang.String)
	 */
	/**
	 * 자유게시판에 있는 글을 삭제하는 메서드
	 * 이때 자유게시판은 코멘트보드와 연결되어 있기 때문에 우선적으로 코멘트보드를 다 지운후 
	 * 자유게시판을 지운다.
	 */
	@Override
	public void deleteFreeBoard(String no){
		List<FreeCommentVO> list=sqlSessionTemplate.selectList("freeComment.deleteFreeCommentList", no);
		for(int i=0;i<list.size();i++){
			sqlSessionTemplate.delete("freeComment.deleteFreeComment",list.get(i).getCommentNo());
		}
		sqlSessionTemplate.delete("freeBoard.deleteFreeBoard",no);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#updateFreeBoard(org.kosta.gibuticon.model.board.FreeBoardVO)
	 */
	/**
	 * freeBoardVO를 받아와 지유게시판을 수정한다.
	 */
	@Override
	public void updateFreeBoard(FreeBoardVO freeBoardVO){
		sqlSessionTemplate.update("freeBoard.updateFreeBoard",freeBoardVO);
	}
	/**
	 * 자유게시판 글번호를 이용하여 페이지번호를 불러오는 메서드
	 */
	@Override
	public String getPageNo(String no) {
		return sqlSessionTemplate.selectOne("freeBoard.getPageNo", no);
	}
	/**
	 * 총 게시물의 수를 불러오는 메서드
	 */
	@Override
	public int getTotalPostingCount() {
		return sqlSessionTemplate.selectOne("freeBoard.getTotalPostingCount");
	}
	/**
	 * 조회수를 업데이트 시키는 메서드
	 */
	@Override
	public void updateHit(String no) {
		sqlSessionTemplate.update("freeBoard.updateHit", no);
		
	}
	/**
	 * 답글 창을 보여주는 메서드
	 */
	@Override
	public FreeBoardVO replyView(String no) {
		return sqlSessionTemplate.selectOne("freeBoard.replyView",no);
	}
	/**
	 * 우선 답글 레벨을 올리고(?)
	 * 그 후 답글을 작성하는 메서드
	 */
	@Override
	public void reply(FreeBoardVO freeBoardVO) {
		sqlSessionTemplate.update("freeBoard.replyUpdate",freeBoardVO);
		sqlSessionTemplate.insert("freeBoard.replyWrite",freeBoardVO);
		
	}
	/**
	 * 자유게시판 댓글 리스트를 불러오는 메서드
	 */
	@Override
	public List<FreeCommentVO> getCommentList(String no, String pageNo) {
		List<FreeCommentVO> list=sqlSessionTemplate.selectList("freeComment.getFreeBoardCommentList", new FreeCommentPageVO(Integer.parseInt(no), pageNo));
		for(int i=0;i<list.size();i++){
			list.get(i).setMemberVO((MemberVO)sqlSessionTemplate.selectOne("member.findMemberById",list.get(i).getId()));
		}
		return list;
	}


	
}
