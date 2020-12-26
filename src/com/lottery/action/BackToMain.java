package com.lottery.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.biz.WiningBiz;
import com.lottery.biz.impl.WiningBizImpl;
import com.lottery.dao.BaseDao;
import com.lottery.entity.Wining;
@WebServlet("/backToMain")
public class BackToMain extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BackToMain() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		switch (request.getMethod().toLowerCase()) {
		case "get":
			String res = request.getParameter("res");
			String len = request.getParameter("len");
			String levels = request.getParameter("levels");
			String sql = "update wining set winingIds =? where id=1";
			System.out.println("result"+res);
			System.out.println("len"+len);
			System.out.println("levels"+levels);
			Wining win = new Wining();
			WiningBiz biz = new WiningBizImpl();
			win.setSumMembers(Integer.parseInt(len));
			win.setWiningMembers(res);
			win.setWiningLevels(levels);
			biz.insertWining(win);
			BaseDao.executeUpdate(sql,res);
			response.sendRedirect("/lottery/main.jsp");
			break;
		}

	}


}
