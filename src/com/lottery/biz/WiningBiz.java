package com.lottery.biz;

import java.util.List;

import com.lottery.entity.Wining;

public interface WiningBiz {
	void insertWining(Wining wining);
	List<Wining> getWiningList();
}
