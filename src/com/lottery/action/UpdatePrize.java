package com.lottery.action;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.lottery.biz.PrizeBiz;
import com.lottery.biz.impl.PrizeBizImpl;
import com.lottery.entity.Prize;
import com.lottery.util.StringUtil;

/**
 * Servlet implementation class UpdatePrize
 */
@WebServlet("/updatePrize")
@MultipartConfig
public class UpdatePrize extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePrize() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		Prize prize = new Prize();
		PrizeBiz biz = new PrizeBizImpl();
		HttpSession session = request.getSession();
		int id = Integer.parseInt(session.getAttribute("id").toString());
		prize.setPrizeName(request.getParameter("prizeName"));
		prize.setLevel(Integer.parseInt(request.getParameter("level")));
		Part part= request.getPart("image");
		String exname=part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf("."));
		String filename=StringUtil.randomString()+exname;
		String path=request.getServletContext().getRealPath("/img/prizes/"+filename);
		part.write(path);
		prize.setImage(filename);
		prize.setDesc(request.getParameter("desc"));
		prize.setPrizeId(id);
		biz.changePrize(prize);
		request.getRequestDispatcher("/WEB-INF/page/admin/main.jsp").forward(request,response);
	}

}
