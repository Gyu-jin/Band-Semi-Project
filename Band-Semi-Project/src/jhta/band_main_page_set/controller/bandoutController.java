package jhta.band_main_page_set.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/bandout.do")
public class bandoutController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//System.out.println("ȸ�� Ż��");
		HttpSession paramBANDinfo = req.getSession();
		int usernum=(int)paramBANDinfo.getAttribute("userband_num");
		//System.out.println("���� ��:"+usernum);
		int bandnum=(int)paramBANDinfo.getAttribute("b_n");
		//System.out.println("��� ��:" +bandnum);
		long login_num=(long)paramBANDinfo.getAttribute("login_num");
		//System.out.println(login_num + "        aaaaaaaaaa");
		bandmainpagesetdao dao=new bandmainpagesetdao();
		dao.bandout(bandnum,usernum);
		int n=dao.bandlistdout(bandnum,login_num);
		if(n==1) {
			req.getRequestDispatcher("banddelete.jsp").forward(req, resp);
		}
		
	}
	

}
