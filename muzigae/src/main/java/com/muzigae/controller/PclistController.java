package com.muzigae.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import com.muzigae.dto.DbuyDto;
import com.muzigae.service.PclistService;

@Controller
public class PclistController {
	
	@Autowired
	PclistService pclistService;
	
	
	@GetMapping("fullList")
	public String selectFullList(DbuyDto dto, ModelMap model) throws Exception {
		List<?> list = pclistService.selectFullList(dto);
		model.addAttribute("fullList",list);
		
		return "pclist/fullList";
	}
	
	
	@GetMapping("pcDetail")
	public String pcDetail() {
		return "pclist/pcDetail";
	}
	
	@GetMapping("canRequest")
	public String canRequest() {
		return "pclist/canRequest";
	}
	
}
