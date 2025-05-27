package com.muzigae.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.muzigae.dto.CateDto;
import com.muzigae.dto.DefaultDto;
import com.muzigae.dto.DprodDto;

@Mapper
public interface DproductsMapper {

	int insertDproducts(DprodDto dto);

	int dproductsUpdate(DprodDto dto);

	DprodDto selectdproductsDetail(String pname);

	List<?> selectProductsList(DefaultDto dto);

	int selectdproductsPass(String pname, String pass1);

	int deletedproductsEach(String datas);

	DprodDto selectdproductsDetail(int rseqid);

	List<?> selectCategoryList();

	int deleteCategory(CateDto dto);

	int updateCategoryOrd3(CateDto dto);

	void updatedproductsPass(String pname, String pass1);

	void updateCategoryOrd(CateDto dto);

	void insertCategory(CateDto dto);

	void updateCategoryOrd2(CateDto dto);

	void updateCategory(CateDto dto);
	


}
