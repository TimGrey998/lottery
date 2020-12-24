package com.lottery.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.biz.ConsoleBiz;
import com.lottery.biz.impl.ConsoleBizImpl;

/**
 * Servlet implementation class Console
 */
@WebServlet("/goConsole")
public class Console extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Console() {
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
		switch(request.getMethod().toLowerCase()) {
		case "get":
			request.getRequestDispatcher("/WEB-INF/page/admin/console.jsp").forward(request, response);
			break;
		case "post":
			System.out.println("ConsoleServlet");
			ConsoleBiz biz = new ConsoleBizImpl();
			int level1 = Integer.parseInt(request.getParameter("level1"));
			int level2 = Integer.parseInt(request.getParameter("level2"));
			int level3 = Integer.parseInt(request.getParameter("level3"));
			biz.changeMember(level1, level2, level3);
			request.getRequestDispatcher("/WEB-INF/page/admin/main.jsp").forward(request,response);
			break;
		}
	}

}
