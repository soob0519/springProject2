package com.muzigae.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.muzigae.dto.DcustomerDto;
import com.muzigae.dto.DmanagerDto;


@Mapper
public interface DmemberMapper {

	// 중복 아이디 체크
	int selectMemeberUserid(String user_id);

	// 저장처리
	int insertMember(DcustomerDto dto);

	// 아이디/암호 확인 작업
	int selectMemberLoginCheck1(DcustomerDto dto);

	int selectMemberLoginCheck2(DcustomerDto dto);

	int dAdminInsert(DmanagerDto dto);

	int selectMemeberUserid2(String mng_id);

	int selectMemberLoginCheck2(DmanagerDto dto);

	

}
