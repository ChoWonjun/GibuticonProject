package org.kosta.gibuticon.model.history;

public class GibuHistoryVO {
	//history_no, fund_no, member_id, donation_time, amount
	private String historyNo;
	private String fundNo;
	private String memberId;
	private String donationTime;
	private int amount;
	public GibuHistoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GibuHistoryVO(String fundNo, String memberId,
			int amount) {
		super();
		this.fundNo = fundNo;
		this.memberId = memberId;
		this.amount = amount;
	}
	public String getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(String historyNo) {
		this.historyNo = historyNo;
	}
	public String getFundNo() {
		return fundNo;
	}
	public void setFundNo(String fundNo) {
		this.fundNo = fundNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getDonationTime() {
		return donationTime;
	}
	public void setDonationTime(String donationTime) {
		this.donationTime = donationTime;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "GibuHistoryVO [historyNo=" + historyNo + ", fundNo=" + fundNo
				+ ", memberId=" + memberId + ", donationTime=" + donationTime
				+ ", amount=" + amount + "]";
	}
}
