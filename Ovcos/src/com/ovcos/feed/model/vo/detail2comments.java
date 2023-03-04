package com.ovcos.feed.model.vo;

import java.sql.Date;

public class detail2comments {

	  private int 	 feed_cmn_no;
	  private String feed_cmn_id;
	  private String feed_cmn_cnt;
	  private String feed_cmn_date;
	  private int    feed_index;
	  
	  
	  public detail2comments() {}


	public detail2comments(int feed_cmn_no, String feed_cmn_id, String feed_cmn_cnt, String feed_cmn_date,
			int feed_index) {
		super();
		this.feed_cmn_no = feed_cmn_no;
		this.feed_cmn_id = feed_cmn_id;
		this.feed_cmn_cnt = feed_cmn_cnt;
		this.feed_cmn_date = feed_cmn_date;
		this.feed_index = feed_index;
	}
	

	public detail2comments(int feed_cmn_no, String feed_cmn_id, String feed_cmn_cnt, String feed_cmn_date) {
		super();
		this.feed_cmn_no = feed_cmn_no;
		this.feed_cmn_id = feed_cmn_id;
		this.feed_cmn_cnt = feed_cmn_cnt;
		this.feed_cmn_date = feed_cmn_date;
	}


	public int getFeed_cmn_no() {
		return feed_cmn_no;
	}


	public void setFeed_cmn_no(int feed_cmn_no) {
		this.feed_cmn_no = feed_cmn_no;
	}


	public String getFeed_cmn_id() {
		return feed_cmn_id;
	}


	public void setFeed_cmn_id(String feed_cmn_id) {
		this.feed_cmn_id = feed_cmn_id;
	}


	public String getFeed_cmn_cnt() {
		return feed_cmn_cnt;
	}


	public void setFeed_cmn_cnt(String feed_cmn_cnt) {
		this.feed_cmn_cnt = feed_cmn_cnt;
	}


	public String getFeed_cmn_date() {
		return feed_cmn_date;
	}


	public void setFeed_cmn_date(String feed_cmn_date) {
		this.feed_cmn_date = feed_cmn_date;
	}


	public int getFeed_index() {
		return feed_index;
	}


	public void setFeed_index(int feed_index) {
		this.feed_index = feed_index;
	}


	@Override
	public String toString() {
		return "detail2comments [feed_cmn_no=" + feed_cmn_no + ", feed_cmn_id=" + feed_cmn_id + ", feed_cmn_cnt="
				+ feed_cmn_cnt + ", feed_cmn_date=" + feed_cmn_date + ", feed_index=" + feed_index + "]";
	}
	  
	  
	  
	  
	  
}
