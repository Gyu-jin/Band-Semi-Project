package jhta.band_main_page_set.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/mainpagedata.do")
public class BandMainPageDataController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//��� ���� ���� controller
		String cp=req.getContextPath();
		req.setAttribute("cp", cp);
		
		HttpSession sese=req.getSession();
		int  kkk=(int)sese.getAttribute("band_approved");
		
		if(kkk==0) { //��ȸ���϶� 
			req.setAttribute("file", "band_main_page_m1/band_page_data0.jsp");
			req.getRequestDispatcher("/band_main_page/band_main_page.jsp").forward(req, resp);
		}else { // ȸ�� /�������϶� 
			req.setAttribute("file", "band_main_page_m1/band_page_data12.jsp");
			req.getRequestDispatcher("/band_main_page/band_main_page.jsp").forward(req, resp);	
		}
	}
}
