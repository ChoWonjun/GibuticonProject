package org.kosta.gibuticon.model.fund;

import java.sql.Date;

public class FundVO {
	private String fundNo;
	private String fundName;
	private String proposal;
	private String homepage;
	private String curSum;
	private String goalSum;
	private String participantCount;
	private Date dueDate;
	private String content;
	private int hits;

	public FundVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getFundNo() {
		return fundNo;
	}

	public void setFundNo(String fundNo) {
		this.fundNo = fundNo;
	}

	public String getFundName() {
		return fundName;
	}

	public void setFundName(String fundName) {
		this.fundName = fundName;
	}

	public String getProposal() {
		return proposal;
	}

	public void setProposal(String proposal) {
		this.proposal = proposal;
	}

	public String getHomepage() {
		return homepage;
	}

	public void setHomepage(String homepage) {
		this.homepage = homepage;
	}

	public String getCurSum() {
		return curSum;
	}

	public void setCurSum(String curSum) {
		this.curSum = curSum;
	}

	public String getGoalSum() {
		return goalSum;
	}

	public void setGoalSum(String goalSum) {
		this.goalSum = goalSum;
	}

	public String getParticipantCount() {
		return participantCount;
	}

	public void setParticipantCount(String participantCount) {
		this.participantCount = participantCount;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getHits() {
		return hits;
	}

	public void setHits(int hits) {
		this.hits = hits;
	}

	@Override
	public String toString() {
		return "FundVO [fundNo=" + fundNo + ", fundName=" + fundName
				+ ", proposal=" + proposal + ", homepage=" + homepage
				+ ", curSum=" + curSum + ", goalSum=" + goalSum
				+ ", participantCount=" + participantCount + ", dueDate="
				+ dueDate + ", content=" + content + ", hits=" + hits + "]";
	}
}
