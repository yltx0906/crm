package com.briup.service.impl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.briup.bean.Cst_customer;
import com.briup.bean.Salchance;
import com.briup.bean.Salplan;
import com.briup.dao.CustomerDao;
import com.briup.dao.SalDao;
import com.briup.service.SalchanceService;
import com.briup.util.PageUtil;

@Service
public class SalchanceServiceImpl implements SalchanceService{
	
	@Autowired
	private SalDao salDao;
	
	//主管
	@Override
	public List<Salchance> findallSale() throws Exception {
		// TODO Auto-generated method stub
		List<Salchance> findallSale = salDao.findallSale();
		return findallSale;
	}
	
	@Override
	public void saveChanceService(Salchance sc) throws Exception {
		// TODO Auto-generated method stub
		salDao.saveChance(sc);
	}
	@Override
	public void updateChanceService2(Salchance sc) throws Exception {
		// TODO Auto-generated method stub
		salDao.updatechance2(sc);
	}

	
	@Override
	public void deleteSalchance(Serializable chc_id) throws Exception {
		// TODO Auto-generated method stub
		salDao.deleteSalchance(chc_id);
	}

	//经理
	@Override
	public List<Salplan> findAllSalPlan() throws Exception {
		// TODO Auto-generated method stub
		List<Salplan> findAllSalplan = salDao.findAllSalplan();
		return findAllSalplan;
	}
	
	@Override
	public void savePlanService(Salplan sp) throws Exception {
		// TODO Auto-generated method stub
		salDao.savePlan(sp);
	}
	@Override
	public void updateSalplanService(Salplan sp) throws Exception {
		// TODO Auto-generated method stub
		salDao.updateSalplan(sp);
	}
	
	public List<Salchance> findSalchances(String usr_name) throws Exception{
		 List<Salchance> findSalchances = salDao.findSalchances(usr_name);
		return findSalchances;
	}
	public void updateChanceService(Serializable chc_id) throws Exception{
		salDao.updatechance(chc_id);
	}
	public void updateStu3(Serializable chc_id) throws Exception {
		
		salDao.updateStu3(chc_id);
	}
	
	
	
	
	@Override
	public void saveCustomerService(Cst_customer cc) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int getAllRows() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int getAllRowss() throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
	@Override
	public PageUtil<Salchance> findSalchanceByPageService(int curpage, int row) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}



	@Override
	public List<Salplan> findSalPlans(Serializable chc_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageUtil<Salplan> findSalplanByPageService(int curpage, int row) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	


	@Override
	public Salchance findOneSalchance(Serializable chc_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Salplan findSalplan(Serializable chc_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	
	

	@Override
	public void deleteSalplanService(Serializable pla_id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	

	@Override
	public void updateSalplanService(Serializable pla_chc_id) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public PageUtil<Salchance> findSalPageByCon(int curpage, int row, Salchance sc) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void updateSalplanService2(Salplan sp) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
