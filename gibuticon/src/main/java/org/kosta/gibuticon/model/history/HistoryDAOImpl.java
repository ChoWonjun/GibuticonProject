package org.kosta.gibuticon.model.history;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class HistoryDAOImpl implements HistoryDAO {
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.history.HistoryDAO#writeChargeHistory(org.kosta.gibuticon.model.history.ChargeHistoryVO)
	 */
	@Override
	public void writeChargeHistory(ChargeHistoryVO chargeHistoryVO) {
		System.out.println(chargeHistoryVO);
		sqlSessionTemplate.insert("history.writeChargeHistory", chargeHistoryVO);
	}
	
	/* (non-Javadoc)
	 * @see org.kosta.gibuticon.model.history.HistoryDAO#writeGibuHistory(org.kosta.gibuticon.model.history.GibuHistoryVO)
	 */
	@Override
	public void writeGibuHistory(GibuHistoryVO gibuHistoryVO) {
		sqlSessionTemplate.insert("history.writeGibuHistory", gibuHistoryVO);
	}

	@Override
	public List<ChargeHistoryVO> getChargeHistory(String memberId) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("history.getChargeHistory", memberId);
	}
}
