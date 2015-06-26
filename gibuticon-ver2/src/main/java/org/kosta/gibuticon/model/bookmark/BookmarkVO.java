package org.kosta.gibuticon.model.bookmark;

import org.kosta.gibuticon.model.fund.FundVO;

public class BookmarkVO {
	private String myid;
	private FundVO fund;
	
	public String getMyid() {
		return myid;
	}
	public void setMyid(String myid) {
		this.myid = myid;
	}
	public FundVO getFund() {
		return fund;
	}
	public void setFund(FundVO fund) {
		this.fund = fund;
	}
	@Override
	public String toString() {
		return "BookmarkVO [myid=" + myid + ", fund=" + fund + "]";
	}
}
