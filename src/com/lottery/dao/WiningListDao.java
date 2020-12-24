package com.lottery.dao;

import java.util.List;

import com.lottery.entity.Wining;

public interface WiningListDao {
	void insertWining(Wining wining);
	List<Wining> getWining();
}
