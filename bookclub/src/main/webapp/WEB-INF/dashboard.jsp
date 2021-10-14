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
				<div class="d-flex flex-column">
					<div class="d-flex flex-row">
						<h1> Welcome, <span class="display-2"> <c:out value="${ loggedInUser.firstName }"/> </span> </h1>
					</div>
					<h5 class="mb-3 mt-1">Books from everyone's shelves:</h5>
				</div>
				<div class="d-flex flex-column text-end">
					<a href="/bookclub/logout" class="link link-light mt-4">Logout</a>
					<a href="/bookclub/books/new" class="link link-light">+ Add a book to my shelf</a>								
				</div>
			</div>
			<table class="table table-dark table-hover">
				<thead>
					<tr>
						<th>ID</th>
						<th>Title</th>
						<th>Author Name</th>
						<th>Posted By</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="book" items="${ allBooks }">
						<tr>
							<td> <c:out value="${ book.id }" /> </td>
							<td> <a href="/bookclub/books/${ book.id }" class="link link-light"> <c:out value="${ book.title }" /> </a> </td>
							<td> <c:out value="${ book.author }" /> </td>
							<td> <c:out value="${ book.user.firstName } ${ book.user.lastName }" /> </td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</body>
</html>