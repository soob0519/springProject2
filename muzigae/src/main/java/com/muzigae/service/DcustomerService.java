package com.muzigae.service;

import com.muzigae.dto.DmanagerDto;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import com.muzigae.dto.DcustomerDto;

public interface DcustomerService {

	int selectMemeberUserid(String user_id) throws Exception;

	int insertMember(DcustomerDto dto) throws Exception;

	int selectMemberLoginCheck1(DcustomerDto dto) throws Exception;

	int dAdminInsert(DmanagerDto dto) throws Exception;

	int selectMemeberUserid2(String mng_id) throws Exception;

	int selectMemberLoginCheck2(DmanagerDto dto) throws Exception;
}
