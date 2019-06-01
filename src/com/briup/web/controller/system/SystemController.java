package com.briup.web.controller.system;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.briup.bean.Sys_role;
import com.briup.bean.Sys_user;
import com.briup.service.UserService;

@Controller
@RequestMapping("/sys")
public class SystemController {

	// 自动注入service对象
	@Autowired
	private UserService service;

	@RequestMapping("/getAllUser")
	public String getAllUser(HttpSession session) throws Exception {

		List<Sys_role> findAllRole = service.findAllRole();
		session.setAttribute("roles", findAllRole);
		return "pages/System_juese";
	}

	@RequestMapping("/roleAdd")
	public String roleAdd(Sys_role role) throws Exception {

		service.addRole(role);
		return "redirect:/index";
	}

	@RequestMapping("/roleUpdate")
	public String roleUpdate(Sys_role role) throws Exception {

		service.updateRole(role);
		return "redirect:/index";
	}

	@RequestMapping("/roleDelete")
	public String roleDelete(int role_id) throws Exception {

	    service.deleteRole(role_id);
		return "redirect:/sys/getAllUser";
	}
	
	//用户
	@RequestMapping("/findAllMgr")
	public String findAllMgr(HttpSession session) throws Exception {
		List<Sys_user> findAllMgr = service.findAllMgr();
		session.setAttribute("users", findAllMgr);
		return "pages/System_yonghu";
	}

	@RequestMapping("/userAdd")
	public String userAdd(Sys_user user) throws Exception {
		Sys_role findOneRole = service.findOneRole(user.getUsr_role_id());
		user.setUsr_role_name(findOneRole.getRole_name());
		service.addUser(user);
		return "redirect:/index";
	}

	@RequestMapping("/userUpdate")
	public String userUpdate(Sys_user user) throws Exception {
		Sys_role findOneRole = service.findOneRole(user.getUsr_role_id());
		user.setUsr_role_name(findOneRole.getRole_name());
		service.updateUser(user);
		return "redirect:/index";
	}

	@RequestMapping("/userDelete")
	public String userDelete(int usr_id) throws Exception {
		service.deleteUser(usr_id);
		return "redirect:/sys/findAllMgr";
	}
}
