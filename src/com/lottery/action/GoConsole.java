package com.lottery.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.biz.PlayerBiz;
import com.lottery.biz.impl.PlayerBizImpl;
import com.lottery.entity.Player;

/**
 * Servlet implementation class GoConsole
 */
@WebServlet("/goConsole")
public class GoConsole extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GoConsole() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PlayerBiz biz = new PlayerBizImpl();
		switch(request.getMethod().toLowerCase()) {
		case "get":
			List<Player> players = biz.getPlayer();
			request.setAttribute("players", players);
			request.getRequestDispatcher("/WEB-INF/page/admin/console.jsp").forward(request, response);
			break;
		case "post":
			break;
		}
	}

}
