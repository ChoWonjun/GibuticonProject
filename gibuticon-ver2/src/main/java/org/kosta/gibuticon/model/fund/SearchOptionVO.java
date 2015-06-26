package org.kosta.gibuticon.model.fund;

public class SearchOptionVO {
	private String no;
	private String pageNo;
	private String word;
	private String category;
	private String source;
	private String funding;

	public SearchOptionVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getNo() {
		return no;
	}

	public void setNo(String no) {
		this.no = no;
	}

	public String getPageNo() {
		return pageNo;
	}

	public void setPageNo(String pageNo) {
		this.pageNo = pageNo;
	}

	public String getWord() {
		return word;
	}

	public void setWord(String word) {
		this.word = word;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getFunding() {
		return funding;
	}

	public void setFunding(String funding) {
		this.funding = funding;
	}

	@Override
	public String toString() {
		return "SearchOptionVO [pageNo=" + pageNo + ", word=" + word
				+ ", category=" + category + ", source=" + source
				+ ", funding=" + funding + "]";
	}

}
