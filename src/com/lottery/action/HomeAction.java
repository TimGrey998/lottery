package com.lottery.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.biz.PrizeBiz;
import com.lottery.biz.impl.PrizeBizImpl;
import com.lottery.entity.Prize;

/**
 * Servlet implementation class HomeAction
 */
@WebServlet("/homeAction")
public class HomeAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HomeAction() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrizeBiz biz = new PrizeBizImpl();
		System.out.println("到达homepage"+request.getMethod());
		switch(request.getMethod().toLowerCase()) {
		case "get":
			List<Prize> prizes = biz.getPrizes();
			request.setAttribute("prizes", prizes);
			request.getRequestDispatcher("/WEB-INF/page/admin/home.jsp").forward(request, response);
			break;
		case "switch":
			break;
		}
	}

}
