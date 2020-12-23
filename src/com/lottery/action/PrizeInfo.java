package com.lottery.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lottery.biz.PrizeBiz;
import com.lottery.biz.impl.PrizeBizImpl;
import com.lottery.entity.Prize;

/**
 * Servlet implementation class PrizeInfo
 */
@WebServlet("/prizeInfo")
public class PrizeInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PrizeInfo() {
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
		PrizeBiz biz = new PrizeBizImpl();
		Prize prize = new Prize();
		switch(request.getMethod().toLowerCase()) {
		case "get":
			int id = Integer.parseInt(request.getParameter("id"));
			System.out.println("该奖品id为"+id);
			prize = biz.getPrizeInfo(id);
			System.out.println(prize.getPrizeName());
			request.setAttribute("prize", prize);
			request.getRequestDispatcher("/WEB-INF/page/admin/pageinfo.jsp").forward(request, response);
			break;
		case "post":
			break;
		}
	}

}
