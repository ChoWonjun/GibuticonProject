package org.kosta.gibuticon.model.freeBoard;

/**
 * 페이징 처리를 위한 비즈니스 클래스
 * 
 * @author KOSTA-00-KANGSA PagingBean method 구현 순서 getTotalPage()
 *         getTotalPageGroup() getNowPageGroup() getStartPageOfPageGroup()
 *         getEndPageOfPageGroup() isPreviousPageGroup() isNextPageGroup()
 * 
 */
public class PagingBean {
	
	/**
	 * 현재 페이지
	 */
	private int nowPage = 1;
	
	/**
	 * 페이지 당 보여줄 게시물 수
	 */
	private int contentNumberPerPage = CommonConstants.CONTENT_NUMBER_PER_PAGE;
	
	/**
	 * 페이지 그룹 당 페이지 수
	 */
	private int pageNumberPerPageGroup = CommonConstants.PAGE_NUMBER_PER_PAGEGROUP;
	
	/**
	 * 현재 db에 저장된 총 게시물 수
	 */
	private int totalContents;

	/**
	 * 총게시물수와 현재 페이지 정보를 할당
	 * 
	 * @param totalContents
	 * @param nowPage
	 */
	public PagingBean(int totalContents, int nowPage) {
		this.totalContents = totalContents;
		this.nowPage = nowPage;
	}

	/**
	 * 현재 페이지 리턴
	 * 
	 * @return
	 */
	public int getNowPage() {
		return nowPage;
	}

	/**
	 * 총 페이지 수를 return한다. 
	 * 
	 * @return
	 */
	public int getTotalPage() {
		int total = 0;
		if (totalContents % contentNumberPerPage == 0)
			total = totalContents / contentNumberPerPage;
		else
			total = totalContents / contentNumberPerPage + 1;
		return total;
	}

	/**
	 * 총 페이지 그룹의 수를 return한다.
	 * 
	 * @return
	 */
	public int getTotalPageGroup() {
		int total = 0;
		if (getTotalPage() % pageNumberPerPageGroup == 0)
			total = getTotalPage() / pageNumberPerPageGroup;
		else
			total = getTotalPage() / pageNumberPerPageGroup + 1;
		return total;
	}

	/**
	 * 현재 페이지가 속한 페이지 그룹 번호(몇 번째 페이지 그룹인지) 을 return 하는 메소드 
	 * 
	 * @return
	 */
	public int getNowPageGroup() {
		int group = 0;
		if (nowPage % pageNumberPerPageGroup == 0)
			group = nowPage / pageNumberPerPageGroup;
		else
			group = nowPage / pageNumberPerPageGroup + 1;
		return group;
	}

	/**
	 * 현재 페이지가 속한 페이지 그룹의 시작 페이지 번호를 return 한다.
	 * 
	 * @return
	 */
	public int getStartPageOfPageGroup() {
		return pageNumberPerPageGroup * (getNowPageGroup() - 1) + 1;
	}

	/**
	 * 현재 페이지가 속한 페이지 그룹의 마지막 페이지 번호를 return 한다.<
	 * 
	 * @return
	 */
	public int getEndPageOfPageGroup() {
		int end = 0;

		end = getNowPageGroup() * pageNumberPerPageGroup;

		if (end > getTotalPage())
			end = getTotalPage();
		return end;
	}

	/**
	 * 이전 페이지 그룹이 있는지 체크하는 메서드 
	 * 
	 * @return
	 */
	public boolean isPreviousPageGroup() {
		boolean flag = false;
		if (getNowPageGroup() > 1)
			flag = true;
		return flag;
	}

	/**
	 * 다음 페이지 그룹이 있는지 체크하는 메서드 
	 * 
	 * @return
	 */
	public boolean isNextPageGroup() {
		boolean flag = false;
		if (getNowPageGroup() < getTotalPageGroup())
			flag = true;
		return flag;
	}

	/**
	 * 
	 * @param no
	 * @return
	 */
	public int getPageNum(int no) {
		return (no / contentNumberPerPage) + 1;
	}

	/**
	 * 
	 * @param args
	 */
	public static void main(String args[]) {
		PagingBean p = new PagingBean(47, 1);
		// 전체 페이지 수 : 10
		System.out.println("getTotalPage:" + p.getTotalPage());
		// 전체 페이지 그룹 수 : 3
		System.out.println("getTotalPageGroup:" + p.getTotalPageGroup());
		p = new PagingBean(31, 6);// 게시물수 31 현재 페이지 6
		// 게시물수 31 -> 총페이지수 7 -> 총페이지그룹->2
		// 현재 페이지 그룹 : 2
		System.out.println("getNowPageGroup:" + p.getNowPageGroup());
		// 페이지 그룹의 시작 페이지 : 5
		System.out.println("getStartPageOfPageGroup:"
				+ p.getStartPageOfPageGroup());
		// 페이지 그룹의 마지막 페이지 : 7
		System.out
				.println("getEndPageOfPageGroup:" + p.getEndPageOfPageGroup());
		// 이전 페이지 그룹이 있는 지 : true
		System.out.println("isPreviousPageGroup:" + p.isPreviousPageGroup());
		// 다음 페이지 그룹이 있는 지 : false
		System.out.println("isNextPageGroup:" + p.isNextPageGroup());/**/
	}

}
