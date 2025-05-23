package com.muzigae.service;

import java.util.List;

import com.muzigae.dto.DbuyDto;
 

public interface DbuyService {
	public List<?> selectBuyList(DbuyDto dto) throws Exception;
	public DbuyDto selectBuy(int bseqid) throws Exception;
}

 

 