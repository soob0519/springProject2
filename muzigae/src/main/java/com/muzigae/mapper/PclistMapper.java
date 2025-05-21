package com.muzigae.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.muzigae.dto.DbuyDto;

@Mapper
public interface PclistMapper {

	List<?> selectFullList(DbuyDto dto);

}
