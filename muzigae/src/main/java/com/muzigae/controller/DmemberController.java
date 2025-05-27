package com.muzigae.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.muzigae.dto.DcustomerDto;
import com.muzigae.service.DcustomerService;

import jakarta.servlet.http.HttpSession;


@Controller
public class DmemberController { 

	@Autowired
	DcustomerService dcustomerService;
	
	// 약관동의 화면
	@GetMapping("dmemberAgree")
	public String dmemberAgree() throws Exception {
	
		return "dmember/dmemberAgree";
	}
	
	// 회원 가입 화면
	@GetMapping("dmemberWrite")
	public String dmemberWrite() throws Exception {
	
		return "dmember/dmemberWrite";
	}
	
	// 관리자 가입 화면
		@GetMapping("adminWrite")
		public String adminWrite() throws Exception {
		
			return "dmember/adminWrite";
		}
	
	@PostMapping("dmemberInsert")
	@ResponseBody
	public String dmemberInsert(DcustomerDto dto) throws Exception {
		
		// 저장완료, 저장실패, 중복체크
		String msg = "1";
		// 아이디 중복체크
		int cnt = dcustomerService.selectMemeberUserid(dto.getUser_id());
		
		if(cnt > 0) {
			msg = "2";
		} else {
			// 저장 처리
			int result = dcustomerService.insertMember(dto);

			if( result == 0 ) msg = "3";
		}
		return msg;
	}
	
	@PostMapping("useridCheck")
	@ResponseBody
	public String useridCheck(String user_id) throws Exception {
		
		String msg = "1";
		// 첫 글자 영문자 / 특수문자(-_#) / 한글 허용 문제
		// 정규표현식 사용
		String pattern = "^[a-zA-Z]{1}[a-zA-Z0-9_\\-#]{5,11}";
		boolean result = user_id.matches(pattern);  // true or false
		
		if( result == false ) {
			msg = "2";
			// 중복 아이디 체크
			int cnt = dcustomerService.selectMemeberUserid(user_id);
			if( cnt > 0 ) msg = "3";
		}
		return msg;
	}
	
	
	
	// 로그인 화면
	@GetMapping("dlogin1")
	public String loginWrite() {
		
		return "dmember/dlogin1";
	}

	// 관리자 로그인 화면
	@GetMapping("dloginAdmin")
	public String dloginAdmin() throws Exception {
	
		return "dmember/dloginAdmin";
	}
	
	@PostMapping("loginConfirm1")
	@ResponseBody
	public String loginConfirm1( DcustomerDto dto
							   ,HttpSession session ) throws Exception {
		String msg = "1";
		// 아이디/암호 확인 작업
		int cnt = dcustomerService.selectMemberLoginCheck1(dto);
		if( cnt == 0 ) msg = "2";
		else {
			// 세션변수 생성
			session.setAttribute("SESSION_USERID",dto.getUser_id());
			// 세션변수 유지 기간(시간) 설정
			// 설정시간 : 초단위 설정 ; 무한대 설정 (-1);
			session.setMaxInactiveInterval(-1);	 
		}
		return msg;
	}
	
	@PostMapping("loginConfirm2")
	@ResponseBody
	public String loginConfirm2( DcustomerDto dto
							   ,HttpSession session ) throws Exception {
		String msg = "1";
		// 아이디/암호 확인 작업
		int cnt = dcustomerService.selectMemberLoginCheck2(dto);
		if( cnt == 0 ) msg = "2";
		else {
			// 세션변수 생성
			session.setAttribute("SESSION_USERID",dto.getUser_id());
			// 세션변수 유지 기간(시간) 설정
			// 설정시간 : 초단위 설정 ; 무한대 설정 (-1);
			session.setMaxInactiveInterval(-1);	 
		}
		return msg;
	}
	
	 @GetMapping("login/{user_id}")
	    public DcustomerDto getUser(@PathVariable String user_id) throws Exception {
	        return dcustomerService.findByUserId(user_id);
	   }
	 
	 @PostMapping("login")
	 public String login(@RequestParam String user_id,
	                     @RequestParam String pass,
	                     HttpSession session) throws Exception {

	     DcustomerDto user = dcustomerService.findByUserId(user_id);

	     if (user != null && user.getPass().equals(pass)) {
	         session.setAttribute("user_id", user_id); // 로그인 성공 시 세션 저장
	         return "redirect:/dloginAdmin";
	     }

	     return "redirect:/login";
	 }
	 
	 @GetMapping("/dmember/dloginAdmin")
	 public String dashboard(HttpSession session) {
	     Object user = session.getAttribute("user");

	     if (user == null) {
	         return "redirect:/dloginAdmin"; // 세션이 없으면 로그인 페이지로
	     }

	     // 세션이 있으면 대시보드 화면으로 이동
	     return "dAdminList";
	 }
	
	@PostMapping("logout")
	@ResponseBody
	public String logout(HttpSession session) {
		
		session.invalidate();  // 세션의 무효화; 전체 세션 삭제
		return "redirect:/dloginAdmin";
	}
	
	
	/*

	
	
	 */
	
	
}









