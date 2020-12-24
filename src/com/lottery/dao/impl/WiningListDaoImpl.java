package com.lottery.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lottery.dao.BaseDao;
import com.lottery.dao.WiningListDao;
import com.lottery.entity.Wining;

public class WiningListDaoImpl implements WiningListDao {

	@Override
	public void insertWining(Wining wining) {
		// TODO Auto-generated method stub
		String sql = "insert into wininglist values (NULL,?,?,?)";
		BaseDao.executeUpdate(sql, wining.getSumMembers(),wining.getWiningMembers(),wining.getWiningLevels());
	}

	@Override
	public List<Wining> getWining() {
		// TODO Auto-generated method stub
		String sql = "select * from wininglist";
		try {
			ResultSet rs = BaseDao.executeQuery(sql);
			List<Wining> list = new ArrayList<>();
			while(rs.next()) {
				Wining win = new Wining();
				win.setSumMembers(rs.getInt("sumMemebers"));
				win.setWiningMembers(rs.getString("WiningMembers"));
				win.setWiningLevels(rs.getString("winingLevel"));
				list.add(win);
			}			
			rs.close();
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

}
