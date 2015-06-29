package org.kosta.gibuticon.model.gift;

public class GiftVO {
	private String giftNo;
	private String giftDate;
	private int price;
	private String sender;
	private String reciever;
	private String pinNo;

	public GiftVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getGiftNo() {
		return giftNo;
	}

	public void setGiftNo(String giftNo) {
		this.giftNo = giftNo;
	}

	public String getGiftDate() {
		return giftDate;
	}

	public void setGiftDate(String giftDate) {
		this.giftDate = giftDate;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getSender() {
		return sender;
	}

	public void setSender(String sender) {
		this.sender = sender;
	}

	public String getReciever() {
		return reciever;
	}

	public void setReciever(String reciever) {
		this.reciever = reciever;
	}

	public String getPinNo() {
		return pinNo;
	}

	public void setPinNo(String pinNo) {
		this.pinNo = pinNo;
	}

	@Override
	public String toString() {
		return "GiftVO [giftNo=" + giftNo + ", giftDate=" + giftDate
				+ ", price=" + price + ", sender=" + sender + ", reciever="
				+ reciever + ", pinNo=" + pinNo + "]";
	}

}
