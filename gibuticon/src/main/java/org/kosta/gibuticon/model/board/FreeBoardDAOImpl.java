package org.kosta.gibuticon.model.board;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	public FreeBoardVO getFreeBoardByNo(String no){
		return sqlSessionTemplate.selectOne("board.getPostingByNo",no);
	}

	public List<FreeBoardVO> getFreeBoardList(){
		return sqlSessionTemplate.selectList("board.getFreeBoardList");
	}
	
	public void writeFreeBoard(FreeBoardVO freeBoardVO){
		sqlSessionTemplate.insert("board.writeFreeBoard",freeBoardVO);
	}
	
	public void deleteFreeBoard(String no){
		sqlSessionTemplate.delete("board.deleteFreeBoard",no);
	}
	
	public void updateFreeBoard(FreeBoardVO freeBoardVO){
		sqlSessionTemplate.update("board.updateFreeBoard",freeBoardVO);
	}
	
}
