package com.lottery.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.biz.AdminBiz;
import com.lottery.biz.impl.AdminBizImpl;
import com.lottery.entity.Admin;

/**
 * Servlet implementation class Login
 */
@WebServlet("/login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		switch (request.getMethod().toLowerCase()) {
		case "get":
			request.getRequestDispatcher("/WEB-INF/page/login.jsp").forward(request, response);
			break;
		case "post":
			String name = request.getParameter("name");
			String pwd = request.getParameter("pwd");
			AdminBiz biz = new AdminBizImpl();
			Admin admin = biz.checkUser(name, pwd);
			System.out.print("验证成功"+admin);
			if (admin == null) {
				request.setAttribute("message", "用户名或密码错误");
				request.getRequestDispatcher("/WEB-INF/page/login.jsp").forward(request, response);
			} else {
				System.out.print("即将跳转");
				request.getRequestDispatcher("/WEB-INF/page/admin/admin.jsp").forward(request, response);
			}
			break;
		}

	}

}
