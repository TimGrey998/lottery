package com.lottery.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.lottery.dao.AdminDao;
import com.lottery.dao.BaseDao;
import com.lottery.entity.Admin;

public class AdminDaoImpl implements AdminDao {

	@Override
	public Admin findAdmin(String name) {
		String sql = "select * from admin where name=?";
		ResultSet rs = BaseDao.executeQuery(sql, name);
		Admin admin = null;
		try {
			if(rs.next()) {
				admin = new Admin();
				admin.setId(rs.getInt("id"));;
				admin.setName(rs.getString("name"));
				admin.setPwd(rs.getString("psw"));
			}
			System.out.println("存在该用户");
			return admin;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

}
