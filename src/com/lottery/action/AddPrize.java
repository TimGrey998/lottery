package com.lottery.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import com.lottery.biz.PrizeBiz;
import com.lottery.biz.impl.PrizeBizImpl;
import com.lottery.entity.Prize;
import com.lottery.util.StringUtil;

@WebServlet("/addPrize")
@MultipartConfig
public class AddPrize extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		switch(request.getMethod().toLowerCase()) {
		case "get":
			request.getRequestDispatcher("/WEB-INF/page/admin/addPrize.jsp").forward(request,response);
			break;
		case "post":
			Prize prize = new Prize();
			PrizeBiz biz = new PrizeBizImpl();
			prize.setPrizeName(request.getParameter("prizeName"));
			prize.setLevel(Integer.parseInt(request.getParameter("level")));
			Part part= request.getPart("image");
			String filename = "";
			if(part!=null) {
				String exname=part.getSubmittedFileName().substring(part.getSubmittedFileName().lastIndexOf("."));
				filename=StringUtil.randomString()+exname;
				String path=request.getServletContext().getRealPath("/img/prizes/"+filename);
				part.write(path);
			}
			prize.setImage(filename);
			prize.setDesc(request.getParameter("desc"));
			biz.addPrize(prize);
			response.sendRedirect("/lottery/main.jsp");
			break;
		}
	}

}
