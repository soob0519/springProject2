package com.muzigae.mapper;

import java.util.List;

import com.muzigae.dto.Dprod1Dto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface Dprod1Mapper {
	List<?> selectProdList(int rseqid);
 
	
}