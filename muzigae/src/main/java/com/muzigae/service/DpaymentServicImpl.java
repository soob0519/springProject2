package com.muzigae.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muzigae.dto.DpaymentDto;
import com.muzigae.dto.DprodDto;
import com.muzigae.mapper.DpaymentMapper;
import com.muzigae.mapper.DprodMapper;

@Service
public class DpaymentServicImpl implements DpaymentService{
	
	@Autowired
	DpaymentMapper mapper;
	
//	@Override
//	public List<?> selectProdList(DprodDto dto) throws Exception {
//		return mapper.selectProdList(dto);
//	}
	
	
	@Override
	public int insertPayment(DpaymentDto dto) throws Exception {
		
		return mapper.insertPayment(dto);
	}
	
}