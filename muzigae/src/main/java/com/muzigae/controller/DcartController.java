package com.muzigae.controller;
 
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.muzigae.dto.DbuyDto;
import com.muzigae.dto.DcartDto;
import com.muzigae.service.DbuyService;
import com.muzigae.service.DcartService;

import ch.qos.logback.core.model.Model;
import jakarta.annotation.Resource;

@Controller
public class DcartController {

	@Resource
	DcartService dcartService;
	
	@Resource
	DcartService dprodService;
	
	@Resource
	DbuyService dbuyService;
	
	@GetMapping("dCartList")
	public String list(DcartDto dto, ModelMap model) throws Exception{
		List<?> list = dcartService.selectCartList(dto);
		model.addAttribute("list", list);
		
	 
		
		
		System.out.println("list : " + list);
		return "cart/dCartList";
	}
	
	@PostMapping("cart/insert")
	public String insert(@RequestParam(value = "selectedItems", required = false) List<String> selectedItems, Model model) throws Exception{
		//List<?> list = dcartService.selectCartList(dto);
		//model.addAttribute("list", list);
		System.out.println(selectedItems);
		return "buy/dBuyIndex";
	}
	
	
	
	
//	@GetMapping("dCartList")
//	public String dcartList(DcartDto dto, ModelMap model) throws Exception{
//		
//		List<?> list = dcartService.selectCartList(dto);
//		model.addAttribute("dcartlist",list);
//		System.out.println("list : " + list);
//		
//		return "cart/dCartList";
//	}
//	
//	@GetMapping("dCartResult/{seqid}")
//	public String dCartResult(@PathVariable int seqid, DbuyDto dto, ModelMap model) throws Exception {
//		
//		DbuyDto vo = dbuyService.selectBuy(seqid);
//		
//		model.addAttribute("data", vo);
//		System.out.println("dCartResult : " + vo);
//		
//		return "cart/dCartResult";
//	}
//	
// 
//	
//	@GetMapping("dCartAllBuy")
//	public String dCartAllBuy() {
//		return "cart/dCartAllBuy";
//	}
//	
//	
//	
//	@GetMapping("dBuyList")
//	public String dBuyList(DbuyDto dto, ModelMap model) throws Exception{
//		 
//		List<?> list = dbuyService.selectBuyList(dto);
//		model.addAttribute("list", list);
//		System.out.println("list : " + list);
//		 
//		 
//		
//		return "buy/list";
//	}
//	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}