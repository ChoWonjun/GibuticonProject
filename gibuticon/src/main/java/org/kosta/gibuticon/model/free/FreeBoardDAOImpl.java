package org.kosta.gibuticon.model.free;

import java.util.List;

import javax.annotation.Resource;

import org.kosta.gibuticon.model.freeComment.FreeBoardCommentVO;
import org.kosta.gibuticon.model.member.MemberVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl implements FreeBoardDAO {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#getFreeBoardByNo(java.lang.String)
	 */
	@Override
	public FreeBoardVO getFreeBoardByNo(String no){
		return sqlSessionTemplate.selectOne("freeboard.getFreeBoardByNo",no);
	}

	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#getFreeBoardList()
	 */
	@Override
	public List<FreeBoardVO> getFreeBoardList(String pageNo){
		List<FreeBoardVO> list=sqlSessionTemplate.selectList("freeboard.getFreeBoardList", pageNo);
		System.out.println(list);
		for(int i=0;i<list.size();i++){
			list.get(i).setMemberVO((MemberVO)sqlSessionTemplate.selectOne("member.findMemberById",list.get(i).getId()));
			System.out.println(sqlSessionTemplate.selectOne("member.findMemberById",list.get(i).getId()));
		}

		return sqlSessionTemplate.selectList("freeboard.getFreeBoardList", pageNo);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#writeFreeBoard(org.kosta.gibuticon.model.board.FreeBoardVO)
	 */
	@Override
	public void writeFreeBoard(FreeBoardVO freeBoardVO){
		sqlSessionTemplate.insert("freeboard.writeFreeBoard",freeBoardVO);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#deleteFreeBoard(java.lang.String)
	 */
	@Override
	public void deleteFreeBoard(String no){
		sqlSessionTemplate.delete("freeboard.deleteFreeBoard",no);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.board.FreeBoardDAO#updateFreeBoard(org.kosta.gibuticon.model.board.FreeBoardVO)
	 */
	@Override
	public void updateFreeBoard(FreeBoardVO freeBoardVO){
		sqlSessionTemplate.update("freeboard.updateFreeBoard",freeBoardVO);
		System.out.println(freeBoardVO+"DAO");
	}

	@Override
	public String getPageNo(String no) {
		return sqlSessionTemplate.selectOne("freeboard.getPageNo", no);
	}

	@Override
	public int getTotalPostingCount() {
		return sqlSessionTemplate.selectOne("freeboard.getTotalPostingCount");
	}

	@Override
	public void updateHit(String no) {
		sqlSessionTemplate.update("freeboard.updateHit", no);
		
	}

	@Override
	public FreeBoardVO replyView(String no) {
		return sqlSessionTemplate.selectOne("freeboard.replyView",no);
	}

	@Override
	public void reply(FreeBoardVO freeBoardVO) {
		sqlSessionTemplate.update("freeboard.replyUpdate",freeBoardVO);
		sqlSessionTemplate.insert("freeboard.replyWrite",freeBoardVO);
		
	}

	@Override
	public List<FreeBoardCommentVO> getFreeBoardCommentList(
			FreeBoardVO freeBoardVO) {
		return sqlSessionTemplate.selectList("freeboard.getFreeBoardCommentList", freeBoardVO);
	}
	
}
