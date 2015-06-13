package org.kosta.gibuticon.model.board;

import java.util.List;

import javax.annotation.Resource;

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
	
}
