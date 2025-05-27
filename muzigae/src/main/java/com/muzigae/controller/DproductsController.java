package com.muzigae.controller;

import java.io.File;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.muzigae.dto.DefaultDto;
import com.muzigae.dto.DprodDto;
import com.muzigae.service.DproductsService;
import com.muzigae.dto.CateDto;

import jakarta.servlet.http.HttpSession;


@Controller
public class DproductsController {
	
	public static String dirPath1 = "C:/Users/hi_guri/git/muzigae/src/main/webapp/images";
	public static String dirPath2 = "C:/Users/hi_guri/git/muzigae/src/main/webapp/images";

	@Autowired
	DproductsService dproductsService;
	
	// 상품 등록 화면
	@GetMapping("dproductsWrite")
	public String dproductWrite(ModelMap model) throws Exception {

		List<?> list = dproductsService.selectCategoryList();
		model.addAttribute("resultList", list);
		return "dproducts/dproductsWrite";
	}
	
	@PostMapping("dproductsInput")
	@ResponseBody
	public String dproductInput(MultipartHttpServletRequest request
							 ,DprodDto dto ) 
											throws Exception {
		String message = "ok";
		Map map = request.getFileMap();
		Iterator it = map.entrySet().iterator();
		int cnt = 1;
		while( it.hasNext() ) { 
			
			Entry entry = (Entry) it.next();
		
			MultipartFile file = (MultipartFile)entry.getValue();
			
			System.out.println("111111");
			if( file.getSize() > 0 ) {

				String filename = System.currentTimeMillis()+"-"+cnt;
				// abc.jpg -> f2[0] = "abc"; f2[1] = "jpg";
				String f1   = file.getOriginalFilename();
				String[] f2 = f1.split("\\.");
				
				String exe  = f2[f2.length-1];  // 예 jpg 또는 JPG
				exe = exe.toLowerCase();        // 소문자 전환
				
				filename += "."+exe;
				
				if( !exe.equals("gif")  && 
					!exe.equals("jpg")  &&
					!exe.equals("jpeg") &&
					!exe.equals("png") ) 
				{
					    
				} else { 
					
					String boxname = file.getName();
					
					String filepath = dirPath1+"/"+filename;
					if(boxname.equals("filec")) {
						filepath = dirPath2+"/"+filename;
					}
	
					file.transferTo(new File(filepath));
					
					if( boxname.equals("filea1") ) {
						dto.setFile1(filename);
					} else if( boxname.equals("fileb1") ) {
						dto.setFile2(filename);
					} else if( boxname.equals("filec1") ) {
						dto.setFile3(filename);
					} 
				}
			}
			cnt++;
		}

		int result = dproductsService.insertDproducts(dto);
		if( result == 0 ) message = "fail";
		
		return message;
	}
	
	 @GetMapping("dproductsModify/{rseqid}")
		public String dproductsModify( @PathVariable int rseqid,
										DprodDto dto1
								   ,HttpSession session
								   ,ModelMap model) throws Exception {
			
		 
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
		      
		       // 물품 정보
		       DprodDto dprodDto = dproductsService.selectdproductsDetail(rseqid);
		       
		   
			model.addAttribute("dprodDto", dprodDto);
			
			return "dproducts/dproductsModify";
		}
		
	
		@PostMapping("dproductsUpdate/{rseqid}")
		@ResponseBody
		public String dproductsUpdate(@PathVariable int rseqid, DprodDto dto,HttpSession session) throws Exception {
			
			// 저장완료(1), 저장실패(3)
			String msg = "1";
			String user_id = (String)session.getAttribute("SESSION_USERID");
			dto.setRseqid(rseqid);

			int result = dproductsService.dproductsUpdate(dto);
			if (result == 0) {
				msg = "0";
			}

			return msg;
		} 
		
		 /*
		@PostMapping("passUpdate")
		@ResponseBody
		public String updateMemberPass(  String pass
				 						,String pass1
										,HttpSession session) throws Exception {
			
			String msg = "1";
			String pname = (String)session.getAttribute("SESSION_PNAME");
			
			// 암호 비교
			int cnt = dproductsService.selectdproductsPass(pname, pass1);
			if( cnt == 0 ) msg = "2";
			else {
				dproductsService.updatedproductsPass(pname,pass1);
				session.invalidate(); // 모든 세션 삭제
			}
			return msg;
		}*/
		
		
		@GetMapping("dAdminList")
		public String dAdminList(ModelMap model, DefaultDto dto) throws Exception {
		
		List<?> list = dproductsService.selectProductsList(dto);

		model.addAttribute("resultList", list);
		
		return "dproducts/dAdminList";
		}
		
		@PostMapping("dproductsDeleteEach")
		@ResponseBody
		public String dproductsDeleteEach(String datas) throws Exception {
			String msg = "ok";
			// 1026,1025,1024,1023,
			datas = datas.substring(0,datas.length()-1);
			
			int result = dproductsService.deletedproductsEach(datas);
			System.out.println( "datas :::::: " + datas );
			if( result == 0 ) msg = "fail";
			
			return msg;
		}
		
		
		@GetMapping("cateAdmin")
		public String cateAdmin(ModelMap model) throws Exception {
			
			List<?> list = dproductsService.selectCategoryList();
			model.addAttribute("resultList", list);
			
			return "dproducts/cateAdmin";
		}
		
		@PostMapping("categoryInput")
		@ResponseBody
		public String insertCategory(CateDto dto) throws Exception {
			
			String msg = "1";
			if(dto.getOrd() == 1000) {
				dto.setOrd(0);
			}		
			// 순번 업데이트 서비스 실행
			dproductsService.updateCategoryOrd(dto);
			// 저장 서비스 실행
			dproductsService.insertCategory(dto);
			
			return msg;
		}
		
		@PostMapping("categoryUpdate")
		@ResponseBody
		public String updateCategory(CateDto dto) throws Exception {
			
			String msg = "1";
			// 기존 카테 배치번호
			int oldOrd = dto.getCate_old_ord();
			
			// 새로 카테 배치번호
			int newOrd = dto.getCate_ord();
			
			if( oldOrd != newOrd ) {
				// 순번 업데이트 서비스 실행 (수정상황)
				dproductsService.updateCategoryOrd2(dto);
			}

			// 수정 서비스 실행
			dproductsService.updateCategory(dto);
			
			return msg;
		}
		
		@PostMapping("categoryDelete")
		@ResponseBody
		public String deleteCategory(CateDto dto) throws Exception {
			
			String msg = "1";

			// 삭제 서비스 실행
			int cnt = dproductsService.deleteCategory(dto);

			// 배치순서 서비스 실행 (삭제상황)
			int result = dproductsService.updateCategoryOrd3(dto);
			
			return msg;
		}
		
	
	
}









