package com.muzigae.mapper;

import java.util.List;

import com.muzigae.dto.DbuyDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DbuyMapper {
	List<?> selectBuyList(DbuyDto dto);
	DbuyDto selectBuy(int seqid);
}