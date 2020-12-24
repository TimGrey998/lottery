package com.lottery.biz;

import com.lottery.entity.Level;

public interface ConsoleBiz {
	void changeMember(int level1,int level2,int level3);
	Level getLevel();
}
