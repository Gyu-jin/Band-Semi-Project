package jhta.band_main_page.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.core.ApplicationContext;

import sun.awt.RepaintArea;

@WebServlet("/rladudsh.do")
public class HomeController1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		//밴드 번호
		int BANDNUM=Integer.parseInt(req.getParameter("band_numnum"));
		HttpSession paramBANDinfo = req.getSession();
		paramBANDinfo.setAttribute("b_n", BANDNUM);
		//로그인 num
		int login_num=Integer.parseInt(req.getParameter("loginnum"));
		paramBANDinfo.setAttribute("loginNum", login_num);
	
		band_main_page_infoDao dao=new band_main_page_infoDao();
		BandInfoDvo vo=dao.b_m_p_info(BANDNUM,login_num);
		//등급 관리자:1  회원:2  / 대기중 3  비회원0  
		paramBANDinfo.setAttribute("band_approved", vo.getBand_approved());
		//유저 번호
		paramBANDinfo.setAttribute("userband_num", vo.getUser_Band_num());
		
		String cp=req.getContextPath();
		req.setAttribute("cp", cp);
		//벤드 이미지/소개글/이름
		BandAllinfoDvo dvo=dao.bandAllinfo(BANDNUM);
		paramBANDinfo.setAttribute("imgname", dvo.getBandimg());
		paramBANDinfo.setAttribute("band_name", dvo.getBand_name());
		paramBANDinfo.setAttribute("band_intoroductio", dvo.getBand_intoroductio());
		
		//인원수
	//	int bandmembers=dao.memberscount(BANDNUM);
		
		if(vo.getBand_approved()==0) {
		req.getRequestDispatcher("/band_main_page/band_main_page.jsp").forward(req, resp);
		req.setAttribute("file", "band_main_page_m1/band_page_data0.jsp");
		}else {
		req.getRequestDispatcher("/band_main_page/band_main_page.jsp").forward(req, resp);
		}
	}
}
