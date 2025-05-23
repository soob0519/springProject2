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
	String file1;
	String file2;
	String file3;
	
	
	
	public String getFile1() {
		return file1;
	}
	public void setFile1(String file1) {
		this.file1 = file1;
	}
	public String getFile2() {
		return file2;
	}
	public void setFile2(String file2) {
		this.file2 = file2;
	}
	public String getFile3() {
		return file3;
	}
	public void setFile3(String file3) {
		this.file3 = file3;
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
	public String getPrice() {
		return String.format("%,d", price); // "1,234,567"
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

	
	
	// 계산용
	public int getRawPrice() {
	    return price;
	}
	// 출력용
	public String getFormattedPrice() {
	    return String.format("%,d", price);
	}
	
}
