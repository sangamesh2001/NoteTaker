<%@page import="com.girmiti.entity.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.girmiti.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes: Note taker</title>
<%@include file="add_all_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">All Notes</h1>
		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryProvider.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> list = q.list();
				for (Note n : list) {
				%>
				<div class="card mt-3">
					<img class="card-img-top m-4 mx-auto" style="max-width:120px;" src="img/notepad.png" alt="Card image cap">
					<div class="card-body px-5">
						<h5 class="card-title"><%= n.getTitle() %></h5>
						<p class="card-text"><%= n.getContent() %></p>
						<p><b class="text-primary">Date: <%=n.getAddedDate() %></b></p>
						
						<a href="DeleteServlet?note_id=<%=n.getId() %>" class="btn btn-danger">Delete</a>
						<a href="edit.jsp?note_id=<%=n.getId() %>" class="btn btn-primary mx-3">Update</a>
					</div>
				</div>
				<%
				}
				s.close();
				%>
			</div>
		</div>
	</div>
</body>
</html>