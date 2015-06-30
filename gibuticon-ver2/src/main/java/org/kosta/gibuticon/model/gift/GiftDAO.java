package org.kosta.gibuticon.model.gift;

public interface GiftDAO {

	public abstract void sendToMember(GiftVO giftVO);

	public abstract void sendToNonMember(GiftVO giftVO);

	public abstract void insertReciever(GiftVO giftVO);
	
	public abstract GiftVO confirmPin(String pinNo);

}