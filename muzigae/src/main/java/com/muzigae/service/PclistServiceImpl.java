package com.muzigae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muzigae.dto.DbuyDto;
import com.muzigae.dto.DcustomerDto;
import com.muzigae.dto.DpaymentDto;
import com.muzigae.dto.DpurchaseDto;
import com.muzigae.mapper.PclistMapper;

@Service
public class PclistServiceImpl implements PclistService {
	
	@Autowired
	PclistMapper mapper;

	@Override
	public List<?> selectFullList(DbuyDto dto) throws Exception {
		return mapper.selectFullList(dto);
	}

	@Override
	public List<DpurchaseDto> selectPcDetail(int bseqid) throws Exception {
		return mapper.selectPcDetail(bseqid);
	}

	@Override
	public DbuyDto selectdbuyDetail(int bseqid) throws Exception {
		return mapper.selectdbuyDetail(bseqid);
	}
	
	@Override
	public int updateAddr(String newAddr, int bseqid) throws Exception {
		return mapper.updateAddr(newAddr,bseqid);
	}

	@Override
	public DcustomerDto selectDcustomerDetail(String user_id) throws Exception {
		return mapper.selectDcustomerDetail(user_id);
	}

	@Override
	public DpaymentDto selectDpaymentDetail(int bseqid) throws Exception {
		return mapper.selectDpaymentDetail(bseqid);
	}

	@Override
	public List<?> selectBuyList(DbuyDto dto) throws Exception {
		return mapper.selectBuyList(dto);
	}
	
	@Override
	public List<?> selectCancelList(DbuyDto dto) throws Exception {
		return mapper.selectCancelList(dto);
	}

	@Override
	public int cancelEach(String datas, int recode) {
		return mapper.cancelEach(datas,recode);
	}

	@Override
	public int updateDbuyCancel(int bseqid) {
		return mapper.updateDbuyCancel(bseqid);
	}


}
