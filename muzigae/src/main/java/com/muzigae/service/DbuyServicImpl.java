package com.muzigae.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.muzigae.dto.DbuyDto;
import com.muzigae.mapper.DbuyMapper;

@Service
public class DbuyServicImpl implements DbuyService{
	
	@Autowired
	DbuyMapper mapper;
	
	@Override
	public List<?> selectBuyList(DbuyDto dto) throws Exception {
		return mapper.selectBuyList(dto);
	}
	
	@Override
	public DbuyDto selectBuy(int bseqid) throws Exception {
		return mapper.selectBuy(bseqid);
	}
}
