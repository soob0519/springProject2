package com.muzigae.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.muzigae.dto.DprodDto;
import com.muzigae.service.DprodService;

@Controller
public class DprodController {

	@Autowired
	DprodService dprodService;
	
	/**
	 * 상품목록 출력
	 */
	@GetMapping("prodTotalList")
	public String prodTotalList(DprodDto dprodDto, ModelMap model) throws Exception {
		
		List<?> list = dprodService.selectProdTotalList(dprodDto);
		model.addAttribute("totalList",list);
		
		return "prodDetail/prodTotalList";
	}
	
	/**
	 * 상품목록 출력
	 */
	@GetMapping("prodLipList")
	public String prodLipList(DprodDto dprodDto, ModelMap model) throws Exception {
		
		List<?> list = dprodService.selectProdLipList(dprodDto);
		model.addAttribute("lipList",list);
		
		return "prodDetail/prodLipList";
	}
	
	/**
	 * 상품목록 출력
	 */
	@GetMapping("prodEyeList")
	public String prodEyeList(DprodDto dprodDto, ModelMap model) throws Exception {
		
		List<?> list = dprodService.selectProdEyeList(dprodDto);
		model.addAttribute("eyeList",list);
		
		return "prodDetail/prodEyeList";
	}
	
	/**
	 * 상품목록 출력
	 */
	@GetMapping("prodFaceList")
	public String prodFaceList(DprodDto dprodDto, ModelMap model) throws Exception {
		
		List<?> list = dprodService.selectProdFaceList(dprodDto);
		model.addAttribute("faceList",list);
		
		return "prodDetail/prodFaceList";
	}
	
	
	/**
	 * 상품 상세페이지 출력
	 */
	@GetMapping("prodDetail/{rseqid}")
	public String prodDetail(@PathVariable int rseqid, ModelMap model) throws Exception {
		
		DprodDto dto = dprodService.selectProdDetail(rseqid);
		List<?> colorList = dprodService.selectProdColor(dto.getPname());
		
		model.addAttribute("dto",dto);
		model.addAttribute("colorList",colorList);
		
		return "prodDetail/prodDetail";
	}
	
	
	/**
	 * homepage 출력
	 */
	@GetMapping("home_page")
	public String homePage() throws Exception {
		return "home/home_page";
	}
	
	
	
	/**
	 * test
	 */
	@GetMapping("testFile")
	public String testFile() throws Exception {
		return "prodDetail/testFile";
	}
	
}
