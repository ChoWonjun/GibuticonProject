package org.kosta.gibuticon.model.service;

import org.kosta.gibuticon.model.gift.GiftVO;

public interface GiftService {

	public abstract void sendToMember(GiftVO giftVO);

	public abstract void sendToNonMember(GiftVO giftVO);

}