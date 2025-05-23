package com.muzigae.service;

import java.util.List;

import com.muzigae.dto.DprodDto;

public interface DprodService {

	/**
	 * total 리스트 출력
	 */
	List<?> selectProdTotalList(DprodDto dprodDto) throws Exception;
	
	/**
	 * lip 리스트 출력
	 */
	List<?> selectProdLipList(DprodDto dprodDto) throws Exception;

	/**
	 * eye 리스트 출력
	 */
	List<?> selectProdEyeList(DprodDto dprodDto) throws Exception;

	/**
	 * face 리스트 출력
	 */
	List<?> selectProdFaceList(DprodDto dprodDto) throws Exception;

	/**
	 * 제품 상세페이지
	 */
	DprodDto selectProdDetail(int rseqid) throws Exception;

	/**
	 * 옵션선택
	 */
	List<?> selectProdColor(String pname) throws Exception;

}
