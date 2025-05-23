package com.muzigae.controller;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.muzigae.dto.DbuyDto;
import com.muzigae.dto.DcustomerDto;
import com.muzigae.dto.DpaymentDto;
import com.muzigae.dto.DpurchaseDto;
import com.muzigae.service.PclistService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PclistController {
	
	@Autowired
	PclistService pclistService;
	
	@GetMapping("fullList")
	public String selectFullList(DbuyDto dto
									,ModelMap model
									,HttpSession session) throws Exception {
		// 세션에서 로그인된 사용자 정보 가져오기 (예: "USER_ID"가 세션에 저장되어 있다고 가정)
	    String user_id = (String) session.getAttribute("USER_ID");
	    if(user_id != null) {
	    	// model.addAttribute("alertMessage", "로그인이 필요합니다.");
	        // return "redirect:/login";
	    	user_id = "test1";
	    } else {
	    	user_id = "test1";
	    }
	    user_id = "test1";
	    
	    dto.setUser_id(user_id);
		// 기존 목록 조회
		List<?> list = pclistService.selectFullList(dto);		
        model.addAttribute("fullList", list);
        
		return "pclist/fullList";
	}
	
	@GetMapping("buyList")
	public String selectBuyList(DbuyDto dto
								,ModelMap model
								,HttpSession session) throws Exception {
		// 세션에서 로그인된 사용자 정보 가져오기 (예: "USER_ID"가 세션에 저장되어 있다고 가정)
	    String user_id = (String) session.getAttribute("USER_ID");
	    if(user_id != null) {
	    	// model.addAttribute("alertMessage", "로그인이 필요합니다.");
	        // return "redirect:/login";
	    	user_id = "test1";
	    } else {
	    	user_id = "test1";
	    }
	    user_id = "test1";
	    
	    dto.setUser_id(user_id);
		// 기존 목록 조회
		List<?> buyList = pclistService.selectBuyList(dto);		
        model.addAttribute("buyList", buyList);
        
		return "pclist/buyList";
	}
	
	@GetMapping("cancelList")
	public String selectCancelList(DbuyDto dto
									,ModelMap model
									,HttpSession session) throws Exception {
		// 세션에서 로그인된 사용자 정보 가져오기 (예: "USER_ID"가 세션에 저장되어 있다고 가정)
	    String user_id = (String) session.getAttribute("USER_ID");
	    if(user_id != null) {
	    	// model.addAttribute("alertMessage", "로그인이 필요합니다.");
	        // return "redirect:/login";
	    	user_id = "test1";
	    } else {
	    	user_id = "test1";
	    }
	    user_id = "test1";
	    
	    dto.setUser_id(user_id);
		// 기존 목록 조회
		List<?> cancleList = pclistService.selectCancelList(dto);		
        model.addAttribute("cancleList", cancleList);
        
		return "pclist/cancelList";
	}		
	
	@GetMapping("pcDetail/{bseqid}")
	public String selectPcDetail(@PathVariable int bseqid
												,ModelMap model
												,HttpSession session) throws Exception {
	    // 세션에서 로그인된 사용자 정보 가져오기 (예: "USER_ID"가 세션에 저장되어 있다고 가정)
	    String user_id = (String) session.getAttribute("USER_ID");
	    if(user_id != null) {
	    	// model.addAttribute("alertMessage", "로그인이 필요합니다.");
	        // return "redirect:/login";
	    	user_id = "test1";
	    } else {
	    	user_id = "test1";
	    }
	    user_id = "test1";
	    
	    // 잘못된 접근 처리
	    if (bseqid <= 0) {
	        return "redirect:/fullList";
	    }
	    
	    // 구매목록 정보
	    List<DpurchaseDto> pdtoList = pclistService.selectPcDetail(bseqid);
	    // 주문목록 정보
	    DbuyDto dbuyDto = pclistService.selectdbuyDetail(bseqid);
	    // 사용자정보
	    DcustomerDto dcustomerDto = pclistService.selectDcustomerDetail(user_id);
	    // 결제정보
	    DpaymentDto dpaymentDto = pclistService.selectDpaymentDetail(bseqid);
	    
	    model.addAttribute("pdtoList", pdtoList);
	    model.addAttribute("dbuyDto", dbuyDto);
	    model.addAttribute("dcustomerDto", dcustomerDto);
	    model.addAttribute("dpaymentDto", dpaymentDto);
	    
	    return "pclist/pcDetail";
	}
	
	// 잘못된 접근 처리
	@GetMapping("pcDetail")
	public String pcDetailCheck() {
		// 나중에 홈페이지로 변경하기
	    return "redirect:/fullList";
	}
	

	@PostMapping("/updateAddr")
	@ResponseBody
	public String updateAddr(String newAddr,int bseqid) throws Exception {
		String msg ="ok";
		
		int result = pclistService.updateAddr(newAddr,bseqid);
		if(result == 0)	msg ="fail";
		
		return msg;
	}
	
	
	@GetMapping("canRequest/{bseqid}")
	public String canRequest(@PathVariable int bseqid
										,ModelMap model
										,HttpSession session) throws Exception {
		// 세션에서 로그인된 사용자 정보 가져오기 (예: "USER_ID"가 세션에 저장되어 있다고 가정)
	    String user_id = (String) session.getAttribute("USER_ID");
	    if(user_id != null) {
	    	// model.addAttribute("alertMessage", "로그인이 필요합니다.");
	        // return "redirect:/login";
	    	user_id = "test1";
	    } else {
	    	user_id = "test1";
	    }
	    user_id = "test1";
	    
	    // 잘못된 접근 처리
	    // 나중에 홈페이지로 변경하기
	    if (bseqid <= 0) {
	        return "redirect:/fullList";
	    }
	    
	 // 구매목록 정보
	    List<DpurchaseDto> pdtoList = pclistService.selectPcDetail(bseqid);
	    // 주문목록 정보
	    DbuyDto dbuyDto = pclistService.selectdbuyDetail(bseqid);
	    // 사용자정보
	    DcustomerDto dcustomerDto = pclistService.selectDcustomerDetail(user_id);
	    // 결제정보
	    DpaymentDto dpaymentDto = pclistService.selectDpaymentDetail(bseqid);
	    
	    model.addAttribute("pdtoList", pdtoList);
	    model.addAttribute("dbuyDto", dbuyDto);
	    model.addAttribute("dcustomerDto", dcustomerDto);
	    model.addAttribute("dpaymentDto", dpaymentDto);
	    
		return "pclist/canRequest";
	}
	
	// 잘못된 접근 처리
	@GetMapping("canRequest")
	public String canRequestChcek() {
		// 나중에 홈페이지로 변경하기
	    return "redirect:/fullList";
	}
	
	@PostMapping("/cancleEach")
	@ResponseBody
	public String cancelEach(String datas
								,int recode
								,int bseqid) throws Exception {
		String msg ="ok";
		// 1002,1003,
		datas = datas.substring(0,datas.length()-1);
		//System.out.println("datas====================="+datas);
		
		int result = pclistService.cancelEach(datas,recode);
		if(result == 0) {
			msg ="fail";
		} else {
			int res =  pclistService.updateDbuyCancel(bseqid);
			if(res == 0) msg ="fail";
		}
		return msg;
	}
	
		
		
	
}
