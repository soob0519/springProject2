package com.muzigae.controller;
 
import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.muzigae.dto.DbuyDto;
import com.muzigae.dto.DcartDto;
import com.muzigae.service.DbuyService;
import com.muzigae.service.DcartService;

import jakarta.annotation.Resource;

@Controller
public class DbuyController {

 
	@Resource
	DbuyService dbuyService;
	
	   
	
	@GetMapping("dBuyIndex")
	public String index(DbuyDto dto, ModelMap model) throws Exception{
		//List<?> list = dbuyService.selectBuyList(dto);
		//model.addAttribute("list", list);
		//System.out.println("list : " + list);
		return "buy/dBuyIndex";
	}
	
	@GetMapping("dResultBuy")
	public String result(DbuyDto dto, ModelMap model) throws Exception{
		//List<?> list = dbuyService.selectBuyList(dto);
		//model.addAttribute("list", list);
		//System.out.println("list : " + list);
		return "dresult/dResultBuy";
	}
	
}