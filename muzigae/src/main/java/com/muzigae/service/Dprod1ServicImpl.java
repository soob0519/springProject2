package com.muzigae.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.muzigae.dto.Dprod1Dto;
import com.muzigae.mapper.Dprod1Mapper;

@Service
public class Dprod1ServicImpl implements Dprod1Service{
	
	@Autowired
	Dprod1Mapper mapper;
	
 
	@Override
	public List<?> selectProdList(int rseqid) throws Exception {
		return mapper.selectProdList(rseqid);
	}
}
