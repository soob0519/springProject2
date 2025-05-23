package com.muzigae.mapper;

import java.util.List;

import com.muzigae.dto.DprodDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DprodMapper {
	List<?> selectProdList(DprodDto dto);
}