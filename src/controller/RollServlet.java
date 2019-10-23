package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Die;
import model.HighLow;

/**
 * Servlet implementation class RollServlet
 */
@WebServlet({ "/RollServlet", "/doRoll" })
public class RollServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RollServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//input
		Die d1 = new Die();
		Die d2 = new Die();
		int count = Integer.parseInt(request.getParameter("count"));
		HighLow input = new HighLow();
		double balance = Double.parseDouble(request.getParameter("balance"));
		input.setBalance(balance);
		String betType = request.getParameter("type");
		betType = betType.toLowerCase();
		double betAmount = Double.parseDouble(request.getParameter("betAmount"));
		input.setBetType(betType);
		input.setBetAmount(betAmount);
		
		boolean win = input.winLoss(d1.getValue(), d2.getValue());
		request.setAttribute("input", input);
		request.setAttribute("d1", d1.getValue());
		request.setAttribute("d2", d2.getValue());
		request.setAttribute("win",win);
		request.setAttribute("count", count);
		
		String url = "/roll.jsp";
		
		RequestDispatcher dispatch = request.getRequestDispatcher(url);
		dispatch.forward(request, response);
		
		
		
	}

}
