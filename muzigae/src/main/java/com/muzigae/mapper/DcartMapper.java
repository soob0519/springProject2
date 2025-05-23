package com.muzigae.mapper;

import java.util.List;

import com.muzigae.dto.DcartDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DcartMapper {
	List<?> selectCartList(DcartDto dto);
}
