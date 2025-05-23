package com.muzigae.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.muzigae.dto.DbuyDto;
import com.muzigae.dto.DcustomerDto;
import com.muzigae.dto.DpaymentDto;
import com.muzigae.dto.DpurchaseDto;

@Mapper
public interface PclistMapper {

	List<?> selectFullList(DbuyDto dto);

	List<DpurchaseDto> selectPcDetail(int bseqid);

	DbuyDto selectdbuyDetail(int bseqid);

	int updateAddr(String newAddr, int bseqid);
	
	DcustomerDto selectDcustomerDetail(String user_id);

	DpaymentDto selectDpaymentDetail(int bseqid);
	
	List<?> selectBuyList(DbuyDto dto);

	List<?> selectCancelList(DbuyDto dto);

	int cancelEach(String datas, int recode);

	int updateDbuyCancel(int bseqid);



}
