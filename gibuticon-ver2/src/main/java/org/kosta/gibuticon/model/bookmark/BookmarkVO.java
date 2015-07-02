package org.kosta.gibuticon.model.bookmark;

import org.kosta.gibuticon.model.fund.FundVO;

public class BookmarkVO {
	private String myId;
	private FundVO fund;

	public BookmarkVO() {
		super();
	}

	public BookmarkVO(String myId, String fundNo) {
		super();
		this.myId = myId;
		this.fund = new FundVO();
		this.fund.setFundNo(fundNo);
	}

	public String getMyId() {
		return myId;
	}

	public void setMyId(String myId) {
		this.myId = myId;
	}

	public FundVO getFund() {
		return fund;
	}

	public void setFund(FundVO fund) {
		this.fund = fund;
	}

	@Override
	public String toString() {
		return "BookmarkVO [myId=" + myId + ", fund=" + fund + "]";
	}
}
