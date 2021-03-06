package jhta.band.controller.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jhta.band.bandSerch.Dao.bandDao;
import jhta.band.bandSerch.Vo.bandSerchVo;
import jhta.band.bandSerch.Vo.bandVo;
import jhta.band.dao.loginDao;
import jhta.band.vo.JoinVo;
import jhta.band.vo.loginVo;
import jhth.band.dao.MakeBandDao.BandListDao;
import jhth.band.vo.MakeBandVo.BandListVo;
@WebServlet("/SendLogin.do")
public class SendLoginController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String loginId = req.getParameter("loginId");
		String loginPwd = req.getParameter("loginPwd");
		
		loginDao dao = new loginDao();
		long a = dao.select(loginId, loginPwd);
		
		HttpSession session = req.getSession();
		
		if(a <= 0) {
			
		}else {
			session.setAttribute("login_num", a);
			
			BandListDao listdao=new BandListDao();
			
			ArrayList<BandListVo>bandlist=listdao.band_list(a);

			String file=req.getParameter("file");
			
			req.getSession().setAttribute("header", "bandList_header.jsp");
			req.setAttribute("bandlist", bandlist);
			
			if(file == null) {
				req.setAttribute("file", "/BandList/bandList.jsp");
			}else {
				req.setAttribute("file", file);
			}
			
			req.setAttribute("footer","/serch/random_band.jsp");
			  bandDao dao1=new bandDao();
			  ArrayList<bandSerchVo> random_list=dao1.random();
			  req.setAttribute("random_list",random_list);
			
			req.getRequestDispatcher("/MakingBand/bandList_layout.jsp").forward(req,resp);
		}
	}
}
