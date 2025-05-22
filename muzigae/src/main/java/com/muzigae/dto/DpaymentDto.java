package com.muzigae.dto;

public class DpaymentDto {
	
	int payseqid;
	int bseqid;
	String user_id;
	String pdate;
	int price;
	int paystate;
	int paymet;
	
	
	public int getPayseqid() {
		return payseqid;
	}
	public void setPayseqid(int payseqid) {
		this.payseqid = payseqid;
	}
	public int getBseqid() {
		return bseqid;
	}
	public void setBseqid(int bseqid) {
		this.bseqid = bseqid;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPaystate() {
		return paystate;
	}
	public void setPaystate(int paystate) {
		this.paystate = paystate;
	}
	public int getPaymet() {
		return paymet;
	}
	public void setPaymet(int paymet) {
		this.paymet = paymet;
	}
	
	
	
}
