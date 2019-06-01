package com.briup.web.controller.user;

import java.lang.ProcessBuilder.Redirect;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.briup.bean.Sys_role;
import com.briup.bean.Sys_user;
import com.briup.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	// 自动注入service对象
	@Autowired
	private UserService userService;

	@RequestMapping("/login")
	public String login(String name, String password,HttpSession session) throws Exception {
	
			// 调用service层进行业务逻辑处理
				 Sys_user user = userService.findlogin(name, password);
			 System.out.println(user);
		
		if (user != null && user.getUsr_flag() == 1) {
			Sys_role role = userService.findOneRole(user.getUsr_role_id());
			System.out.println(role);
			if (role.getRole_flag()==1) {
				session.setAttribute("user", user);
				session.setAttribute("role", role);				
				return "redirect:/index";
			}else {
				return "sign";
			}
			
		} else {
			return "sign";
		}
		

	}
		
}