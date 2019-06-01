package com.briup.web.controller.customer;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.briup.bean.Cst_activity;
import com.briup.bean.Cst_customer;
import com.briup.bean.Cst_linkman;
import com.briup.service.CustomerService;

@Controller
@RequestMapping("/cust")
public class CustomerController {
	
	// 自动注入service对象
	@Autowired
	private CustomerService service;
	
	@RequestMapping("/findAllCustomers")
	public String findCustomers(HttpSession session) {
		try {
			//查出所有客户信
			List<Cst_customer> list = service.findallCustomer();
//			Cst_customer customer=list.get(1);
//			System.out.println(customer.toString());
			//将list放到session里面
			session.setAttribute("customers", list);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "pages/Info_find";
		
	}
	@RequestMapping("/add")
	public String addCustomers(Cst_customer cst) {
		try {
			service.saveCustomer(cst);
//			System.out.println(cst+"123");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "redirect:/index";	
	}
	
	@RequestMapping("/update")
	public String updateCustomers(Cst_customer c) {
		try {
			service.updateCustomer(c);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "redirect:/index";
		
	}
	@RequestMapping("/delete")
	public String deleteCustomers(int cust_id) {
		try {
			service.deleteCustomerById(cust_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "redirect:/cust/findAllCustomers";
		
	}
	
	@RequestMapping("/findLinkman")
	public String findLinkman(int cust_id,HttpSession session) {
		try {
			List<Cst_linkman> list = service.findAllLinkman(cust_id);
			session.setAttribute("linkmans", list);
			session.setAttribute("cust_id", cust_id);
		} catch (Exception e) {		
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "pages/Info_pencil";
		
	}
	@RequestMapping("/addLinkman")
	public String addLinkman(Cst_linkman lkm,HttpSession session) {
		try {
				service.saveLinkMan(lkm);
				int cust_id =(int)session.getAttribute("cust_id");
		} catch (Exception e) {		
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "redirect:/index";
		
	}
	@RequestMapping("/updateLinkman")
	public String updateLinkman(Cst_linkman lkm) {
		try {
			service.updateLinkman(lkm);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "redirect:/index";
		
	}
	@RequestMapping("/deleteLinkman")
	public String deleteLinkman(int lkm_id,HttpSession session) {
		int cust_id = 0;
		try {
			service.deleteLinkMan(lkm_id);
			cust_id = (int) session.getAttribute("cust_id");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "forward:/cust/findLinkman?cust_id="+cust_id;
		
	}
	@RequestMapping("/findAllActivity")
	public String queryAllAcv(int cust_id,HttpSession session) {
		try {
			    List<Cst_activity> findAllAcv = service.findAllAcv(cust_id);
			session.setAttribute("activitys", findAllAcv);
			session.setAttribute("cust_id", cust_id);
//			System.out.println("findAllAcv"+123);
		} catch (Exception e) {		
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "pages/Info_book";
		
	}
	@RequestMapping("/addActivities")
	public String addCst_activity(Cst_activity av,HttpSession session) {
		try {
				int cust_id =(int)session.getAttribute("cust_id");
				av.setAtv_cust_id(cust_id);
				service.saveCst_activity(av);
		} catch (Exception e) {		
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "redirect:/index";
		
	}
	@RequestMapping("/updateActivity")
	public String updateAtv(Cst_activity at) {
		try {
			service.updateAtv(at);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "redirect:/index";
		
	}
	@RequestMapping("/deleteOneActivity")
	public String deleteAtv(int atv_id,HttpSession session) {
		int cust_id = 0;
		try {
			service.deleteAtv(atv_id);
			cust_id = (int) session.getAttribute("cust_id");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//逻辑视图
		return "forward:/cust/findAllActivity?cust_id="+cust_id;
		
	}
	
}
