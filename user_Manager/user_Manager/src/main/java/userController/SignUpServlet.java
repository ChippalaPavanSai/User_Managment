package userController;

import java.io.IOException;

import javax.persistence.EntityManager;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userDao.UsersDao;

@WebServlet("/register")
public class SignUpServlet extends HttpServlet
{
	private UsersDao dao=new UsersDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String id=req.getParameter("id");
		String name=req.getParameter("name");
		String password=req.getParameter("password");
		String role=req.getParameter("role");
		boolean result=dao.checkRegisterUser(name);
		if(result)
		{
			System.out.println("Here the user already exists");
		}
		else
		{
			dao.saveUser(new userDto.users(0, name, password, role));
			req.setAttribute("success", "Successfully Registered");
			RequestDispatcher dispatcher=req.getRequestDispatcher("login.jsp");
			dispatcher.include(req, resp);
			System.out.println("The record is saved");
		}
		
	}
}
