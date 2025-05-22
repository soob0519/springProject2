package com.muzigae.dto;

import lombok.Data;

@Data
public class DpurchaseDto {
	int pseqid;
	int bseqid;
	String user_id;
	String name;
	String pdate;
	String item;
	int rseqid;
	String pname;
	String color;
	int price;
	int quan;
	int state;
	String use;
	int recode;
	String cdate;
	
	
	public int getPseqid() {
		return pseqid;
	}
	public void setPseqid(int pseqid) {
		this.pseqid = pseqid;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPdate() {
		return pdate;
	}
	public void setPdate(String pdate) {
		this.pdate = pdate;
	}
	public String getItem() {
		return item;
	}
	public void setItem(String item) {
		this.item = item;
	}
	public int getRseqid() {
		return rseqid;
	}
	public void setRseqid(int rseqid) {
		this.rseqid = rseqid;
	}
	public String getPname() {
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getQuan() {
		return quan;
	}
	public void setQuan(int quan) {
		this.quan = quan;
	}
	public int getState() {
		return state;
	}
	public void setState(int state) {
		this.state = state;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	public int getRecode() {
		return recode;
	}
	public void setRecode(int recode) {
		this.recode = recode;
	}
	public String getCdate() {
		return cdate;
	}
	public void setCdate(String cdate) {
		this.cdate = cdate;
	}
	
	
}
