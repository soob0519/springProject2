package com.muzigae.service;

import java.util.List;

import com.muzigae.dto.CateDto;
import com.muzigae.dto.DefaultDto;
import com.muzigae.dto.DprodDto;

public interface DproductsService {

	int insertDproducts(DprodDto dto) throws Exception;
	
	// 상품 정보 상세 보기
	DprodDto selectdproductsDetail(int rseqid) throws Exception;

	int dproductsUpdate(DprodDto dto) throws Exception;
	
	// 상품 목록 출력
	List<?> selectProductsList(DefaultDto dto) throws Exception;

	int selectdproductsPass(String pname, String pass1) throws Exception;

	void updatedproductsPass(String pname, String pass1) throws Exception;

	int deletedproductsEach(String datas) throws Exception;

	
	List<?> selectCategoryList() throws Exception;

	void updateCategoryOrd(CateDto dto) throws Exception;

	void insertCategory(CateDto dto) throws Exception;

	void updateCategoryOrd2(CateDto dto) throws Exception;

	int deleteCategory(CateDto dto) throws Exception;

	void updateCategory(CateDto dto) throws Exception;

	int updateCategoryOrd3(CateDto dto) throws Exception;

	
	
}
