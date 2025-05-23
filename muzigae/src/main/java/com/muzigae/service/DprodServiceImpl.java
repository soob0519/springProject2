package com.muzigae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muzigae.dto.DprodDto;
import com.muzigae.mapper.DprodMapper;

@Service
public class DprodServiceImpl implements DprodService {

	@Autowired
	DprodMapper mapper;

	@Override
	public List<?> selectProdTotalList(DprodDto dprodDto) throws Exception {
		return mapper.selectProdTotalList(dprodDto);
	}

	@Override
	public List<?> selectProdLipList(DprodDto dprodDto) throws Exception {
		return mapper.selectProdLipList(dprodDto);
	}

	@Override
	public List<?> selectProdEyeList(DprodDto dprodDto) throws Exception {
		return mapper.selectProdEyeList(dprodDto);
	}

	@Override
	public List<?> selectProdFaceList(DprodDto dprodDto) throws Exception {
		return mapper.selectProdFaceList(dprodDto);
	}

	@Override
	public DprodDto selectProdDetail(int rseqid) throws Exception {
		return mapper.selectProdDetail(rseqid);
	}

	@Override
	public List<?> selectProdColor(String pname) throws Exception {
		return mapper.selectProdColor(pname);
	}
	
}
