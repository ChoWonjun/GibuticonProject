package org.kosta.gibuticon.model.fund.comment;

import java.util.List;
/**
 * 리스트(list.jsp) 화면에서 보여줄 게시물 리스트를 저장하고<br>
 * 페이징 정보 객체를 저장하는 클래스 
 * @author KOSTA-00-KANGSA
 *
 */
public class CommentListVO {
	private List<FundCommentVO> list;
	private CommentPagingBean pagingBean;
	public CommentListVO() {
		super();		
	}
	public CommentListVO(List<FundCommentVO> list, CommentPagingBean pagingBean) {
		super();
		this.list = list;
		this.pagingBean = pagingBean;
	}
	public List<FundCommentVO> getList() {
		return list;
	}
	public void setList(List<FundCommentVO> list) {
		this.list = list;
	}
	public CommentPagingBean getPagingBean() {
		return pagingBean;
	}
	public void setPagingBean(CommentPagingBean pagingBean) {
		this.pagingBean = pagingBean;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pagingBean=" + pagingBean + "]";
	}
	
}
