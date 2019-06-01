package com.briup.service.impl;

import java.io.Serializable;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Condition;
import com.briup.bean.Cst_activity;
import com.briup.bean.Cst_customer;
import com.briup.bean.Cst_linkman;
import com.briup.bean.Orders;
import com.briup.bean.Orders_line;
import com.briup.bean.Sys_user;
import com.briup.dao.CustomerDao;
import com.briup.service.CustomerService;
import com.briup.util.PageUtil;

@Service
public class CustomerServiceImpl implements CustomerService{
	
	@Autowired
	private CustomerDao customerDao;
	@Override
	public int getAllRows() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}
	//顾客
	public List<Cst_customer> findallCustomer() throws Exception {
		List<Cst_customer> allCustomer = customerDao.allCustomer();
		return allCustomer;
	}
	
	@Override
	public void saveCustomer(Cst_customer cst) throws Exception {
		// TODO Auto-generated method stub
		customerDao.addCustomer(cst);
	}

	@Override
	public void updateCustomer(Cst_customer c) throws Exception {
		// TODO Auto-generated method stub
		customerDao.updateCustomer(c);
	}
	@Override
	public void deleteCustomerById(Serializable id) throws Exception {
		// TODO Auto-generated method stub
		customerDao.delCustomerById(id);
	}
	
	//联系人
	@Override
	public List<Cst_linkman> findAllLinkman(Serializable id) throws Exception {
		// TODO Auto-generated method stub
		List<Cst_linkman> allLinkman = customerDao.allLinkman(id);
		return allLinkman;
	}
	@Override
	public void saveLinkMan(Cst_linkman lkm) throws Exception {
		// TODO Auto-generated method stub
		customerDao.addLinkMan(lkm);
	}
	@Override
	public void updateLinkman(Cst_linkman lkm) throws Exception {
		// TODO Auto-generated method stub
		customerDao.updateLinkman(lkm);
	}
	@Override
	public void deleteLinkMan(Serializable id) throws Exception {
		// TODO Auto-generated method stub
		customerDao.deleteLinkMan(id);
	}
	
	//交往记录
	@Override
	public void saveCst_activity(Cst_activity av) throws Exception {
		// TODO Auto-generated method stub
		customerDao.addCst_activity(av);
	}

	@Override
	public List<Cst_activity> findAllAcv(Serializable atv_cust_no) throws Exception {
		// TODO Auto-generated method stub
		List<Cst_activity> queryAllAcv = customerDao.queryAllAcv(atv_cust_no);
		return queryAllAcv;
	}
	@Override
	public void updateAtv(Cst_activity at) throws Exception {
		// TODO Auto-generated method stub
		customerDao.updateAtv(at);
	}

	@Override
	public void deleteAtv(Serializable atv_id) throws Exception {
		// TODO Auto-generated method stub
		customerDao.deleteAtv(atv_id);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	@Override
	public List<Cst_customer> findCustomerPage(int curpage, int row) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageUtil<Cst_customer> findCustomerPageByCon(int curpage, int row, Cst_customer cc) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Cst_customer findCustomerById(Serializable id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	

	

	

	@Override
	public Cst_linkman findLinkmanById(Serializable id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	



	@Override
	public Cst_activity findAtvById(Serializable atv_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public PageUtil<Cst_customer> findCstPage(int curpage, int row) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Orders findOrderById(Serializable id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageUtil<Cst_customer> findCstPageByCon(int curpage, int row, Condition con) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Sys_user> findSys_user() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	@Override
	public List<Orders> findOrderByCustId(int cust_id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Orders_line> findOrderLinesById(int odr_id) {
		// TODO Auto-generated method stub
		return null;
	}

}