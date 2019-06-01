package com.briup.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Sys_role;
import com.briup.bean.Sys_user;
import com.briup.dao.UserDao;
import com.briup.service.UserService;
import com.briup.util.PageUtil;



@Service
public class UserServiceImpl implements UserService{
	
	
	//角色
	@Autowired
	 private UserDao userDao;
	@Override
	public List<Sys_role> findAllRole() throws Exception {
		// TODO Auto-generated method stub
		List<Sys_role> allRole = userDao.getAllRole();
		return allRole;
	}
	@Override
	public void addRole(Sys_role role) throws Exception {
		// TODO Auto-generated method stub		
		userDao.addRole(role);
	}
	@Override
	public void updateRole(Sys_role role) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateRole(role);
	}
	
	@Override
	public void deleteRole(int role_id) throws Exception {
		// TODO Auto-generated method stub
		userDao.deleteRole(role_id);
	}

	//用户
	@Override
	public List<Sys_user> findAllMgr() throws Exception {
		// TODO Auto-generated method stub
		List<Sys_user> allMgr = userDao.getAllMgr();
		return allMgr;
	}
	
	@Override
	public void updateUser(Sys_user user) throws Exception {
		// TODO Auto-generated method stub
		userDao.updateUser(user);
	}
	@Override
	public void addUser(Sys_user user) throws Exception {
		// TODO Auto-generated method stub
		userDao.addUser(user);
	}

	@Override
	public void deleteUser(int usr_id) throws Exception {
		// TODO Auto-generated method stub
		userDao.deleteUser(usr_id);
	}
	@Override
	public Sys_role findOneRole(int role_id) throws Exception {
		// TODO Auto-generated method stub
		Sys_role oneRole = userDao.getOneRole(role_id);
		return oneRole;
	}
	
	
	
	

	@Override
	public Sys_user findlogin(String username, String password) throws Exception {
		Sys_user user = userDao.login(username, password);
		return user;
	}
	

	

	
	@Override
	public PageUtil<Sys_user> findAllUser(int curpage, int row) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public int getAllRows() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Sys_user findOneUser(int usr_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	

	
	

}
