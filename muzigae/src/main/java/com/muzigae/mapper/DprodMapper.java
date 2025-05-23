package com.muzigae.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.muzigae.dto.DprodDto;

@Mapper
public interface DprodMapper {

	List<?> selectProdTotalList(DprodDto dprodDto);

	List<?> selectProdLipList(DprodDto dprodDto);

	List<?> selectProdEyeList(DprodDto dprodDto);

	List<?> selectProdFaceList(DprodDto dprodDto);

	DprodDto selectProdDetail(int rseqid);

	List<?> selectProdColor(String pname);

}
