package org.kosta.gibuticon.model.fund;

public class FundPhotoVO {
	private String photoNo;
	private String orgName;
	private String realName;
	private String fundNo;

	public FundPhotoVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public FundPhotoVO(String orgName, String realName, String fundNo) {
		super();
		this.orgName = orgName;
		this.realName = realName;
		this.fundNo = fundNo;
	}

	public FundPhotoVO(String photoNo, String orgName, String realName, String fundNo) {
		super();
		this.photoNo = photoNo;
		this.orgName = orgName;
		this.realName = realName;
		this.fundNo = fundNo;
	}

	public String getPhotoNo() {
		return photoNo;
	}

	public void setPhotoNo(String photoNo) {
		this.photoNo = photoNo;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getRealName() {
		return realName;
	}

	public void setRealName(String realName) {
		this.realName = realName;
	}

	public String getFundNo() {
		return fundNo;
	}

	public void setFundNo(String fundNo) {
		this.fundNo = fundNo;
	}

	@Override
	public String toString() {
		return "FundPhotoVO [photoNo=" + photoNo + ", orgName=" + orgName
				+ ", realName=" + realName + ", fundNo=" + fundNo + "]";
	}

}
