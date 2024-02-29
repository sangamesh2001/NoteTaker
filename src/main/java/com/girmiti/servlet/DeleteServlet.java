package com.girmiti.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.girmiti.entity.Note;
import com.girmiti.helper.FactoryProvider;

public class DeleteServlet extends HttpServlet{
     @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	 int note_id = Integer.parseInt(req.getParameter("note_id").trim());
    	Session session = FactoryProvider.getFactory().openSession();
    	Transaction transaction = session.beginTransaction();
    	Note note = session.get(Note.class, note_id);
    	session.delete(note);
    	transaction.commit();
    	session.close();
    	resp.sendRedirect("all_note.jsp");
    }
}
