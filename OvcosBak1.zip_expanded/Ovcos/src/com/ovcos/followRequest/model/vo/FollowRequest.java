package com.ovcos.followRequest.model.vo;

public class FollowRequest {

	 private String memId;
	 private String reponseId;
	 private String requestStatus;
	 private String memName;
	 private String memIntro;
	 private String memNick;
	 
	 public FollowRequest() {}
	 
	 

	public FollowRequest(String memId, String reponseId, String requestStatus, String memName, String memIntro,
			String memNick) {
		super();
		this.memId = memId;
		this.reponseId = reponseId;
		this.requestStatus = requestStatus;
		this.memName = memName;
		this.memIntro = memIntro;
		this.memNick = memNick;
	}



	public FollowRequest(String memId, String reponseId, String requestStatus) {
		super();
		this.memId = memId;
		this.reponseId = reponseId;
		this.requestStatus = requestStatus;
	}

	
	
	
	public FollowRequest(String memId, String memName, String memIntro, String memNick) {
		super();
		this.memId = memId;
		this.memName = memName;
		this.memIntro = memIntro;
		this.memNick = memNick;
	}



	public FollowRequest(String memId) {
		super();
		this.memId = memId;
	}

	
	
	
	




	public String getmemId() {
		return memId;
	}

	public void setmemId(String memId) {
		this.memId = memId;
	}

	public String getReponseId() {
		return reponseId;
	}

	public void setReponseId(String reponseId) {
		this.reponseId = reponseId;
	}

	public String getRequestStatus() {
		return requestStatus;
	}

	public void setRequestStatus(String requestStatus) {
		this.requestStatus = requestStatus;
	}

	@Override
	public String toString() {
		return "FollowRequest [memId=" + memId + ", reponseId=" + reponseId + ", requestStatus=" + requestStatus
				+ "]";
	}
	 
	 
	 
	 
	 
}
