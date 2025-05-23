package com.muzigae.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.muzigae.dto.DcartDto;
import com.muzigae.mapper.DcartMapper;

@Service
public class DcartServicImpl implements DcartService{
	
	@Autowired
	DcartMapper mapper;
	
	@Override
	public List<?> selectCartList(DcartDto dto) throws Exception {
		return mapper.selectCartList(dto);
	}
}
