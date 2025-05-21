package com.muzigae.service;

import java.util.List;

import com.muzigae.dto.DbuyDto;

public interface PclistService {

	List<?> selectFullList(DbuyDto dto) throws Exception;

}
