package com.muzigae.service;

import java.util.List;

import com.muzigae.dto.DbuyDto;
import com.muzigae.dto.DcustomerDto;
import com.muzigae.dto.DpaymentDto;
import com.muzigae.dto.DpurchaseDto;

public interface PclistService {
	/**
	 * 주문목록 전체 리스트
	 */
	List<?> selectFullList(DbuyDto dto) throws Exception;
	/**
	 * 구매 상세내역
	 */
	List<DpurchaseDto> selectPcDetail(int bseqid) throws Exception;
	/**
	 * 구매 상세내역 - 주문목록 관련
	 */
	DbuyDto selectdbuyDetail(int bseqid) throws Exception;
	/**
	 * 구매 상세내역 - 배송지변경
	 */
	int updateAddr(String newAddr, int bseqid) throws Exception;
	/**
	 * 고객정보
	 */
	DcustomerDto selectDcustomerDetail(String user_id) throws Exception;
	/**
	 * 결제정보
	 */
	DpaymentDto selectDpaymentDetail(int bseqid) throws Exception;
	/**
	 * 주문목록 구매 리스트
	 */
	List<?> selectBuyList(DbuyDto dto) throws Exception;
	/**
	 * 주문목록 취소 리스트
	 */
	List<?> selectCancelList(DbuyDto dto) throws Exception;
	/**
	 * 구매목록 취소 업데이트
	 */
	int cancelEach(String datas, int recode) throws Exception;
	/**
	 * 구매목록 취소 업데이트
	 */
	int updateDbuyCancel(int bseqid) throws Exception;
	
	
	
	
}
