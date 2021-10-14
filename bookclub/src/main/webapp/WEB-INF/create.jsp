<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
	<head>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
		<meta charset="ISO-8859-1">
		<title> BOOK CLUB </title>
	</head>
	<body class="p-3 bg-secondary text-light">
		<div class="container">
			<div class="d-flex flex-row justify-content-between">
				<h1 class="display-5 mb-5"> Add a book to Your Shelf </h1>
				<a href="/bookclub/dashboard" class="link link-light mt-4">back to the shelves</a>
			</div>
			<form:form action="/bookclub/books/create" modelAttribute="newBook" method="post" class="form" style="width: 80%;">
				<div class="col text-end mb-1">
					<form:errors path="title" class="text-danger text-end"></form:errors>
					<form:errors path="author" class="text-danger text-end"></form:errors>
					<form:errors path="myThoughts" class="text-danger text-end"></form:errors>
				</div>
				<div class="d-flex flex-row justify-content-between mb-3">
					<form:label path="title" class="form-label fs-4 me-4" >Title</form:label>
					<form:input path="title" class="form-control ms-5" style="max-width: 550px;" />
				</div>
				<div class="d-flex flex-row justify-content-between mb-3">
					<form:label path="author" class="form-label fs-4 me-4" >Author</form:label>
					<form:input path="author" class="form-control ms-4" style="max-width: 550px;" />
				</div>
				<div class="d-flex flex-row justify-content-between mb-3">
					<form:label path="myThoughts" class="form-label fs-4 me-4" >My Thoughts</form:label>
					<form:textarea path="myThoughts" class="form-control" style="max-width: 550px; height: 200px;" />
				</div>
				<div class="row justify-content-end pe-3">
					<input type="submit" class="btn btn-sm btn-primary align-self-end" value="Submit" style="max-width: 80px;" />
				</div>
			</form:form>
		</div>
	</body>
</html>