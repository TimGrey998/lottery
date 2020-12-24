package com.lottery.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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

	@Override
	public List<Player> getPlayers() {
		// TODO Auto-generated method stub
		String sql = "select * from player";
		ResultSet rs = BaseDao.executeQuery(sql);
		List<Player> list = new ArrayList<>();
		try {
			while(rs.next()) {
				Player player = new Player();
				player.setId(rs.getInt("id"));
				player.setName(rs.getString("name"));
				list.add(player);
			}
			rs.close();
			return list;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
	}

}
