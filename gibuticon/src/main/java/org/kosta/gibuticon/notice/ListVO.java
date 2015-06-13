package org.kosta.gibuticon.notice;

import java.util.List;
/**
 * 리스트(list.jsp) 화면에서 보여줄 게시물 리스트를 저장하고<br>
 * 페이징 정보 객체를 저장하는 클래스 
 * @author KOSTA-00-KANGSA
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
