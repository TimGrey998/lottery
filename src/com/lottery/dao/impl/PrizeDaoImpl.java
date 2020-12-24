package com.lottery.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.lottery.dao.BaseDao;
import com.lottery.dao.PrizeDao;
import com.lottery.entity.Prize;

public class PrizeDaoImpl implements PrizeDao {

	@Override
	public void insertPrize(Prize prize) {
		// TODO Auto-generated method stub
		String sql = "insert into prize values(null,?,?,?,?)";
		BaseDao.executeUpdate(sql, prize.getPrizeName(),prize.getLevel(),prize.getImage(),prize.getDesc());
	}

	@Override
	public List<Prize> getPrizes() {
		String sql = "select * from prize";
		try {
			ResultSet rs = BaseDao.executeQuery(sql);
			List<Prize> list = new ArrayList<>();
			while(rs.next()) {
				Prize prize = new Prize();
				prize.setPrizeId(rs.getInt("prizeId"));
				prize.setPrizeName(rs.getString("prizeName"));
				prize.setImage(rs.getString("image"));
				prize.setDesc(rs.getString("desc"));
				prize.setLevel(rs.getInt("level"));
				list.add(prize);
			}
			rs.close();
			return list;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	@Override
	public void changeInfo(Prize prize) {
		// TODO Auto-generated method stub/
		String sql = " update prize set prizeName=?, level=?, image=?, `desc`=? where prizeId=?";
		BaseDao.executeUpdate(sql,prize.getPrizeName(),prize.getLevel(),prize.getImage(),prize.getDesc(),prize.getPrizeId());
	}

	@Override
	public Prize getInfo(int id) {
		// TODO Auto-generated method stub
		String sql = "select * from prize where prizeId=?";
		ResultSet rs = BaseDao.executeQuery(sql,id);
		try {
			if(rs.next()) {
				Prize prize = new Prize();
				prize.setPrizeId(rs.getInt("prizeId"));
				prize.setPrizeName(rs.getString("prizeName"));
				prize.setImage(rs.getString("image"));
				prize.setDesc(rs.getString("desc"));
				prize.setLevel(rs.getInt("level"));
				return prize;
			} else {
				return null;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

}
