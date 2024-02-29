package com.girmiti.servlet;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.girmiti.entity.Note;
import com.girmiti.helper.FactoryProvider;


public class UpdateServlet extends HttpServlet {
	
	protected void doPost(HttpServletRequest req, HttpServletResponse response) throws ServletException, IOException {
		
		String title = req.getParameter("title");
		String content = req.getParameter("content");
		int note_id = Integer.parseInt(req.getParameter("noteId").trim());
    	Session session = FactoryProvider.getFactory().openSession();
    	Transaction transaction = session.beginTransaction();
    	Note note = session.get(Note.class, note_id);
    	note.setTitle(title);
    	note.setContent(content);
    	note.setAddedDate(new Date());
    	transaction.commit();
    	session.close();
        response.sendRedirect("all_note.jsp");
	}

}
