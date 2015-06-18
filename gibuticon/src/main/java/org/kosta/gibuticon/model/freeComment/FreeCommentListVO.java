package org.kosta.gibuticon.model.freeComment;

import java.util.List;
/**
 * 리스트(list.jsp) 화면에서 보여줄 게시물 리스트를 저장하고<br>
 * 페이징 정보 객체를 저장하는 클래스 
 * @author KOSTA-00-KANGSA
 *
 */
public class FreeCommentListVO {
	private List<FreeBoardCommentVO> list;
	private FreeCommentPagingBean pagingBean;
	public FreeCommentListVO() {
		super();		
	}
	public FreeCommentListVO(List<FreeBoardCommentVO> list, FreeCommentPagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<FreeBoardCommentVO> getList() {
		return list;
	}
	public void setList(List<FreeBoardCommentVO> list) {
		this.list = list;
	}
	public FreeCommentPagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(FreeCommentPagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}
