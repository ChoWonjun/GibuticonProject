package org.kosta.gibuticon.model.history;

public class ChargeHistoryVO {
	//history_no, member_id, charge_time, payment_type, amount
	private String historyNo;
	private String memberId;
	private String chargeTime;
	private String paymentType;
	private int amount;
	public ChargeHistoryVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ChargeHistoryVO(String memberId,
			String paymentType, int amount) {
		super();
		this.memberId = memberId;
		this.paymentType = paymentType;
		this.amount = amount;
	}
	public String getHistoryNo() {
		return historyNo;
	}
	public void setHistoryNo(String historyNo) {
		this.historyNo = historyNo;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getChargeTime() {
		return chargeTime;
	}
	public void setChargeTime(String chargeTime) {
		this.chargeTime = chargeTime;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	@Override
	public String toString() {
		return "ChargeHistoryVO [historyNo=" + historyNo + ", memberId="
				+ memberId + ", chargeTime=" + chargeTime + ", paymentType="
				+ paymentType + ", amount=" + amount + "]";
	}
}
