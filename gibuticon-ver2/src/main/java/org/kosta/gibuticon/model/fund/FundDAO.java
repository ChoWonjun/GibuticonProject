package org.kosta.gibuticon.model.fund;

import java.util.List;

import org.kosta.gibuticon.model.fund.comment.FundCommentVO;

public interface FundDAO {

	public abstract void writeFund(FundVO fundVO);

	public abstract FundVO getFundByNo(String no);

	public abstract void updateFund(FundVO fundVO);

	public abstract void deleteFundByNo(String no);

	// updateHits
	// update board_inst set hits=hits+1 where no=?"
	// increase participant_count 참가자 수 증가 메서드
	public abstract void increaseParticipant(String no);

	// increase cur_sum 현재까지 모금액 증가 메서드
	// fundVO 에서 curSum 에 기부할 액수를 저장
	// sql문에서 curSum 만큼 증가시켜 기부액 반영
	public abstract void gibuMoney(FundVO fundVO);
	
	public abstract List<FundVO> getFundList(SearchOptionVO svo);

	public abstract String getPageNo(SearchOptionVO svo);

	public abstract int getTotalPostingCount(SearchOptionVO svo);

	public abstract void updateHit(String no);

	public void increaseCurSum(FundVO fundVO);

	public void writeComment(FundCommentVO fundCommentVO);

	public abstract List<FundCommentVO> getCommentList(String fundNo, String commentPage);

	public abstract int getTotalCommentCount(String fundNo);

	
	public int getTotalGibuAmount();
	
	public int getTotalGibuParticipants();
	
	public int getTotalGibuAmount(String year);
	
	public int getTotalGibuParticipants(String year);


	public abstract void savePhoto(FundPhotoVO fpvo);

	public abstract List<FundPhotoVO> getPhotoByNo(String no);

}
