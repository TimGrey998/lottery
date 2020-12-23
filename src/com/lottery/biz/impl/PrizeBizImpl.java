package com.lottery.biz.impl;

import java.util.List;

import com.lottery.biz.PrizeBiz;
import com.lottery.dao.PrizeDao;
import com.lottery.dao.impl.PrizeDaoImpl;
import com.lottery.entity.Prize;

public class PrizeBizImpl implements PrizeBiz {
	PrizeDao dao = new PrizeDaoImpl();
	@Override
	public void addPrize(Prize prize) {
		// TODO Auto-generated method stub
		dao.insertPrize(prize);
	}

	@Override
	public List<Prize> getPrizes() {
		// TODO Auto-generated method stub
		System.out.println("到达Biz层(prize)");
		List<Prize> prizes = dao.getPrizes();
		return prizes;
	}

	@Override
	public Prize getPrizeInfo(int id) {
		// TODO Auto-generated method stub
		return dao.getInfo(id);
	}

}
