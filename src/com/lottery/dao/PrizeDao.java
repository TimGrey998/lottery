package com.lottery.dao;

import java.util.List;

import com.lottery.entity.Prize;

public interface PrizeDao {
	void insertPrize(Prize prize);
	Prize getInfo(int id);
	void changeInfo(Prize prize);
	List<Prize> getPrizes();
}
