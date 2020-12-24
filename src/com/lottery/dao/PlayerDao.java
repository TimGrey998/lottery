package com.lottery.dao;

import java.util.List;

import com.lottery.entity.Player;

public interface PlayerDao {
	void insertPlayer(Player player);
	List<Player> getPlayers();
}
