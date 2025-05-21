package com.muzigae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muzigae.dto.DbuyDto;
import com.muzigae.mapper.PclistMapper;

@Service
public class PclistServiceImpl implements PclistService {
	
	@Autowired
	PclistMapper mapper;

	@Override
	public List<?> selectFullList(DbuyDto dto) throws Exception {
		return mapper.selectFullList(dto);
	}

	
	
	
}
