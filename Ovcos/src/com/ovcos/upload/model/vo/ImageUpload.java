package com.ovcos.upload.model.vo;

public class ImageUpload {
	private String uplId;
	private int uplMenu; // 대회1/챌린지2/프로필3/배경이미지4
	private int uplNo;
	private String originName;
	private String changeName;
	private String verStatus;
	private String delStatus;
	
	
	public ImageUpload() {} // 기본생성자
	
	public ImageUpload(String uplId, int uplMenu, int uplNo, String originName, String changeName, String verStatus,
			String delStatus) {
		super();
		this.uplId = uplId;
		this.uplMenu = uplMenu;
		this.uplNo = uplNo;
		this.originName = originName;
		this.changeName = changeName;
		this.verStatus = verStatus;
		this.delStatus = delStatus;
	}
	
	
	
	public String getUplId() {
		return uplId;
	}
	public void setUplId(String uplId) {
		this.uplId = uplId;
	}
	public int getUplMenu() {
		return uplMenu;
	}
	public void setUplMenu(int uplMenu) {
		this.uplMenu = uplMenu;
	}
	public int getUplNo() {
		return uplNo;
	}
	public void setUplNo(int uplNo) {
		this.uplNo = uplNo;
	}
	public String getOriginName() {
		return originName;
	}
	public void setOriginName(String originName) {
		this.originName = originName;
	}
	public String getChangeName() {
		return changeName;
	}
	public void setChangeName(String changeName) {
		this.changeName = changeName;
	}
	public String getVerStatus() {
		return verStatus;
	}
	public void setVerStatus(String verStatus) {
		this.verStatus = verStatus;
	}
	public String getDelStatus() {
		return delStatus;
	}
	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}
	
	
	@Override
	public String toString() {
		return "ImageUpload [uplId=" + uplId + ", uplMenu=" + uplMenu + ", uplNo=" + uplNo + ", originName="
				+ originName + ", changeName=" + changeName + ", verStatus=" + verStatus + ", delStatus=" + delStatus
				+ "]";
	}
	
	
	
	
	
		
	
	
}
