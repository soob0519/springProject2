package com.muzigae.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.muzigae.dto.DbuyDto;
import com.muzigae.dto.DpaymentDto;
import com.muzigae.dto.DpurchaseDto;
import com.muzigae.mapper.DbuyMapper;
import com.muzigae.mapper.DpurchaseMapper;

@Service
public class DpurchaseServicImpl implements DpurchaseService{
	
	@Autowired
	DpurchaseMapper mapper;
 
	
	@Override
	public int insertPurchase(DpurchaseDto dto) throws Exception {
		
		return mapper.insertPurchase(dto);
	}
}
