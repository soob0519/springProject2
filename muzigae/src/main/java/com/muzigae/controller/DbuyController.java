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
public class DbuyController {

 
	@Resource
	DbuyService dbuyService;
	
	   
	
	@GetMapping("buy/list")
	public String index(DbuyDto dto, ModelMap model) throws Exception{
		List<?> list = dbuyService.selectBuyList(dto);
		model.addAttribute("list", list);
		System.out.println("list : " + list);
		return "buy/dBuyIndex";
	}
	
	
	@GetMapping("buy/result/{bseqid}")
	public String result(@PathVariable int bseqid, ModelMap model) throws Exception{
		//List<?> list = dbuyService.selectBuyList(dto);
		//model.addAttribute("list", list);
		//System.out.println("list : " + list);
		DbuyDto dto = dbuyService.selectBuy(bseqid);
		
		//List<?> dto2 = dbuyService.selectBuyList02(bseqid);
		
		model.addAttribute("data", dto);
	//	System.out.println(dto2);
		
		return "dresult/dResultBuy";
	}
	
	
	@PostMapping("buy/insert")
	public String insert(@RequestParam(value = "selectedItems", required = false) List<String> selectedItems, Model model) throws Exception{
		//List<?> list = dcartService.selectCartList(dto);
		//model.addAttribute("list", list);
		System.out.println(selectedItems);
		return "buy/dBuyInsert";
	}
	
}