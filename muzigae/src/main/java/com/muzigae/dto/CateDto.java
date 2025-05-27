package com.muzigae.dto;

import lombok.Data;

@Data
public class CateDto {
	int code;
	String name;
	int ord;
	String use;
	
	int cate_code;
	String cate_name;
	String cate_old_name;
	int cate_ord;
	int cate_old_ord;
	String cate_use;

	public int getCate_code() {
		return cate_code;
	}
	public void setCate_code(int cate_code) {
		this.cate_code = cate_code;
	}
	public String getCate_name() {
		return cate_name;
	}
	public void setCate_name(String cate_name) {
		this.cate_name = cate_name;
	}
	public String getCate_old_name() {
		return cate_old_name;
	}
	public void setCate_old_name(String cate_old_name) {
		this.cate_old_name = cate_old_name;
	}
	public int getCate_ord() {
		return cate_ord;
	}
	public void setCate_ord(int cate_ord) {
		this.cate_ord = cate_ord;
	}
	public int getCate_old_ord() {
		return cate_old_ord;
	}
	public void setCate_old_ord(int cate_old_ord) {
		this.cate_old_ord = cate_old_ord;
	}
	public String getCate_use() {
		return cate_use;
	}
	public void setCate_use(String cate_use) {
		this.cate_use = cate_use;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getOrd() {
		return ord;
	}
	public void setOrd(int ord) {
		this.ord = ord;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
}
