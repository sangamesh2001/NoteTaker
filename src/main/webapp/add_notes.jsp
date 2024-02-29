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
		<h1>Please fill your note detail</h1>
		<form action="SaveNoteServlet" method="post">
			<div class="form-group">
				<label for="title">Note title</label> <input type="text"
					class="form-control"  name="title" id="title" aria-describedby="emailHelp"
					placeholder="Enter note here..." required="required">
			</div>
			<div class="form-group">
				<label for="content">Note Content</label>
				<textarea id="content" placeholder="enter note content here.. "
					class="form-control" name="content" style="height:300px;" required="required"></textarea>
			</div>
			<div class="container text-center">
			<button type="submit" class="btn btn-primary">Add</button>
				
			</div>
		</form>
	</div>

</body>
</html>