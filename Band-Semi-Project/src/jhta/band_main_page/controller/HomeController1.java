package jhta.band_main_page.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.catalina.core.ApplicationContext;

import jhta.band.dao.board.ImgBoardDao;
import jhta.band.vo.board.ImgBoardVo;
import sun.awt.RepaintArea;

@WebServlet("/rladudsh.do")
public class HomeController1 extends HttpServlet {
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//��� ��ȣ
		int BANDNUM=Integer.parseInt(req.getParameter("band_numnum"));
		HttpSession paramBANDinfo = req.getSession();
		paramBANDinfo.setAttribute("b_n", BANDNUM);
		
		
		//�α��� num
		//int login_num=Integer.parseInt(req.getParameter("loginnum"));
		long login_num=(long)paramBANDinfo.getAttribute("login_num");
		
		
		
		
		band_main_page_infoDao dao=new band_main_page_infoDao();
		BandInfoDvo vo=dao.b_m_p_info(BANDNUM,login_num);
		
		//���� �̹���/�Ұ���/�̸�
		BandAllinfoDvo dvo=dao.bandAllinfo(BANDNUM);
		paramBANDinfo.setAttribute("imgname", dvo.getBandimg());
		
		paramBANDinfo.setAttribute("band_name", dvo.getBand_name());
		
		paramBANDinfo.setAttribute("band_intoroductio", dvo.getBand_intoroductio());
		
		//�ο���
		int bandmembers=dao.memberscount(BANDNUM);
		paramBANDinfo.setAttribute("memberscount", bandmembers);
		
		String date=dao.banddate(BANDNUM);
		int n=dao.countboard(BANDNUM);	
		paramBANDinfo.setAttribute("countboard", n);
		paramBANDinfo.setAttribute("band_Date", date);
		
		paramBANDinfo.setAttribute("vo", vo);
		String dudname=dao.dudmembersselect(login_num ,BANDNUM);
		paramBANDinfo.setAttribute("dudname", dudname);
		System.out.println("�̸�    " +dudname);
		if(vo==null || vo.getBand_approved()==3) {
			//��ȸ�� �̸�
			
			req.setAttribute("file", "/band_main_page/band_main_page_m1/band_page_data0.jsp");
		req.getRequestDispatcher("/band_main_page/band_main_page.jsp").forward(req, resp);
		}else {
			//��� ������:1  ȸ��:2  / ����� 3  ��ȸ��0  
			paramBANDinfo.setAttribute("band_approved", vo.getBand_approved());
			ImgBoardDao dao1=new ImgBoardDao();
			ArrayList<ImgBoardVo>  imglist=dao1.select(BANDNUM , 1 ,1);
			if(imglist!=null) {
			ImgBoardVo v = imglist.get(0);
			paramBANDinfo.setAttribute("imglist", v.getImg_url());
			System.out.println(imglist);
			}else {
				paramBANDinfo.setAttribute("imglist", "");
				System.out.println(imglist);

			}
			//�ֱٻ���
			//���� ��ȣ
			paramBANDinfo.setAttribute("userband_num", vo.getUser_Band_num());
			req.setAttribute("file", "/band_board/band_board.jsp");
			req.getRequestDispatcher("/band_main_page/band_main_page.jsp").forward(req, resp);
		}
	}
}
