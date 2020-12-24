package com.lottery.dao;

import com.lottery.entity.Level;

public interface ConsoleDao {
	void changeLevelMemer(int level1,int level2,int level3);
	Level getLevelMember();
}
