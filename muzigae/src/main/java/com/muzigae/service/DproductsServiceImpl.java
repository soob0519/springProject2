package com.muzigae.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muzigae.dto.CateDto;
import com.muzigae.dto.DefaultDto;
import com.muzigae.dto.DprodDto;
import com.muzigae.mapper.DproductsMapper;

@Service
public class DproductsServiceImpl implements DproductsService {

	@Autowired
	DproductsMapper mapper;

	@Override
	public int insertDproducts(DprodDto dto) throws Exception {
		
		System.out.println("555555");
		return mapper.insertDproducts(dto);
	}
	
	@Override
	public int dproductsUpdate(DprodDto dto) {
		return mapper.dproductsUpdate(dto);
	}

	
	@Override
	public DprodDto selectdproductsDetail(int rseqid) throws Exception {
		return mapper.selectdproductsDetail(rseqid);
	}

	@Override
	public List<?> selectProductsList(DefaultDto dto) throws Exception {
		return mapper.selectProductsList(dto);
	}

	@Override
	public int selectdproductsPass(String pname, String pass1) throws Exception {
		return mapper.selectdproductsPass(pname, pass1);
	}


	@Override
	public int deletedproductsEach(String datas) throws Exception {
		return mapper.deletedproductsEach(datas);
	}


	@Override
	public List<?> selectCategoryList() throws Exception {
		return mapper.selectCategoryList();
	}

	@Override
	public int deleteCategory(CateDto dto) throws Exception {
		return mapper.deleteCategory(dto);
	}

	@Override
	public int updateCategoryOrd3(CateDto dto) throws Exception {
		return mapper.updateCategoryOrd3(dto);
	}

	@Override
	public void updatedproductsPass(String pname, String pass1) throws Exception {
		
		mapper.updatedproductsPass(pname,pass1);
	}

	@Override
	public void updateCategoryOrd(CateDto dto) throws Exception {
		
		mapper.updateCategoryOrd(dto);
	}

	@Override
	public void insertCategory(CateDto dto) throws Exception {
		
		mapper.insertCategory(dto);
	}

	@Override
	public void updateCategoryOrd2(CateDto dto) throws Exception {
		
		mapper.updateCategoryOrd2(dto);
	}

	@Override
	public void updateCategory(CateDto dto) throws Exception {
		
		mapper.updateCategory(dto);
	}
	
	
}
