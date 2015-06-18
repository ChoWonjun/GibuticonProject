package org.kosta.gibuticon.model.board;

import java.util.List;

import org.kosta.gibuticon.model.notice.NoticeVO;

/**
 * 게시물 리스트 정보와 페이징 정보를 가지고 있는 클래스
 * 
 * @author inst
 * 
 */
public class ListVO {
	private List<NoticeVO> list;
	private PagingBean pagingBean;

	public ListVO() {
		super();
	}

	public ListVO(List<NoticeVO> list, PagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}

	public List<NoticeVO> getList() {
		return list;
	}

	public void setList(List<NoticeVO> list) {
		this.list = list;
	}

	public PagingBean getPagingBean() {
		return pagingBean;
	}

	public void setPagingBean(PagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}

	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}

}
