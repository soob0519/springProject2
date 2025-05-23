package com.muzigae.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.muzigae.dto.DprodDto;
import com.muzigae.mapper.DprodMapper;

@Service
public class DprodServicImpl implements DprodService{
	
	@Autowired
	DprodMapper mapper;
	
	@Override
	public List<?> selectProdList(DprodDto dto) throws Exception {
		return mapper.selectProdList(dto);
	}
}
