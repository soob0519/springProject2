package com.muzigae.dto;

import lombok.Data;

@Data
public class DprodDto {

	 String item;
	 int rseqid;
	 String pname;
	 String color;
	 int price;
	 String rdate;
	 String filea="";
	 String fileb="";
	 String filec="";
	 
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
	
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}
	public String getFilea() {
		return filea;
	}
	public void setFilea(String filea) {
		this.filea = filea;
	}
	public String getFileb() {
		return fileb;
	}
	public void setFileb(String fileb) {
		this.fileb = fileb;
	}
	public String getFilec() {
		return filec;
	}
	public void setFilec(String filec) {
		this.filec = filec;
	}
	
	}
