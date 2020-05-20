package jhta.band.controller.update_userInfo;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import test.dao.UpdateInfoDao;
import test.dao.loginDao;
import test.vo.JoinVo;
@WebServlet("/Phone.do")
public class UpdatePhoneController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("utf-8");
		
		String phoneNumber = req.getParameter("phoneNumber");
		
		HttpSession session = req.getSession();
		long login_num = (long)session.getAttribute("login_num");
		
		UpdateInfoDao dao = new UpdateInfoDao();
		String phone = dao.updatePhone(phoneNumber, login_num);
		
		loginDao dao1 = new loginDao();
		JoinVo vo = dao1.selectInfo(login_num);
		
		req.setAttribute("joinVo", vo);
		req.getRequestDispatcher("MyInfo.jsp").forward(req,resp);
	}
}
