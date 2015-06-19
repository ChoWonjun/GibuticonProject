package org.kosta.gibuticon.model.fund;

import java.sql.Date;
import java.util.List;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.web.multipart.MultipartFile;

public class FundVO {
	private String fundNo;
	@NotEmpty
	private String fundName;
	@NotEmpty
	private String proposal;
	@NotEmpty
	private String homepage;
	@NotEmpty
	private String curSum;
	private String goalSum;
	private String participant;
	private Date startDate;
	private Date dueDate;
	private String content;
	private int hits;
	private List<MultipartFile> file;
	private List<FundPhotoVO> photoList;

	public FundVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
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

	public String getParticipant() {
		return participant;
	}

	public void setParticipant(String participant) {
		this.participant = participant;
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

	public List<MultipartFile> getFile() {
		return file;
	}

	public void setFile(List<MultipartFile> file) {
		this.file = file;
	}

	public List<FundPhotoVO> getPhotoList() {
		return photoList;
	}

	public void setPhotoList(List<FundPhotoVO> photoList) {
		this.photoList = photoList;
	}

	@Override
	public String toString() {
		return "FundVO [fundNo=" + fundNo + ", fundName=" + fundName
				+ ", proposal=" + proposal + ", homepage=" + homepage
				+ ", curSum=" + curSum + ", goalSum=" + goalSum
				+ ", participant=" + participant + ", startDate=" + startDate
				+ ", dueDate=" + dueDate + ", content=" + content + ", hits="
				+ hits + "]";
	}


}