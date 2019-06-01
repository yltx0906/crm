package com.briup.web.controller.sale;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.briup.bean.Salchance;
import com.briup.bean.Salplan;
import com.briup.bean.Sys_user;
import com.briup.service.SalchanceService;

@Controller
@RequestMapping("/sale")
public class SaleController {

	// 自动注入service对象
	@Autowired
	private SalchanceService  service;
    
	//主管
	@RequestMapping("/findallSale")
	public String findallSale(HttpSession session) throws Exception {
		List<Salchance> findallSale = service.findallSale();
		session.setAttribute("chances", findallSale);
		return "pages/Sale_sale";
	}

	@RequestMapping("/addChance")
	public String addChance(Salchance sc) throws Exception {
		service.saveChanceService(sc);
		return "redirect:/index";
	}

	@RequestMapping("/updateChance")
	public String updateChance(Salchance sc) throws Exception {
		service.updateChanceService2(sc);
		return "redirect:/index";
	}

	@RequestMapping("/deleteChance")
	public String deleteChance(int chc_id) throws Exception {
		service.deleteSalchance(chc_id);
		return "redirect:/sale/findallSale";
	}
	
	//经理
	@RequestMapping("/findChance")
	public String findSalPlans(HttpSession session) throws Exception {
	     Sys_user sys_user = (Sys_user) session.getAttribute("user");
	     System.out.println(sys_user);
	     
	     String usr_name = sys_user.getUsr_name();
		  List<Salchance> salchances = service.findSalchances(usr_name);
		
		 session.setAttribute("chances2", salchances);
		return "pages/Sale_kaifa";
	}

	@RequestMapping("/savePlan")
	public String savePlan(Salplan sp) throws Exception {
		service.savePlanService(sp);
		service.updateChanceService(sp.getPla_chc_id());
		return "redirect:/index";
	}

	@RequestMapping("/updatePlan")
	public String updatePlan(Salplan sp) throws Exception {
		service.updateSalplanService(sp);
		if("开发成功".equals(sp.getPla_result())) {
			service.updateStu3(sp.getPla_chc_id());
		}
		return "redirect:/index";
	}
}
