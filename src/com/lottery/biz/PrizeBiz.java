package com.lottery.biz;

import java.util.List;

import com.lottery.entity.Prize;

public interface PrizeBiz {
	void addPrize(Prize prize);
	void changePrize(Prize prize);
	List<Prize> getPrizes();
	Prize getPrizeInfo(int id);
}
