package org.kosta.gibuticon.model.gift;

public interface GiftDAO {

	public abstract void sendToMember(GiftVO giftVO);

	public abstract void sendToNonMember(GiftVO giftVO);

}