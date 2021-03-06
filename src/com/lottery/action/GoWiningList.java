package com.lottery.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.biz.PlayerBiz;
import com.lottery.biz.WiningBiz;
import com.lottery.biz.impl.PlayerBizImpl;
import com.lottery.biz.impl.WiningBizImpl;
import com.lottery.entity.Player;
import com.lottery.entity.Wining;

/**
 * Servlet implementation class GoWiningList
 */
@WebServlet("/goWiningList")
public class GoWiningList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoWiningList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("gowininglist");
		WiningBiz winbiz = new WiningBizImpl();
		PlayerBiz playerbiz = new PlayerBizImpl();
		List<Wining> wins = winbiz.getWiningList();
		List<Player> players = playerbiz.getPlayer();
		request.setAttribute("wins", wins);
		request.setAttribute("players", players);
		request.getRequestDispatcher("/WEB-INF/page/admin/wininglist.jsp").forward(request, response);
	}

}
