package com.lottery.biz.impl;

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

}
