package org.kosta.gibuticon.model.member;

public class MemberRankVO {
	private String rank;
	private String memberId;
	private String rankVal;
	public MemberRankVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public String getRank() {
		return rank;
	}
	public void setRank(String rank) {
		this.rank = rank;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	
	public String getRankVal() {
		return rankVal;
	}
	public void setRankVal(String rankVal) {
		this.rankVal = rankVal;
	}
	@Override
	public String toString() {
		return "MemberRankVO [rank=" + rank + ", memberId=" + memberId
				+ ", rankVal=" + rankVal + "]";
	}
	
	
	
	
}
