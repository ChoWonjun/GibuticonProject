package org.kosta.gibuticon.model.board;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class FreeBoardDAOImpl {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;
	
	public FreeBoardVO getFreeBoardByNo(String no){
		return sqlSessionTemplate.selectOne("freeboard.getFreeBoardByNo",no);
	}

	public List<FreeBoardVO> getFreeBoardList(){
		return sqlSessionTemplate.selectList("freeboard.getFreeBoardList");
	}
	
	public void writeFreeBoard(FreeBoardVO freeBoardVO){
		sqlSessionTemplate.insert("freeboard.writeFreeBoard",freeBoardVO);
	}
	
	public void deleteFreeBoard(String no){
		sqlSessionTemplate.delete("freeboard.deleteFreeBoard",no);
	}
	
	public void updateFreeBoard(FreeBoardVO freeBoardVO){
		sqlSessionTemplate.update("freeboard.updateFreeBoard",freeBoardVO);
	}
	
}
