package com.lottery.biz.impl;

import java.util.List;

import com.lottery.biz.PlayerBiz;
import com.lottery.dao.PlayerDao;
import com.lottery.dao.impl.PlayerDaoImpl;
import com.lottery.entity.Player;

public class PlayerBizImpl implements PlayerBiz {
	PlayerDao dao = new PlayerDaoImpl();
	
	@Override
	public void addPlayer(Player player) {
		dao.insertPlayer(player);
	}

	@Override
	public List<Player> getPlayer() {
		// TODO Auto-generated method stub
		List<Player> players = dao.getPlayers();
		return players;
	}

	@Override
	public void resetPlayer() {
		// TODO Auto-generated method stub
		dao.resetPlayer();
	}

}
