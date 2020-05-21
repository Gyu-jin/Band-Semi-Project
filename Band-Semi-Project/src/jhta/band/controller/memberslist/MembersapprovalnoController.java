package jhta.band.controller.memberslist;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/approvalno.do")
public class MembersapprovalnoController extends HttpServlet{
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("name");//�г���
		int user_num=Integer.parseInt(req.getParameter("num"));//���� ��ȣ
		
		HttpSession session=req.getSession();//��� ��ȣ
		int band_n=(int) session.getAttribute("b_n");

		
		memberslistDao dao=new memberslistDao();
		int n=dao.updateapproved2(name,user_num,band_n);
		
		if(n==1) {
			 resp.setContentType("text/xml;charset=utf-8");
			 PrintWriter pw=resp.getWriter();
			 pw.print("<?xml version='1.0' encoding='utf-8' ?>");
			 pw.print("<result1>");	
				 pw.print("<deleted>���� ������ �Ϸ�Ǿ����ϴ�</deleted>");				
			 pw.print("</result1>");
		}else {
			resp.setContentType("text/xml;charset=utf-8");
			 PrintWriter pw=resp.getWriter();
			 pw.print("<?xml version='1.0' encoding='utf-8' ?>");
			 pw.print("<result1>");
				 pw.print("<deleted>���� ������ �����Ͽ����ϴ�.</deleted>");
			 pw.print("</result1>");
		}
	}
}
