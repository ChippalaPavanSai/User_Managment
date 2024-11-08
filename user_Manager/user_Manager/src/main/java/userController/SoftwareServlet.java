package userController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userDao.SoftwareDao;
import userDto.software;

@WebServlet("/createSoftware")
public class SoftwareServlet extends HttpServlet
{
	private SoftwareDao softwareDao=new SoftwareDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		//int id=Integer.parseInt(req.getParameter("id"));
		String sName=req.getParameter("name");
		String description=req.getParameter("description");
		String accessLevel=req.getParameter("accessLevel");
		softwareDao.saveSoftware(new software(0, sName, description, accessLevel));
		System.out.println("The software added successfully");
		req.setAttribute("success", "Software added successfully");
		RequestDispatcher dispatcher=req.getRequestDispatcher("createSoftware.jsp");
		dispatcher.include(req, resp);
	}
}
