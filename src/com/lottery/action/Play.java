package com.lottery.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.biz.PlayerBiz;
import com.lottery.biz.impl.PlayerBizImpl;
import com.lottery.entity.Player;

/**
 * Servlet implementation class Play
 */
@WebServlet("/play")
public class Play extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Play() {
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
		System.out.println(request.getMethod());
		switch(request.getMethod().toLowerCase()) {
		case "get": 
			request.getRequestDispatcher("/WEB-INF/page/login.jsp").forward(request, response);
			break;
		case "post":
			Player player = new Player();
			player.setName(request.getParameter("name"));
			//insert into db
			PlayerBiz biz = new PlayerBizImpl();
			biz.addPlayer(player);
			System.out.println("添加成功");
			request.getRequestDispatcher("/WEB-INF/page/success.jsp").forward(request, response);
			break;
		}
	}

}
