package userController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import userDao.RequestsDao;

@WebServlet("/handleRequest")

public class ApprovalServelet extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String action = req.getParameter("action");
        RequestsDao requestsDao = new RequestsDao();
        System.out.println(action);

        if (action != null) {
            String[] actionData = action.split("_");
            String actionType = actionData[0];  // "approve" or "reject"
            int requestId = Integer.parseInt(actionData[1]);

            if ("approve".equals(actionType)) {
                requestsDao.updateRequestStatus(requestId, "Approved");
            } else if ("reject".equals(actionType)) {
                requestsDao.updateRequestStatus(requestId, "Rejected");
            }
        }

        resp.sendRedirect("pendingRequests.jsp");
    }

}
