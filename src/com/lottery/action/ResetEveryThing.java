package com.lottery.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.dao.BaseDao;

/**
 * Servlet implementation class ResetEveryThing
 */
@WebServlet("/resetEveryThing")
public class ResetEveryThing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResetEveryThing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[] sql = {
				"truncate player",
				"update `player-level` set `level1` = 1,`level2` = 1,`level3` = 1 where id = 1",
				"truncate prize",
				"update wining set winingIds=null where id = 1",
				"truncate wininglist"
		};
		for(int i=0;i<5;i++) {
			BaseDao.executeUpdate(sql[i]);
		}
		response.sendRedirect("/lottery/main.jsp");
	}

}
