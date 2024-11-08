package userController;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import userDao.RequestsDao;
import userDao.SoftwareDao;
import userDto.requests;
import userDto.software;
import userDto.users;

@WebServlet("/requestAccess")
public class RequestServlet extends HttpServlet
{
	private RequestsDao dao=new RequestsDao();
	private SoftwareDao softwareDao=new SoftwareDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		
		String name=req.getParameter("software");
		String reason=req.getParameter("reason");
		String access=req.getParameter("access");
		HttpSession httpSession=req.getSession();
		users user=(users)httpSession.getAttribute("employee");
		int softwareId=Integer.parseInt(name.substring(0, 1));
		System.out.println(name+"\n "+reason+"\n "+access+"\n "+user+" \n"+softwareId);
		List<software>list=new ArrayList<software>();
		list.add(softwareDao.fetchSoftwareById(softwareId));
		requests requests=new requests(user, list, access, reason, "pending");
		dao.saveRequest(requests);
		req.setAttribute("added", name+" software requested sucess!!The request pass to the manager");
		RequestDispatcher dispatcher=req.getRequestDispatcher("requests.jsp");
		dispatcher.include(req, resp);
	}
}
