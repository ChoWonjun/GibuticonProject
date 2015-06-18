package org.kosta.gibuticon.model.history;

import java.util.List;

public interface HistoryDAO {

	public abstract void writeChargeHistory(ChargeHistoryVO chargeHistoryVO);

	public abstract void writeGibuHistory(GibuHistoryVO gibuHistoryVO);

	public abstract List<ChargeHistoryVO> getChargeHistory(String memberId);
}