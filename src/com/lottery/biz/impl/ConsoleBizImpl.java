package com.lottery.biz.impl;

import com.lottery.biz.ConsoleBiz;
import com.lottery.dao.ConsoleDao;
import com.lottery.dao.impl.ConsoleDaoImpl;
import com.lottery.entity.Level;

public class ConsoleBizImpl implements ConsoleBiz {
	ConsoleDao dao = new ConsoleDaoImpl();
	
	@Override
	public void changeMember(int level1, int level2, int level3) {
		// TODO Auto-generated method stub
		dao.changeLevelMemer(level1, level2, level3);
	}

	@Override
	public Level getLevel() {
		return dao.getLevelMember();
	}

}
