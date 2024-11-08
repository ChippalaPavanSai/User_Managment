package userController;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


import userDao.UsersDao;
import userDto.users;

@WebServlet("/login")
public class LoginServlet extends HttpServlet
{
	private UsersDao dao=new UsersDao();
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String name=req.getParameter("username");
		String password=req.getParameter("password");
		users result=dao.signUpUser(name);
		if (result != null) 
		{
		
			String strongPsswd=result.getPassword();
			
			if(strongPsswd.equals(password)) 
			{
				String role=result.getRole();
				if(role.equals("admin")) {
					System.out.println("Admin login");
					RequestDispatcher dispatcher=req.getRequestDispatcher("createSoftware.jsp");
					dispatcher.include(req, resp);
				}
				else if(role.equals("manager")) {
					System.out.println("Manager Login");
					RequestDispatcher dispatcher=req.getRequestDispatcher("pendingRequests.jsp");
					dispatcher.forward(req, resp);
				}
				else if(role.equals("employee")){
					
					HttpSession session=req.getSession(true);
					session.setAttribute("employee", result);
					
					System.out.println("Employee Login");
					RequestDispatcher dispatcher=req.getRequestDispatcher("requests.jsp");
					dispatcher.forward(req, resp);
				}
			}
			else {
				req.setAttribute("mesg", "Enter Password is Wrong plz check..");
				RequestDispatcher dispatcher=req.getRequestDispatcher("login.jsp");
				dispatcher.include(req, resp);
			}
		}
		else {
			req.setAttribute("mesg", "User don't have account-->Go to register");
			RequestDispatcher dispatcher=req.getRequestDispatcher("login.jsp");
			dispatcher.include(req, resp);
		}
	}
}
