package com.muzigae.mapper;

import java.util.List;

import com.muzigae.dto.DbuyDto;
import com.muzigae.dto.DpaymentDto;
import com.muzigae.dto.DpurchaseDto;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DpurchaseMapper {
 
	int insertPurchase(DpurchaseDto dto);
}

