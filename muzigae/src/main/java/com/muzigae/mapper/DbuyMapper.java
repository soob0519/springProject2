package com.muzigae.mapper;

import java.util.List;

import com.muzigae.dto.DbuyDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DbuyMapper {
	List<?> selectBuyList(DbuyDto dto);
	List<?> selectBuyList02(int seqid);
	DbuyDto selectBuy(int seqid);
	int insertBuy(DbuyDto dto);
}