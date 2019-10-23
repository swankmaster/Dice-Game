package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class BetServlet
 */
@WebServlet(
		description = "User wants to place a bet",
		urlPatterns = { "/BetServlet", "/doBet" }
		
		)
public class BetServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BetServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// get input, 
		String url = "/betform.jsp";
		double balance = Double.parseDouble(request.getParameter("balance"));
		int count = Integer.parseInt(request.getParameter("count"));
		request.setAttribute("balance", balance);
		request.setAttribute("count", count);
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request,response);
	}

}
