package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.DAO.TodoDAO;
import com.DB.DBconnect;

@WebServlet("/add-todo")
public class AddServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		
		String username = req.getParameter("username");
		String todo = req.getParameter("todo");
		String status = req.getParameter("status");
		
		
		
		TodoDAO dao = new TodoDAO(DBconnect.getConnetion());
		boolean f = dao.addTodo(username, todo, status);
		HttpSession seasson = req.getSession();
		
		if(f) { 
			seasson.setAttribute("sucessMsg", "Todo Added Sucessfully.");
			resp.sendRedirect("index.jsp");

		}
		else {
			seasson.setAttribute("failedMsg", "Somthing went wrong");
			resp.sendRedirect("index.jsp");
		}
	}
}
