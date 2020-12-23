package com.lottery.dao.impl;

import com.lottery.dao.BaseDao;
import com.lottery.dao.PlayerDao;
import com.lottery.entity.Player;

public class PlayerDaoImpl implements PlayerDao {

	@Override
	public void insertPlayer(Player player) {
		// TODO Auto-generated method stub
		String sql = "insert into player values(null,?)";
		BaseDao.executeUpdate(sql, player.getName());
	}

}
