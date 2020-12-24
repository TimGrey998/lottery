package com.lottery.biz;

import java.util.List;

import com.lottery.entity.Player;

public interface PlayerBiz {
	void addPlayer(Player player);
	List<Player> getPlayer();
}
