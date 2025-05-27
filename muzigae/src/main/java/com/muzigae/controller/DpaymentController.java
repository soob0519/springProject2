package com.muzigae.controller;
 
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.muzigae.dto.DbuyDto;
import com.muzigae.dto.DcartDto;
import com.muzigae.dto.DpaymentDto;
import com.muzigae.dto.DprodDto;
import com.muzigae.dto.DproductListWrapper;
import com.muzigae.dto.DpurchaseDto;
import com.muzigae.service.DbuyService;
import com.muzigae.service.DcartService;
import com.muzigae.service.DpaymentService;
import com.muzigae.service.DprodService;
import com.muzigae.service.DpurchaseService;

import ch.qos.logback.core.model.Model;
import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpSession;

@Controller
public class DpaymentController {

	@Resource
	DpaymentService dpaymentService;
	
	@Resource
	DbuyService dbuyService;
	
	@Resource
	DpurchaseService dpurchaseService;
	
	@Resource
	DprodService dprodService;
 
	@GetMapping("/payment")
	public String index(DpaymentDto dto, DbuyDto dto2, ModelMap model, HttpSession session) throws Exception{
	 
		List<String> selectedItems = (List<String>) session.getAttribute("selectedItems");
		 
		 
		List<?> list = dbuyService.selectBuyList(dto2);
		 
 

		 List<Map<String, Object>> productList = new ArrayList<>();
		 
		
		 if (selectedItems != null) {
			    for (String rseqid : selectedItems) {
			        List<?> list2 = dprodService.selectProdList(Integer.parseInt(rseqid));

			        for (Object obj : list2) {
			            if (obj instanceof Map) {
			                @SuppressWarnings("unchecked")
			                Map<String, Object> row = (Map<String, Object>) obj;
			                productList.add(row);
			            } else {
			                throw new IllegalStateException("Unexpected data type in list2: " + obj.getClass());
			            }
			        }
			    }
			}
		 
	 
		  int totalPrice = productList.stream()
				    .mapToInt(row -> {
				        Object priceObj = row.get("PRICE");
				        Object quanObj = row.get("QUAN");

				        int price = priceObj != null ? Integer.parseInt(priceObj.toString()) : 0;
				        int quan = quanObj != null ? Integer.parseInt(quanObj.toString()) : 0;

				        return price * quan;
				    })
				    .sum();
		  
		    model.addAttribute("productList", productList);
		  model.addAttribute("totalPrice", totalPrice);
 
		 
		return "/payment/index";
	}
	
	 
 
	
	@PostMapping("payment")
	public String index(@RequestParam(value = "selectedItems", required = false) List<String> selectedItems, Model model, RedirectAttributes redirectAttributes, HttpSession session) throws Exception{

		session.setAttribute("selectedItems", selectedItems);
		//redirectAttributes.addFlashAttribute("selectedItems", selectedItems);
		return "redirect:/payment";
		

	}
	

	@PostMapping("/payment/insert")
	public String insert(DpaymentDto dto1, DbuyDto dto2, DpurchaseDto dto3,
			@ModelAttribute("dproductList")  DproductListWrapper dproductListWrapper,
	                     Model model, HttpSession session) throws Exception {
  
		       
		int result1 = dbuyService.insertBuy(dto2);
		
 
		dto3.setBseqid(dto2.getBseqid()+1);    
		           
		      
		 List<DprodDto> dproductList = dproductListWrapper.getDproductList();
		 
		  for (DprodDto dto333 : dproductList) {
			  dto3.setRseqid(dto333.getRseqid());
		        dto3.setItem(dto333.getItem());
		        dto3.setColor(dto333.getColor());
		        dto3.setPrice(dto333.getPrice());
		        dto3.setQuan(dto333.getQuan());
		        dto3.setPname(dto333.getPname());
		        
			  dpurchaseService.insertPurchase(dto3);
		    }
		  
//		for (DprodDto dto33 : wrapper.getDproductList()) {
//	        DpurchaseDto dto333 = new DpurchaseDto();
//	 
//	        dto3.setRseqid(dto333.getRseqid());
//	        dto3.setItem(dto333.getItem());
//	        dto3.setColor(dto333.getColor());
//	        dto3.setPrice(dto333.getPrice());
//	        dto3.setQuan(dto333.getQuan());
//	        dto3.setPname(dto333.getPname());
//
//	        System.out.println("getRseqid ::: " + dto333.getColor());     
//	             
//	        dpurchaseService.insertPurchase(dto3);
//	    }
		 
 
	 	
	 	dto1.setBseqid(dto2.getBseqid()+1);
		
		int result3 = dpaymentService.insertPayment(dto1);
	 
           
		 
		
		session.removeAttribute("selectedItems");
		    
	 	return String.format("redirect:/buy/result/%d", dto2.getBseqid()+1);
		 
	}
	
	
	
	
	
	
	
	
	
	
	
	
}