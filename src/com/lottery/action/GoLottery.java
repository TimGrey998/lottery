package com.lottery.action;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.biz.ConsoleBiz;
import com.lottery.biz.PlayerBiz;
import com.lottery.biz.impl.ConsoleBizImpl;
import com.lottery.biz.impl.PlayerBizImpl;
import com.lottery.dao.BaseDao;
import com.lottery.entity.Level;
import com.lottery.entity.Player;

/**
 * Servlet implementation class GoLottery
 */
@WebServlet("/goLottery")
public class GoLottery extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoLottery() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String sql = "update wining set winingIds=null where id = 1";
		switch(request.getMethod().toLowerCase()) {
		case "get":
			PlayerBiz playerbiz = new PlayerBizImpl();
			ConsoleBiz levelbiz= new ConsoleBizImpl();
			List<Player> players = new ArrayList<>();
			players = playerbiz.getPlayer();
			Level level = levelbiz.getLevel();
			request.setAttribute("players", players);
			request.setAttribute("level", level);
			BaseDao.executeUpdate(sql);
			request.getRequestDispatcher("/WEB-INF/page/lottery/lottery.jsp").forward(request, response);;
			break;
		case "post":
			break;
		}
	}

}
