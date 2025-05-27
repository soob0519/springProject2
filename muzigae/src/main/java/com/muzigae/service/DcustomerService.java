package com.muzigae.service;

import com.muzigae.dto.DmanagerDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.muzigae.dto.DcustomerDto;

public interface DcustomerService {

	int selectMemeberUserid(String user_id) throws Exception;

	int insertMember(DcustomerDto dto) throws Exception;

	int selectMemberLoginCheck1(DcustomerDto dto) throws Exception;

	int selectMemberLoginCheck2(DcustomerDto dto) throws Exception;

	DcustomerDto findByUserId(String user_id) throws Exception;

}
