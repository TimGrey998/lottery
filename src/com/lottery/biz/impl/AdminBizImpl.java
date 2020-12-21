package com.lottery.biz.impl;

import com.lottery.biz.AdminBiz;
import com.lottery.dao.AdminDao;
import com.lottery.dao.impl.AdminDaoImpl;
import com.lottery.entity.Admin;

public class AdminBizImpl implements AdminBiz {
	
	AdminDao dao = new AdminDaoImpl();
	
	@Override
	public Admin checkUser(String name, String psw) {
		Admin admin =dao.findAdmin(name);
		if(admin != null) {
			if(admin.getPwd().equals(psw)) return admin;
		}
		return null;
	}

}
