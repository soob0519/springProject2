package com.muzigae.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.muzigae.dto.DcustomerDto;
import com.muzigae.dto.DmanagerDto;
import com.muzigae.mapper.DmemberMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Service
public class DcustomerServiceImpl implements DcustomerService {

	@Autowired
	DmemberMapper mapper;

	@Override
	public int selectMemeberUserid(String user_id) throws Exception {
		
		return mapper.selectMemeberUserid(user_id);
	}

	
	 
	@Override
	public int insertMember(DcustomerDto dto) throws Exception {
		
		return mapper.insertMember(dto);
	}

	@Override
	public int selectMemberLoginCheck1(DcustomerDto dto) throws Exception {
		return mapper.selectMemberLoginCheck1(dto);
	}


	@Override
	public int dAdminInsert(DmanagerDto dto) throws Exception {
		return mapper.dAdminInsert(dto);
	}



	@Override
	public int selectMemeberUserid2(String mng_id) throws Exception {
		return mapper.selectMemeberUserid2(mng_id);
	}



	@Override
	public int selectMemberLoginCheck2(DmanagerDto dto) throws Exception {
		return mapper.selectMemberLoginCheck2(dto);
	}


	
}
