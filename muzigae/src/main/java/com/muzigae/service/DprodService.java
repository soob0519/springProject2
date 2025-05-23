package com.muzigae.service;

import java.util.List;

import com.muzigae.dto.DprodDto;

public interface DprodService {
	public List<?> selectProdList(DprodDto dto) throws Exception;
}
