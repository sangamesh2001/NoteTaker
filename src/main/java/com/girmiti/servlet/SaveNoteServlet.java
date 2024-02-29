package com.girmiti.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.girmiti.entity.Note;
import com.girmiti.helper.FactoryProvider;


public class SaveNoteServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		Note note = new Note(title, content, new Date());
		System.out.println(note);
		System.out.println(note.getTitle());
		
		Session session = FactoryProvider.getFactory().openSession();
		Transaction tx = session.beginTransaction();
		
		session.save(note);
		tx.commit();
		session.close();
		response.setContentType("text/html");
		PrintWriter writer = response.getWriter();
		writer.println("<h1 style= 'text-align:center';>Added successfully</h1>");
		writer.println("<h1 style= 'text-align:center;'><a href='all_note.jsp'>View all notes</a></h1>");
	}

}