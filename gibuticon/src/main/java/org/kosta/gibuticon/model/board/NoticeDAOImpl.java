package org.kosta.gibuticon.model.board;

import java.util.List;

import javax.annotation.Resource;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class NoticeDAOImpl implements NoticeDAO {
	@Resource
	private SqlSessionTemplate sqlSessionTemplate;

	public NoticeVO getNoticeByNo(int noticeNo) {
		return sqlSessionTemplate.selectOne("notice.getNoticeByNo", noticeNo);
	}


	public List<NoticeVO> getNoticeList(String pageNo) {
		return sqlSessionTemplate.selectList("notice.getNoticeList", pageNo);
	}


	public void writeNotice(NoticeVO noticeVO) {
		System.out.println("dao : "+noticeVO);
		sqlSessionTemplate.insert("notice.writeNotice", noticeVO);
	}


	public void deleteNotice(int noticeNo) {
		sqlSessionTemplate.delete("notice.deleteNotice", noticeNo);
	}

	
	public void updateNotice(NoticeVO noticeVO) {
		sqlSessionTemplate.update("notice.updateNotice", noticeVO);
	}
	
	
	public void updateCount(int noticeNo) {
		sqlSessionTemplate.update("notice.updateCount", noticeNo);
	}
	
	
	public int totalContent(){
		return sqlSessionTemplate.selectOne("notice.totalContent");
	}

	public NoticeVO showContent(int no){
		return (NoticeVO)sqlSessionTemplate.selectOne("notice.showContent",no);
	}
}
