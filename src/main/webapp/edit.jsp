<%@page import="com.girmiti.entity.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.girmiti.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@include file="add_all_css.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">Edit your note here</h1>
		<br>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id"));

		Session s = FactoryProvider.getFactory().openSession();
		Note note = s.get(Note.class, noteId);
		%>
		
		<form action="UpdateServlet" method="post">
			<input value= "<%=note.getId() %>" name="noteId" type="hidden">
			<div class="form-group">
			
				<label for="title">Note title</label> <input type="text"
					class="form-control"  name="title" id="title" aria-describedby="emailHelp"
					placeholder="Enter note here..." value="<%= note.getTitle()%>">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea id="content" placeholder="enter note content here.. "
					class="form-control" name="content" style="height:300px;" ><%= note.getContent() %> </textarea>
			</div>
			<div class="container text-center">
			<button type="submit" class="btn btn-success">Save your note</button>
				
			</div>
		</form>
	</div>
		
		
</body>
</html>
