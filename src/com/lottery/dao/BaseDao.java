package com.lottery.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.sql.rowset.CachedRowSet;
import javax.sql.rowset.RowSetProvider;

public class BaseDao {
	private static String driverClass = "com.mysql.cj.jdbc.Driver"; // 5.0/8.0
	// jdbc:mysql://<host>:<port>/<database_name>
	private static String url = "jdbc:mysql://39.107.31.175:3306/lotterydb?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"; // 5.0/8.0
	private static String user = "gyf";
	private static String password = "1234";

	public static Connection getConnection() {
		try {
			Class.forName(driverClass);
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			throw new RuntimeException(e);
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	// 执行sql insert delete update 返回受影响的行数
	// delete from student where name=? and gener=? and stuno=?
	public static int executeUpdate(String sql, Object... args) {
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			if (args != null) {
				for (int i = 0; i < args.length; i++) {
					ps.setObject(i + 1, args[i]);
				}
			}
			int rows = ps.executeUpdate();
			ps.close();
			conn.close();
			return rows;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}

	public static ResultSet executeQuery(String sql, Object... args) {
		try {
			Connection conn = getConnection();
			PreparedStatement ps = conn.prepareStatement(sql);
			if (args != null) {
				for (int i = 0; i < args.length; i++) {
					ps.setObject(i + 1, args[i]);
				}
			}
			ResultSet rs = ps.executeQuery();
			CachedRowSet crs = RowSetProvider.newFactory().createCachedRowSet();
			crs.populate(rs);
			rs.close();
			ps.close();
			conn.close();
			return crs;
		} catch (SQLException e) {
			throw new RuntimeException(e);
		}
	}
}
