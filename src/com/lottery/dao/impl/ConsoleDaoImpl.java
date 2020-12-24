package com.lottery.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.lottery.dao.BaseDao;
import com.lottery.dao.ConsoleDao;
import com.lottery.entity.Level;

public class ConsoleDaoImpl implements ConsoleDao {
	
	@Override
	public void changeLevelMemer(int level1, int level2, int level3) {
		// TODO Auto-generated method stub
		String sql = "update `player-level` set `level1`=?,`level2`=?,`level3`=? where id=1;";
		BaseDao.executeUpdate(sql, level1,level2,level3);
	}

	@Override
	public Level getLevelMember() {
		// TODO Auto-generated method stub
		String sql = "select * from `player-level`;";
		ResultSet rs = BaseDao.executeQuery(sql);
		Level level = new Level();
		try {
			if(rs.next()) {
				level.setLevel1(rs.getInt("level1"));
				level.setLevel2(rs.getInt("level2"));
				level.setLevel3(rs.getInt("level3"));
			}
			rs.close();
			return level;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			throw new RuntimeException(e);
		}
		
	}

}
